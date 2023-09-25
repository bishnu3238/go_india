import 'package:go_india/domain/entity/entity.dart';
import 'package:go_india/package/common/common.dart';

class QuizJson {
  final String id, question, op1, op2, op3, op4, asn, status, date;

  const QuizJson({
    required this.id,
    required this.question,
    required this.op1,
    required this.op2,
    required this.op3,
    required this.op4,
    required this.asn,
    required this.status,
    required this.date,
  });

  factory QuizJson.fromMap(Map<String, dynamic> map) {
    return QuizJson(
      id: map['id'] as String,
      question: map['question'] as String,
      op1: map['option1'] as String,
      op2: map['option2'] as String,
      op3: map['option3'] as String,
      op4: map['option4'] as String,
      asn: map['correct'] as String,
      status: map['status'] as String,
      date: map['date'] as String,
    );
  }

  Quiz toDomain() => Quiz(
        id: id,
        question: question,
        op1: op1,
        op2: op2,
        op3: op3,
        op4: op4,
        asn: asn,
        status: status,
        date: date.stringToDate,
      );
}
