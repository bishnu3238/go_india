class InstroVideo{
  final String id, video;
  final DateTime? date;

  const InstroVideo({
    required this.id,
    required this.video,
     this.date ,
  });


  static const InstroVideo empty = InstroVideo(
    id: '0',
    video: '0',

  );


  @override
  String toString() {
    return 'InstructionVideo{ id: $id, video: $video, date: $date,}';
  }

  InstroVideo copyWith({
    String? id,
    String? video,
    DateTime? date,
  }) {
    return InstroVideo(
      id: id ?? this.id,
      video: video ?? this.video,
      date: date ?? this.date,
    );
  }




}