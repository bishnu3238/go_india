import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../package/package/package.dart';
import '../../utility/utility/utility.dart';
import 'export.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool v = false;

  final key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomeBloc>(),
      child: Scaffold(
        key: key,
        drawer: const AppDrawer(),
        appBar: simpleAppBar(key),
        body: Builder(builder: (context) {
          return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            return widgets[state.navbarIndex];
          });
        }),
        bottomNavigationBar: const HomeBottomNavigationBar(),
      ),
    );
  }
}
