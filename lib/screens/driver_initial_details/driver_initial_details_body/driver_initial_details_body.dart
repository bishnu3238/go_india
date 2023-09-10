import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_india/package/common/common.dart';
import 'package:go_india/package/custom_widget/custom_widgets.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:go_router/go_router.dart';

import '../../../utility/utility/utility.dart';

class DriverInitialDetailsBody extends StatelessWidget {
  const DriverInitialDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<DriverInitialDetailsCubit, DriverInitialDetailsState>(
      builder: (context, state) {
        var cubit = context.read<DriverInitialDetailsCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: edgeInsets10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(cubit: cubit),
                _IdentityDetails(theme: theme, state: state),
                const SizedBox(height: 15),
                _BAnkAccountDetails(theme: theme, state: state),
                _ProfilePicture(theme: theme, state: state),
                _DrivingLicenseNo(theme: theme, state: state),
                // _DrivingLicense(theme: theme, state: state),
                _AadhaarCard(theme: theme, state: state),
                _RCCertificate(theme: theme, state: state),
                _PollutionUnderControll(theme: theme, state: state),
                _VehicleInsurance(theme: theme, state: state),
                _PanCard(theme: theme, state: state),
                _VehiclePermit(theme: theme, state: state),
                _FitnessCertificate(theme: theme, state: state),
                _VehicleAudit(theme: theme, state: state),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.cubit});

  final DriverInitialDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        InkWell(
          onTap: () => context.go(Screen.welcomeDriverDetails.path),
          child: AutoSizeText(
            'Welcome, ${cubit.driverStore.state.name}.',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: gideonRoman(
                weight: fw6, size: getScreenWidth(kLayoutWidth * 1 / 15)),
          ),
        ),
        const SizedBox(height: 10),
        AutoSizeText(
          'Please complete the following steps and start driving.',
          style: gideonRoman(
              weight: fw6, size: getScreenWidth(kLayoutWidth * 1 / 33)),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _IdentityDetails extends StatelessWidget {
  const _IdentityDetails({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      label: 'Key Requirement',
      title: Text(
        'Identity Details',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.identity.path),
      // !state.isIdentityDetailsDone
      //     ? context.push(Screen.identity.path)
      //     : null,
      trailing: state.isIdentityDetailsDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}

class _BAnkAccountDetails extends StatelessWidget {
  const _BAnkAccountDetails({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      label: 'Required Steps',
      title: Text(
        'Bank Account Details',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.bankAccountDetails.path),
      trailing: state.isBankDetailsDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}

class _DrivingLicenseNo extends StatelessWidget {
  const _DrivingLicenseNo({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      title: Text(
        'Driver License Number',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.driverLicenseNo.path),
      trailing: state.isDrivingLicenseDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      title: Text(
        'Profile Picture',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.profilePicture.path),
      trailing: state.isProfileDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}

class _VehicleAudit extends StatelessWidget {
  const _VehicleAudit({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      title: Text(
        'Vehicle Audit',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.vehicleAudit.path),
      trailing: state.isVehicleAuditDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}

class _FitnessCertificate extends StatelessWidget {
  const _FitnessCertificate({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      title: Text(
        'Fitness Certificate',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.fitnessCertificate.path),
      trailing: state.isFitnessDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}

class _VehiclePermit extends StatelessWidget {
  const _VehiclePermit({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      title: Text(
        'Vehicle Permit',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.vehiclePermit.path),
      trailing: state.isVehiclePermitDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}

class _PanCard extends StatelessWidget {
  const _PanCard({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      title: Text(
        'PAN Card',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.panCard.path),
      trailing: state.isPanDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}

class _VehicleInsurance extends StatelessWidget {
  const _VehicleInsurance({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      title: Text(
        'Vehicle Insurance',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.vehicleInsurance.path),
      trailing: state.isVehicleInsuranceDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}

class _PollutionUnderControll extends StatelessWidget {
  const _PollutionUnderControll({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      title: Text(
        'Pollution Under Control',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.pollutionUnderControl.path),
      trailing: state.isPollutionDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}

class _RCCertificate extends StatelessWidget {
  const _RCCertificate({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      title: Text(
        'Registration Certificate (RC) for Vehicle No',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.rcCertificate.path),
      trailing: state.isRcDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}

class _AadhaarCard extends StatelessWidget {
  const _AadhaarCard({
    required this.theme,
    required this.state,
  });
  final DriverInitialDetailsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CardHeadingListTile(
      elevation: 0.5,
      title: Text(
        'Aadhaar Card',
        style: gideonRoman(weight: fw6, size: 15),
      ),
      onTap: () => context.push(Screen.aadharCard.path),
      trailing: state.isAadhaarDone
          ? IIcon(
              icon: FontAwesomeIcons.solidCircleCheck,
              color: theme.colorScheme.tertiary.withGreen(255),
              size: 18,
            )
          : const IIcon(icon: FontAwesomeIcons.angleRight),
    );
  }
}
