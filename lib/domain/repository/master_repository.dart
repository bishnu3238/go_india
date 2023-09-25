import 'package:dartz/dartz.dart';
import 'package:go_india/domain/entity/entity.dart';

import '../failure/failure.dart';

abstract class MasterRepository{
  Future <Either<Failure, InstroVideo>> getInstructionVideo();
  Future <Either<Failure, Quiz>> getQuiz();
  InstroVideo get instructionVideo  ;
    Quiz get quiz  ;

}