import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

 import '../../../package/package.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;
  final Notifier notifier;

  RegisterCubit(this.authRepository, this.notifier) : super(const RegisterState());

  void usernameChange(String value) {
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate(
          [username, state.phoneNumber, state.email, state.referralCode],
        ),
      ),
    );
  }

  void phoneNumberChange(String value) {
    final phone = MobileNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phone,
        isValid: Formz.validate(
          [state.username, phone, state.email, state.referralCode],
        ),
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
          [state.username, state.phoneNumber, email, state.referralCode],
        ),
      ),
    );
  }

  void referralCodeChange(String value) {
    final referralCode = ReferralCode.dirty(value);
    emit(
      state.copyWith(
        referralCode: referralCode,
        isValid: Formz.validate(
          [state.username, state.phoneNumber, state.email, referralCode],
        ),
      ),
    );
  }

  Future<void> signUp() async {
    // _checkPhoneNumberExistsOrNot();
  }

  Future<void> checkPhoneNumberExistsOrNot(String url) async{
   await authRepository.checkPhNoExistsOrNot(
        ph: state.phoneNumber.value, url: url);
  }
}
