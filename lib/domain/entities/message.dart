//Identidad atomica: la unidad  mas pequeña de un sistema.
enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho formWho;
  final String time;

  Message(
      {required this.text,
      this.imageUrl,
      required this.formWho,
      required this.time});

  Message copyWith(
      {String? text, String? imageUrl, FromWho? formWho, String? time}) {
    return Message(
      text: text ?? this.text,
      imageUrl: imageUrl ?? this.imageUrl,
      formWho: formWho ?? this.formWho,
      time: time ?? this.time,
    );
  }
}
