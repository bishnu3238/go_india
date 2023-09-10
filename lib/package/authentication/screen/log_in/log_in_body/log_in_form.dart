import 'package:auto_size_text/auto_size_text.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../../../../routes/route_path.dart';
import '../../../../../utility/utility/utility.dart';
import '../../../../package/package.dart';
import '../log_in_cubit.dart';
import '../log_in_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: LoginCubit.listener,
       child: _ContainerBox(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const _LogInHeader(),
              const SizedBox(height: 30),
              _PhoneNumberInput(),
              const SizedBox(height: 30),
              _LoginButton(),
              // const SizedBox(height: 50),
              const Visibility(
                  visible: false,
                  child: _GoToSignUp()),
            ],
          ),
        ),
      ),
    );
  }
}

class _GoToSignUp extends StatelessWidget {
  const _GoToSignUp();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(Screen.signUp.path),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'Create a account,',
            style: gQuan(
                size: 12,
                color: Theme.of(context).colorScheme.outline,
                weight: fw3),
            textAlign: TextAlign.end,
          ),
          const SizedBox(width: 5),
          AutoSizeText(
            'Sign Up',
            style: gQuan(
                size: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
                decoration: TextDecoration.underline,
                weight: fw6),
            textAlign: TextAlign.end,
          ),

        ],
      ),
    );
  }
}

class _LogInHeader extends StatelessWidget {
  const _LogInHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Enter Phone number for verification',
          maxLines: 2,
          style: gideonRoman(weight: FontWeight.w800, size: 22),
        ),
        AutoSizeText(
          'You will receive an otp for verification',
          maxLines: 2,
          style: gideonRoman(weight: FontWeight.w400, size: 13),
        ),
      ],
    );
  }
}

class _ContainerBox extends StatelessWidget {
  final Widget child;
  const _ContainerBox({required this.child});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    return Container(
        height: media.size.height - kToolbarHeight - media.padding.top - 30,
        margin: edgeInsets10,
        padding: edgeInsets1015,
        child: child);
  }
}

class _PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (context, state) {
        return PhoneInputField(
          hint: 'e.g: xxxxxxxxxx',
          onNumberChange: (PhoneNumber number) =>
              context.read<LoginCubit>().numberChanged(number.number),
          error: state.phoneNumber.displayError != null
              ? 'invalid phone number'
              : null,
          onDone: (value) {
            if (state.isValid) {
              context.read<LoginCubit>().context = context;
              context.read<LoginCubit>().checkPhoneNo();
            }
            return;
          },
          validator: (value) => state.phoneNumber.displayError != null
              ? 'invalid phone number'
              : null,
          onCountryChange: (value) {},

        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<LoginCubit>().context = context;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ElButton(
          text: 'NEXT',
          onTap: state.isValid
              ? () => context.read<LoginCubit>().checkPhoneNo()
              : null,
          showLoading: state.status.isInProgress ? true : false,
          style: gQuan(color: FlexColor.amberDarkPrimary),
        );
      },
    );
  }
}
