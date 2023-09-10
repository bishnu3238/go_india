import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../package/package.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          context.read<RegisterCubit>().notifier.errorMessage(
                context: context,
                message: state.errorMessage ?? "Registration failure",
              );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _UserNameInput(),
            const SizedBox(height: 8),
            _MobileInput(),
            const SizedBox(height: 8),
            _EmailInput(),
            const SizedBox(height: 8),
            _ReferralInput(),
            const SizedBox(height: 8),
            _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _UserNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_userInput_textField'),
          onChanged: (username) =>
              context.read<RegisterCubit>().usernameChange(username),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'full name',
            helperText: '',
            errorText: state.username.displayError != null
                ? 'Enter your full name'
                : null,
          ),
        );
      },
    );
  }
}

class _MobileInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_mobileInput_textField'),
          onChanged: (phoneNo) =>
              context.read<RegisterCubit>().phoneNumberChange(phoneNo),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'phone no',
            helperText: '',
            errorText: state.phoneNumber.displayError != null
                ? 'invalid phone number'
                : null,
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<RegisterCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'email',
            helperText: '',
            errorText:
                state.email.displayError != null ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _ReferralInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.referralCode != current.referralCode,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_referralInput_textField'),
          onChanged: (referralCode) =>
              context.read<RegisterCubit>().referralCodeChange(referralCode),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'referral code',
            helperText: '',
            errorText: state.referralCode.displayError != null
                ? 'invalid referal code'
                : null,
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('signUpForm_continue_raisedButton'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.orangeAccent,
          ),
          onPressed: state.isValid
              ? () => context.read<RegisterCubit>().signUp()
              : null,
          child: state.status.isInProgress
              ? const LoadingSpinner()
              : const Text('SIGN UP'),
        );
      },
    );
  }
}
