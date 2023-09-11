import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:go_india/package/package/package.dart';
 import '../../../../common/common.dart';

class ProfilePictureBody extends StatelessWidget {
  const ProfilePictureBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const _ProfilePhoto(),
            const SizedBox(height: 20),
            AutoSizeText(
              profilePictureTextOne,
              style: gideonRoman(weight: fw7, size: 15),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            CardHeadingListTile(
              leading: const Icon(Icons.check),
              title: Text(profileTwo, style: gideonRoman(size: 14)),
            ),
            CardHeadingListTile(
              leading: const Icon(Icons.check),
              title: Text(profileThree, style: gideonRoman(size: 14)),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfilePhoto extends StatelessWidget {
  const _ProfilePhoto();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePictureCubit, ProfilePictureState>(
        builder: (context, state) {
          state.driver.image.log();
      return ContainerImageShow(
        image:state.driver.image,

        imgType:  state.driver.imgType,
      );
    });
  }
}

const profilePictureTextOne =
    'Your profile photo helps people recognise you. Please note that the once you have submitted your profile photo, It can not be changed.';

const profileTwo =
    'Face the camera and make sure your eyes and mouth are clearly visible';
const profileThree =
    'Make sure the photo is well lit, free of glare and in focused';
