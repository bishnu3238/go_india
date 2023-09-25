import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/screens/common/common.dart';
import 'package:go_india/screens/profile_settings/export.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../../../../../package/package/package.dart';

class UserProfileBody extends StatelessWidget {
  const UserProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = context.read<UserProfileCubit>();

    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: Column(
          children: [
            _ProfileImage(theme: theme),
            const SizedBox(height: 35),
            CardHeadingListTile(
              heading: Text('Basic Info',
                  style: gideonRoman(
                      weight: fw7,
                      size: 25,
                      decoration: TextDecoration.underline)),
              elevation: 2,
              title: TowFieldColumn(
                title: 'Driver Name',
                secondary: AutoSizeText(
                  cubit.driverStore.state.name,
                  style: gideonRoman(weight: fw7, size: 18),
                ),
              ),
            ),
            CardHeadingListTile(
              elevation: 2,
              title: TowFieldColumn(
                title: 'Mobile No',
                secondary: AutoSizeText(
                  cubit.driverStore.state.mobile,
                  style: gideonRoman(weight: fw7, size: 18),
                ),
              ),
            ),
            CardHeadingListTile(
              elevation: 2,
              title: TowFieldColumn(
                title: 'Email Address',
                secondary: AutoSizeText(
                  cubit.driverStore.state.email ?? 'No Email Address',
                  style: gideonRoman(weight: fw7, size: 18),
                ),
              ),
            ),
            CardHeadingListTile(
              elevation: 2,
              title: TowFieldColumn(
                title: 'Gender',
                secondary: RadioButtons(
                    enums: Gender.values,
                    groupValue: cubit.driverStore.state.gender,
                    onChange: cubit.changeGender),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
      var cubit = context.read<UserProfileCubit>();
      return  ProfileImageCircle(
        image: state.driver.image,
        imgType: state.driver.imgType,
        fit: BoxFit.cover,
        // onTap: () => cubit.pickProfileImage(context),
      );
      //   Container(
      //   width: getScreenWidth(kLayoutWidth),
      //    decoration: BoxDecoration(
      //     borderRadius: radius10,
      //     color: theme.colorScheme.inversePrimary,
      //   ),
      //   child: Padding(
      //     padding:edgeInsets5,
      //     child: Center(
      //       child: ImageShower(
      //         borderRadius: 8,
      //         height: getScreenHeight(kLayoutHeight * 1 / 4),
      //         imageUrl:  state.driver.image,
      //         imgType: state.imgType,
      //       ),
      //     ),
      //   ),
      // );
    });
  }
}
