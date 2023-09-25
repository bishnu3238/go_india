import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:go_router/go_router.dart';
import '../export.dart';

class InitialTestPageBody extends StatelessWidget {
  const InitialTestPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<InitialTestBloc, InitialTestState>(
          builder: (context, state) {
        if (state is InitialFetchState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                  baseColor: kGrey,

                  highlightColor: kGrey3,
                  child: SizedBox(
                    width: double.infinity,
                    height: getScreenHeight(kLayoutHeight * 1 / 3),
                  ))
            ],
          );
        }
        if (state is InitialVideoSetState) {
          return Container(
            decoration: BoxDecoration(border: Border.all()),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Chewie(
                controller: ChewieController(
                  videoPlayerController: state.videoPlayerController,
                  autoPlay: true,
                ),
              ),
            ),
          );
        }
        return const Center(child: LoadingSpinner(color: kDBlue));
      }),
    );
  }
}
