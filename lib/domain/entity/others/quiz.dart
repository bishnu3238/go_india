class Quiz {
  final String id, question, op1, op2, op3, op4, asn, status;
  final DateTime? date;

  const Quiz({
    required this.id,
    required this.question,
    required this.op1,
    required this.op2,
    required this.op3,
    required this.op4,
    required this.asn,
    required this.status,
    this.date,
  });
  static const Quiz empty = Quiz(
    id: '',
    question: '',
    op1: '',
    op2: '',
    op3: '',
    op4: '',
    asn: '',
    status: '0',
  );

  @override
  String toString() {
    return 'Quiz{ id: $id, question: $question, op1: $op1, op2: $op2, op3: $op3, op4: $op4, asn: $asn, status: $status, date: $date,}';
  }

  Quiz copyWith({
    String? id,
    String? question,
    String? op1,
    String? op2,
    String? op3,
    String? op4,
    String? asn,
    String? status,
    DateTime? date,
  }) {
    return Quiz(
      id: id ?? this.id,
      question: question ?? this.question,
      op1: op1 ?? this.op1,
      op2: op2 ?? this.op2,
      op3: op3 ?? this.op3,
      op4: op4 ?? this.op4,
      asn: asn ?? this.asn,
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'op1': op1,
      'op2': op2,
      'op3': op3,
      'op4': op4,
      'asn': asn,
      'status': status,
      'date': date,
    };
  }
}
