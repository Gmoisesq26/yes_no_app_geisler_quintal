import 'package:dio/dio.dart';
import 'package:yes_no_app_geisler_quintal/domain/entities/message.dart';
import 'package:yes_no_app_geisler_quintal/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    //Almacenar la funcion tipo get en una variable
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();

    //Generar el error
    throw UnimplementedError();
  }
}
