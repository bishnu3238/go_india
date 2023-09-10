import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_router/go_router.dart';

import '../../package/package/package.dart';
import '../../utility/utility/utility.dart';
import 'export.dart';





class Splash extends StatefulWidget {
  final SplashCubit cubit;
  const Splash({super.key, required this.cubit});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  bool _isScaledUp = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: twoSecond,
    );

    _animationController.forward().whenComplete(() {
      setState(() {
        _isScaledUp = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<SplashCubit, SplashState>(
        bloc: widget.cubit,
        builder: (context, state) {
          return Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Opacity(
                  opacity: _isScaledUp ? 1.0 : 0.5,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.5),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeInOut,
                    )),
                    child: AnimatedContainer(
                      duration: twoSecond,
                      curve: Curves.easeInOut,
                      // width: _isScaledUp ? 400.0 : 200.0,
                      // height: _isScaledUp ? 400.0 : 200.0,
                      width: getScreenWidth(
                        kLayoutWidth * (_isScaledUp ? 1 / 3 : 1 / 10),
                      ),
                      height: getScreenHeight(
                        kLayoutHeight * (_isScaledUp ? 1 / 6 : 1 / 20),
                      ),
                      child: ImageShower(
                        imageUrl: appLogo,
                        imgType: ImgType.local,
                        width: getScreenWidth(
                          kLayoutWidth * (_isScaledUp ? 1 / 3 : 1 / 10),
                        ),
                        height: getScreenHeight(
                          kLayoutHeight * (_isScaledUp ? 1 / 6 : 1 / 20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
        listener: (BuildContext context, SplashState? state) {
          !state!.isLoading && !state.isWaiting
              ? Future.delayed(
                  thrSecond, () => context.go(Screen.onBoarding.path))
              : null;
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

// class Splash extends StatelessWidget {
//   final SplashCubit cubit;
//   const Splash({super.key, required this.cubit});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: BlocConsumer(
//         bloc: cubit,
//         builder: (context, state) {
//           return Center(
//             child: AnimatedContainer(
//               duration: twoSecond,
//               curve: Curves.fastOutSlowIn,
//               child: ImageShower(
//                 imageUrl: appLogo,
//                 imgType: ImgType.local,
//                 width: getScreenWidth(kLayoutWidth * 1 / 3),
//                 height: getScreenHeight(kLayoutHeight * 1 / 6),
//               ),
//             ),
//           );
//         },
//         listener: (BuildContext context, SplashState? state) {
//           !state!.isLoading && !state.isWaiting
//               ? Future.delayed(
//                   thrSecond, () => context.go(Screen.onBoarding.path))
//               : null;
//         },
//       ),
//     );
//   }
// }
