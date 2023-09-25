// ignore_for_file: depend_on_referenced_packages

import 'package:go_india/domain/entity/others/instruction_video.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

abstract class InitialTestState {}

class InitialLoadingState extends InitialTestState {}

class InitialFetchState extends InitialTestState {}

class InitialVideoSetState extends InitialTestState {
  final VideoPlayerController videoPlayerController;
  InitialVideoSetState(VideoPlayerController  controller)
      : videoPlayerController =controller;
}

