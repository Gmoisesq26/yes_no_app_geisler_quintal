//El modelo define que datos debe tener la aplicación.
import 'package:yes_no_app_geisler_quintal/domain/entities/message.dart';
import 'package:intl/intl.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };
  Message toMessageEntity() => Message(
      text: answer == 'yes'
          ? 'Si'
          : answer == 'no'
              ? 'No'
              : 'Quizás',
      formWho: FromWho.hers,
      imageUrl: image,
      time: DateFormat('hh:mm a').format(DateTime.now()));
}
