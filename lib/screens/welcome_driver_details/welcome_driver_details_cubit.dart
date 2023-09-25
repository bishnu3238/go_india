import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_router/go_router.dart';
import '../../utility/utility/utility.dart';
import 'export.dart';
import '../../domain/store/store.dart';
import '../../domain/entity/entity.dart';
import '../../package/package/package.dart';
import '../../domain/repository/repository.dart';

class WelcomeDriverDetailsCubit extends Cubit<WelcomeDriverDetailsState> {
  final CityStore cityStore;
  final Notifier notifier;
  final DriverStore driverStore;
  final DriverRepository driverRepository;

  WelcomeDriverDetailsCubit(
      this.cityStore, this.driverStore, this.notifier, this.driverRepository)
      : super(const WelcomeDriverDetailsState());

  void toggleAgreeCheck(bool isAgree) {
    isAgree.log;
    emit(state.copyWith(
      isAgree: isAgree,
      isValid: Formz.validate([
            state.fullName,
            state.phoneNumber,
            state.city,
          ]) &&
          isAgree,
    ));
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(
      state.copyWith(
        fullName: name,
        isValid: Formz.validate([
              name,
              state.phoneNumber,
              state.city,
            ]) &&
            state.isAgree,
      ),
    );
  }

  emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([
            state.fullName,
            state.phoneNumber,
            state.city,
          ]) &&
          state.isAgree,
    ));
  }

  cityChange(Cities value) {
    final city = City.dirty(value.cityName);
    emit(state.copyWith(
      city: city,
      cityId: value.id,
      isValid: Formz.validate([
            state.fullName,
            state.phoneNumber,
            state.city,
          ]) &&
          state.isAgree,
    ));
  }

  Future<Cities?> citySearch(BuildContext context) async {
    SearchData? result = await showSearch<SearchData?>(
      context: context,
      delegate: Search(data: cityStore.citySearchData),
    );
    if (result == null) return null;
    Cities city = result.searchToCities;
    return city;
  }

  referralCodeChanged(String value) {
    final referralCode = ReferralCode.dirty(value);
    emit(state.copyWith(
      referralCode: referralCode,
      isValid: Formz.validate([
            state.fullName,
            state.phoneNumber,
            state.city,
          ]) &&
          state.isAgree,
    ));
  }

  void phoneChange(String phone) {
    final phoneNo = MobileNumber.dirty(phone);
    emit(state.copyWith(
      phoneNumber: phoneNo,
      isValid: Formz.validate([
            state.fullName,
            state.phoneNumber,
            state.city,
          ]) &&
          state.isAgree,
    ));
  }

  showMessage(BuildContext context) {
    notifier.errorMessage(
        context: context, message: 'Please Fill required details');
  }

  Future<void> showPopUp(BuildContext context) async {
    await popUp(context, [logoutMenu]);
  }

  Future welcomeDriver(BuildContext context) async {
    var driverDetails = driverStore.state.driverDetails.copyWith(
      city: state.city.value,
      cityId: state.cityId,
    );
    var driver = driverStore.state.copyWith(
      name: state.fullName.value,
      email: state.email.value,
      mobile: state.phoneNumber.value,
      driverDetails: driverDetails,
      referralCode: state.referralCode.value,
    );
    driverStore.setDriver(driver);

    Map<String, String> data = {
      'mobile': driver.mobile,
      'name': driver.name,
      'email': driver.email ?? "",
      'city': driver.driverDetails.city,
      'city_id': driver.driverDetails.cityId,
      'refer_code': driver.referralCode ?? '',
    };

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await driverRepository.newDriver(data).then((value) => value.fold(
          (l) {
            emit(state.copyWith(status: FormzSubmissionStatus.failure));
            notifier.errorMessage(context: context, message: l.message);
          },
          (r) {
            emit(state.copyWith(status: FormzSubmissionStatus.success));
            context.go(Screen.welcome.path);
          },
        ));
  }
}
