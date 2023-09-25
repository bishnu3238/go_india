import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entity/entity.dart';
import '../../domain/store/store.dart';
import '../../utility/utility/utility.dart';
import '../package/package.dart';

class UserDetailsDrawerHeader extends StatelessWidget {
  const UserDetailsDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverStore, Driver>(
      bloc: get.get<DriverStore>(),
      listener: (ctx, state) {},
      builder: (context, user) {
        bool isNetwork = user.image.contains('http');
        return Stack(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user.name),
              accountEmail: EditButton(
                  mainAxis: MainAxisAlignment.start,
                  icon: Icons.alternate_email,
                  label: user.email ?? 'Email Address '),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.background,
                backgroundImage:
                    isNetwork ? CachedNetworkImageProvider(user.image) : null,
                child: ImageShower(
                  imageUrl: user.image,
                  imgType: isNetwork ? ImgType.network : ImgType.local,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: FavIcon(
                icon: FontAwesomeIcons.penToSquare,
                iconColor: kLight,
                onTap: () {
                  'TODO: go to profile page'.log();

                  /// TODO: go to profile page
                },
              ),
            )
          ],
        );
      },
    );
  }
}
