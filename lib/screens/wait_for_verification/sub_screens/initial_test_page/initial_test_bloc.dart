// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:go_india/domain/repository/master_repository.dart';
import 'package:go_india/package/common/common.dart';

import 'export.dart';
import 'package:video_player/video_player.dart';

class InitialTestBloc extends Cubit<InitialTestState> {
  InitialTestBloc(this.masterRepository) : super(InitialLoadingState()) {
    masterRepository.getInstructionVideo().then(
          (value) => masterRepository.getQuiz().then(
            (value) async {
              emit(InitialFetchState());
              masterRepository.instructionVideo.video.log();
              initializeVideo(masterRepository.instructionVideo.video)
                  .then((value) => emit(InitialVideoSetState(value)));
            },
          ),
        );
  }

  final MasterRepository masterRepository;

  Future<VideoPlayerController> initializeVideo(String uri) async {
    Uri url = Uri.parse(uri);

    VideoPlayerController videoPlayerController =
        VideoPlayerController.networkUrl(url);
    await videoPlayerController.initialize();
    return videoPlayerController;
  }
}
