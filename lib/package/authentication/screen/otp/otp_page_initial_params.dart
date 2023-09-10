import '../../../package/package.dart';

class OtpPageInitialParams {
  final String vID;
  final int? token;
  final MobileNumber phoneNO;

  static const OtpPageInitialParams empty = OtpPageInitialParams(
    vID: '',
    phoneNO: MobileNumber.pure(),
  );
  const OtpPageInitialParams(
      {required this.vID, this.token, required this.phoneNO});

  @override
  String toString() {
    return 'OtpPageInitialParams{vID: $vID, token: $token, phoneNO: $phoneNO}';
  }
}
