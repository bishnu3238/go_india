import 'package:formz/formz.dart';
import 'package:go_india/package/input_field_models/input_field_model.dart';
import 'package:go_india/screens/common/common.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../domain/entity/entity.dart';

class BankAccountState {
  final List<XFile?> passbookImage;
  final Name bankName;
  final BankAccountNo accountNo;
  final IFSCCode ifscCode;
  final FormzSubmissionStatus status;
  final String? errorMessage;
  final bool isValid;

  BankAccountState(
      {this.accountNo = const BankAccountNo.pure(),
      this.ifscCode = const IFSCCode.pure(),
      this.bankName = const Name.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.errorMessage,
      this.passbookImage = const [],
      this.isValid = false});

  @override
  String toString() {
    return 'BankAccountState{accountNo: $accountNo, ifscCode: $ifscCode, passbookImage: $passbookImage, status: $status, errorMessage: $errorMessage, isValid: $isValid}';
  }

  BankAccountState copyWith({
    Name? bankName,
    BankAccountNo? accountNo,
    IFSCCode? ifscCode,
    List<XFile?>? passbookImage,
    FormzSubmissionStatus? status,
    String? errorMessage,
    bool? isValid,
  }) {
    return BankAccountState(
      bankName: bankName ?? this.bankName,
      accountNo: accountNo ?? this.accountNo,
      ifscCode: ifscCode ?? this.ifscCode,
      passbookImage: passbookImage ?? this.passbookImage,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
    );
  }
}


class BankAccountInitState extends BankAccountState{

  BankAccountInitState(BankInfo info):
        super
          (
          accountNo: BankAccountNo.dirty(info.accountNo),

            ifscCode :  IFSCCode.dirty(info.ifscCode),
             bankName :   Name.dirty(info.bankName),
            status : FormzSubmissionStatus.initial,
            errorMessage:'',
            passbookImage :   [],
            isValid :false

  );

}