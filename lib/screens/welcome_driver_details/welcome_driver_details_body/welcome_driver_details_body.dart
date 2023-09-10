import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_india/domain/repository/city_repository.dart';
import '../export.dart';
import '../../common/common.dart';
import '../../../domain/entity/entity.dart';
import '../../../package/package/package.dart';
import '../../../utility/utility/utility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeDriverDetailsBody extends StatelessWidget {
  const WelcomeDriverDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ClearFocus(
      child: BlocBuilder<WelcomeDriverDetailsCubit, WelcomeDriverDetailsState>(
        builder: (context, state) {
          return const SingleChildScrollView(
            child: Padding(
              padding: edgeInsets1015,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _NameInput(),
                  _EmailInput(),
                  _PhoneInput(),
                  _CityToDriveInput(),
                  _ReferralCodeInput(),
                  SizedBox(height: 25),
                  AgreeCheck(),
                  SizedBox(height: 25),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeDriverDetailsCubit, WelcomeDriverDetailsState>(
        builder: (context, state) {
      var cubit = context.read<WelcomeDriverDetailsCubit>();
      cubit.phoneChange(cubit.driverStore.state.mobile.removeCountryCode);
      return TowFieldColumn(
        title: 'Mobile',
        secondary: PhoneInputField(
            readOnly: true,
            initialNumber: cubit.driverStore.state.mobile,
            hint: 'e.g:+xx xxxxxxxxxx',
            onDone: (onDone) {},
            onNumberChange: (onNumberChange) {},
            onCountryChange: (onCountryChange) {}),
      );
    });
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeDriverDetailsCubit, WelcomeDriverDetailsState>(
      builder: (context, state) {
        var cubit = context.read<WelcomeDriverDetailsCubit>();
        return TowFieldColumn(
          title: 'Name',
          hint: 'Your Name',
          capitalization: TextCapitalization.words,
          onChange: (String name) => cubit.nameChanged(name),
          validator: (value) =>
              state.fullName.displayError != null ? 'Enter valid name' : null,
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeDriverDetailsCubit, WelcomeDriverDetailsState>(
      builder: (context, state) {
        var cubit = context.read<WelcomeDriverDetailsCubit>();
        return TowFieldColumn(
          title: 'Email Address',
          hint: 'Email Address (Optional)',
          inputType: TextInputType.emailAddress,
          onChange: (String name) => cubit.emailChanged(name),
        );
      },
    );
  }
}

class _CityToDriveInput extends StatelessWidget {
  const _CityToDriveInput();

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    color;
    return BlocBuilder<WelcomeDriverDetailsCubit, WelcomeDriverDetailsState>(
      builder: (context, state) {
        var cubit = context.watch<WelcomeDriverDetailsCubit>();
        return TowFieldColumn(
          title: 'City you drive in',
          secondary: SecondaryTextField(
              icon: FontAwesomeIcons.city,
              onIconTap: () => getIt<CityRepository>().fetchCities(),
              hint: state.city.isValid ? state.city.value : 'Select City',
              onTap: () async {
                Cities? city = await cubit.citySearch(context);
                if (city == null) return;
                cubit.cityChange(city);
              }),
          validator: (value) =>
              state.fullName.displayError != null ? 'please select city' : null,
        );
      },
    );
  }
}

class _ReferralCodeInput extends StatelessWidget {
  const _ReferralCodeInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeDriverDetailsCubit, WelcomeDriverDetailsState>(
      builder: (context, state) {
        var cubit = context.read<WelcomeDriverDetailsCubit>();
        return TowFieldColumn(
          title: 'Referral Code',
          hint: 'Referral Code (if any)',
          onChange: (String name) => cubit.referralCodeChanged(name),
        );
      },
    );
  }
}
