//Identidad atomica: la unidad  mas pequeña de un sistema.
enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho formWho;
  //final String time;

  Message({required this.text, this.imageUrl, required this.formWho});
}
