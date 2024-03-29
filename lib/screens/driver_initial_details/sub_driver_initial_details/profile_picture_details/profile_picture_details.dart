import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'export.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => ProfilePictureCubit(get(), get(), get()),
      child: Scaffold(
        appBar: _simpleAppBar(context),
        body: const ProfilePictureBody(),
        persistentFooterButtons: const [ProfilePictureButton()],
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(
    centerTitle: false,
    label: 'Profile Picture',
    bgColor: theme.colorScheme.background,
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw5),
  );
}

class ProfilePictureButton extends StatelessWidget {
  const ProfilePictureButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePictureCubit, ProfilePictureState>(
      builder: (context, state) {
        var cubit = context.watch<ProfilePictureCubit>();
        return Wrap(
          children: [
            ElButton(
              text: state.profileImage.isNotEmpty ? 'Upload' : 'Take Photo',
              style: gideonRoman(color: kGolden, weight: fw9),
              showLoading: state.status.isInProgress,
              onTap: () => state.profileImage.isNotEmpty
                  ? cubit.done(context)
                  : cubit.takeProfilePhoto(context),
            ),
          ],
        );
      },
    );
  }
}
