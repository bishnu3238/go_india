import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_india/utility/utility/utility.dart';

import '../../../../../package/package/package.dart';
import '../../../../common/common.dart';
import '../export.dart';

class EditUserProfileBody extends StatelessWidget {
  const EditUserProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EditUserProfileCubit>();

    return const SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: Column(
          children: [
            _ProfileImage(),
            SizedBox(height: 35),
            _EditName(),
            _EditMobile(),
            _EditEmail(),
            _EditGender(),
          ],
        ),
      ),
    );
  }
}

class _EditName extends StatelessWidget {
  const _EditName();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditUserProfileCubit, EditUserProfileState>(
        builder: (context, state) {
      return CardHeadingListTile(
        heading: Text('Basic Info',
            style: gideonRoman(
                weight: fw7, size: 25, decoration: TextDecoration.underline)),
        elevation: 2,
        title: TowFieldColumn(
          title: 'Driver Name',
          capitalization: TextCapitalization.words,
          fieldValue: state.driver.name,
        ),
      );
    });
  }
}

class _EditMobile extends StatelessWidget {
  const _EditMobile();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditUserProfileCubit, EditUserProfileState>(
        builder: (context, state) {
      return CardHeadingListTile(
        elevation: 2,
        title: TowFieldColumn(
          title: 'Mobile No',
          inputType: TextInputType.phone,
          fieldValue: state.driver.mobile,
        ),
      );
    });
  }
}

class _EditEmail extends StatelessWidget {
  const _EditEmail();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditUserProfileCubit, EditUserProfileState>(
        builder: (context, state) {
      return CardHeadingListTile(
        elevation: 2,
        title: TowFieldColumn(
          title: 'Email Address',
          inputType: TextInputType.emailAddress,
          fieldValue: state.driver.email ?? "Add email address",
        ),
      );
    });
  }
}

class _EditGender extends StatelessWidget {
  const _EditGender();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EditUserProfileCubit>();
    return BlocBuilder<EditUserProfileCubit, EditUserProfileState>(
        builder: (context, state) {
      return CardHeadingListTile(
        elevation: 2,
        title: TowFieldColumn(
          title: 'Gender',
          secondary: RadioButtons(
              enums: Gender.values,
              groupValue: state.driver.gender,
              onChange: cubit.changeGender),
        ),
      );
    });
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocBuilder<EditUserProfileCubit, EditUserProfileState>(
        builder: (context, state) {
      var cubit = context.read<EditUserProfileCubit>();
      return ProfileImageCircle(
        showEdit: true,
        image: state.driver.image,
        imgType: state.driver.imgType,
        onTap: () => cubit.pickProfileImage(context),
      );
    });
  }
}
