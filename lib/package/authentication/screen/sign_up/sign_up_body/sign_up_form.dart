import 'package:auto_size_text/auto_size_text.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../../../../utility/utility/utility.dart';
import '../../../../package/package.dart';
import '../sign_up_cubit.dart';
import '../sign_up_state.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: SignUpCubit.listener,
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
            ],
          ),
        ),
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
          'Enter Phone number for \n${Screen.signUp.capitalName}',
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
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (context, state) {
        return PhoneInputField(
          hint: 'e.g: xxxxxxxxxx',
          onNumberChange: (PhoneNumber number) =>
              context.read<SignUpCubit>().numberChanged(number.number),
          error: state.phoneNumber.displayError != null
              ? 'invalid phone number'
              : null,
          onDone: (value) {
            if (state.isValid) {
              context.read<SignUpCubit>().context = context;
              context.read<SignUpCubit>().sendOpt();
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
    context.read<SignUpCubit>().context = context;
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return ElButton(
          text: 'NEXT',
          onTap: state.isValid
              ? () => context.read<SignUpCubit>().sendOpt()
              : null,
          showLoading: state.status.isInProgress ? true : false,
          style: gQuan(color: FlexColor.amberDarkPrimary),
        );
      },
    );
  }
}
