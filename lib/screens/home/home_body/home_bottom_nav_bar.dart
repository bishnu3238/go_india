import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_india/screens/home/export.dart';

import '../../../utility/utility/utility.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  final bool isHome;

  const HomeBottomNavigationBar({super.key, this.isHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        var bloc = context.read<HomeBloc>();
        return BottomNavigationBar(
          elevation: 5,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue.shade900,
          currentIndex: state.navbarIndex,
          unselectedItemColor: Colors.blueGrey.withOpacity(0.4),
          selectedLabelStyle: inter(),
          unselectedLabelStyle: inter(),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.car),
              label: 'Rides',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.clockRotateLeft),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.gear),
              label: 'Setting',
            ),
          ],
          onTap: (int index) => bloc.add(ChangeNavBar(index)),
        );
      },
    );
  }
}
