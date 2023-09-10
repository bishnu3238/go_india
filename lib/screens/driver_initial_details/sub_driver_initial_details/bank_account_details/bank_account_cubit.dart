import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/domain/repository/repository.dart';
 import 'package:go_india/domain/store/driver_store.dart';
import 'package:go_india/screens/common/common.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entity/entity.dart';
import '../../../../package/package/package.dart';
import '../../../../utility/utility/utility.dart';

class BankAccountDetailsCubit extends Cubit<BankAccountState> {
  BankAccountDetailsCubit(
      this.notifier, this.driverStore, this.driverDetailsRepository)
      : super(BankAccountInitState(driverStore.state.driverDetails.bankInfo));

  final DriverDetailsRepository driverDetailsRepository;
  final DriverStore driverStore;
  final Notifier notifier;

  void changeAccount(String value) {
    BankAccountNo accountNo = BankAccountNo.dirty(value);

    emit(state.copyWith(
      accountNo: accountNo,
      isValid: Formz.validate([accountNo, state.bankName, state.ifscCode]),
    ));
  }

  void changeIfscCode(String value) {
    IFSCCode ifscCode = IFSCCode.dirty(value);

    emit(state.copyWith(
      ifscCode: ifscCode,
      isValid: Formz.validate([state.accountNo, state.bankName, ifscCode]),
    ));
  }

  Future<void> pickImage(BuildContext context) async {
    if (!context.mounted) return;
    await showImagePickingOptions(context).then(
      (value) => value.fold(
        (l) => notifier.errorMessage(context: context, message: l.message),
        (r) => emit(state.copyWith(passbookImage: r)),
      ),
    );
  }

  void changeBank(String value) {
    Name bankName = Name.dirty(value);

    emit(state.copyWith(
      bankName: bankName,
      isValid: Formz.validate([state.accountNo, state.ifscCode, bankName]),
    ));
  }

  Future<void> done(BuildContext context) async {
    BankInfo bankInfo = BankInfo(
        bankName: state.bankName.value,
        accountNo: state.accountNo.value,
        ifscCode: state.ifscCode.value,
        branchName: state.bankName.value,
        passbookImage: state.passbookImage[0]!.path);

    var info = driverStore.state.driverDetails.copyWith(bankInfo: bankInfo);
    var details = driverStore.state.copyWith(driverDetails: info);
    driverStore.setDriver(details);
    var data = bankInfo.toMap();
    data.putIfAbsent('driver_id', () => getIt<DriverStore>().state.id);
    data.log();
    var images = {'passbook_photo': state.passbookImage[0]!.path};

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await driverDetailsRepository.submitBankDetails(data, images).then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(status: FormzSubmissionStatus.failure));
              notifier.errorMessage(context: context, message: l.message);
            },
            (r) {
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              var cubit = context.read<DriverInitialDetailsCubit>();
              cubit.emit(cubit.state.copyWith(
                isBankDetailsDone: state.status.isSuccess,
              ));

              context.pop();
            },
          ),
        );
  }

  validatingMessage(BuildContext context) {
    notifier.errorMessage(
        context: context,
        message: state.isValid
            ? state.passbookImage.isEmpty
                ? 'Please pick your passbook image'
                : ''
            : 'Please enter required details');
  }
}
