import 'package:flutter/material.dart';
import 'package:yes_no_app_geisler_quintal/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola A', formWho: FromWho.me),
    Message(text: 'lloras porque reprovaste topicos?', formWho: FromWho.me)
  ];
  //conrolador para manejar la posicion del scrool
  final ScrollController chatScrollController = ScrollController();

  //Enviar un mesage
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    //El mensage siempre va a ser me porque yo lo envio
    final newMessage = Message(text: text, formWho: FromWho.me);
    //Agrega un elemento nuevo a la lista "messageList"
    messageList.add(newMessage);
    //Notifica si algo de provider cambio para que se guarde en el estado
    notifyListeners();
    //Mueve el scroll
    moveScrollToBottom();
  }

  //mover el scrol al ultimo mensaje
  Future<void> moveScrollToBottom() async {
    //Un pequeño atraso en la animacion para garantisar que sienpre se vera cuando se envien mensajes rapidos y cortos
    await Future.delayed(const Duration(seconds: 1));
    chatScrollController.animateTo(
        //Offerset: posicion de la animacion.
        //maxScrollExtent determina lo maximo que el scroll puede dar.
        chatScrollController.position.maxScrollExtent,
        //Duracion de la animacion
        duration: const Duration(milliseconds: 300),
        //"Rebote" al final de la animacion
        curve: Curves.easeOut);
  }
}
