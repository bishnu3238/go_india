import 'package:flutter/material.dart';
 import 'package:go_india/screens/driver_initial_details/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'export.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

class WaitForVerification extends StatefulWidget {
  const WaitForVerification({super.key});

  @override
  State<WaitForVerification> createState() => _WaitForVerificationState();
}

class _WaitForVerificationState extends State<WaitForVerification> {
  bool isCircular = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => WaitForVerificationCubit(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: _simpleAppBar(context),
            body: const WaitForVerificationBody(),
            floatingActionButton: AnimatedContainer(
              width: isCircular ? 56.0 : 400.0,
              height: isCircular ? 56.0 : 50.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: FloatingActionButton(
                onPressed: () {
                  context.read<WaitForVerificationCubit>().check(context);
                  setState(() {
                    isCircular = !isCircular;
                  });
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: isCircular
                      ? Icon(Icons.check, key: UniqueKey())
                      : Transform.rotate(
                          angle: isCircular ? 0 : 3.1415926,
                          child: Icon(Icons.rotate_left, key: UniqueKey()),
                        ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  var driver = context.read<WaitForVerificationCubit>().state.driver;
  return SimpleAppBar(
    bgColor: theme.colorScheme.background,
    // leading: FavIcon(
    //   icon: Icons.arrow_back,
    //   onTap: () => context.pop(),
    //   iconColor: theme.shadowColor,
    // ),
    centerTitle: false,
    label: 'Welcome, ${driver.name}',
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw7),
    buttons: [
      FavIcon(
        icon: Icons.more_vert,
        iconColor: theme.colorScheme.onSecondary,
        onTap: () async => await popUp(context, [logoutMenu]),
      ),
    ],
  );
}
