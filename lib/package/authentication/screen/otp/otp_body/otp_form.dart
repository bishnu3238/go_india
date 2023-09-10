import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../export.dart';
import '../../../../package/package.dart';
import '../../../../../utility/utility/utility.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
        listener: OtpCubit.listener,
        builder: (context, state) {
          return const Padding(
            padding: edgeInsets10,
            child: ClearFocus(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _OtpHeaderImage(),
                  SizedBox(height: 20),
                  _OtpSomeText(),
                  SizedBox(height: 25),
                  _OtpInput(),
                  SizedBox(height: 30),
                  _OtpVerifyButton(),
                  SizedBox(height: 30),
                  _OtpResendButton()
                ],
              ),
            ),
          );
        });
  }
}

class _OtpResendButton extends StatelessWidget {
  const _OtpResendButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<OtpCubit>().resendOTP(context),
      child: Text(
        "Resend Otp",
        style: gideonRoman(decoration: TextDecoration.underline),
      ),
    );
  }
}

class _OtpSomeText extends StatelessWidget {
  const _OtpSomeText();

  @override
  Widget build(BuildContext context) {
    OtpCubit cubit = context.read<OtpCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Verification Code",
          style: gideonRoman(weight: FontWeight.bold, size: 25),
        ),
        Padding(
          padding: edgeInsets5,
          child: AutoSizeText.rich(
            TextSpan(
              text:
                  'Please enter the verification code sent to your mobile number ',
              children: [
                TextSpan(
                  text: cubit.state.params.phoneNO.value.phoneNumberHide,
                  style: gideonRoman(color: kDBlue, weight: fw7, size: 15),
                )
              ],
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: gideonRoman(size: 14),
          ),
        ),
        const SizedBox(height: 8),
        FavTextIcon(
          size: 15,
          label: 'EDIT',
          icon: FontAwesomeIcons.penToSquare,
          iconColor: Theme.of(context).colorScheme.error,
          onTap: () => context.go(Screen.login.path),
        ),
      ],
    );
  }
}

class _OtpHeaderImage extends StatelessWidget {
  const _OtpHeaderImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: ImageShower(
          imageUrl: otpImage,
          imgType: ImgType.local,
          height: getScreenHeight(kLayoutHeight * 1 / 4),
          width: getScreenWidth(kLayoutWidth * 1 / 2),
        ),
      ),
    );
  }
}

class _OtpInput extends StatelessWidget {
  const _OtpInput();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpCubit, OtpState>(
      buildWhen: (previous, current) => previous.otp != current.otp,
      builder: (context, state) {
        var cubit = context.read<OtpCubit>();

        return Pinput(
          length: 6,
          autofocus: true,
          senderPhoneNumber: '',
          preFilledWidget: const Text("#"),
          keyboardType: TextInputType.number,
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          onChanged: (String otp) => cubit.inputOtp(otp),
          onCompleted: state.isValid ? (pin) => cubit.verify(context) : null,
          onSubmitted: state.isValid ? (pin) => cubit.verify(context) : null,
          errorText: state.otp.displayError != null
              ? 'please enter valid sms code'
              : null,
        );
      },
    );
  }
}

///keytool -list -v -alias androiddebugkey -keystore C:\Users\deepb\.android\debug.keystore
///keytool -list -v \ -alias <your-key-name> -keystore <path-to-production-keystore>
/// keytool -storepasswd -new new_password -keystore C:\Users\deepb\.android\debug.keystore
class _OtpVerifyButton extends StatelessWidget {
  const _OtpVerifyButton();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OtpCubit>(context);

    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, state) {
        return Wrap(
          children: [
            ElButton(
              text: 'Verify',
              showLoading: state.status.isInProgress,
              style: gQuan(color: FlexColor.amberDarkPrimary),
              onTap: state.isValid ? () => cubit.verify(context) : null,
            ),
          ],
        );
      },
    );
  }
}
