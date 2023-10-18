import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message>messageList =[];

  Future<void>sendMessage(String text) async{

    if(text.isEmpty)return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if(text.endsWith('?')){
      herReply();
    }

    notifyListeners();
    moveScrollBotton();
    //Esto sirve para notificar que hubo un cambio y que se actualice nuestras vistas
  }

  Future<void> herReply()async{
    final herMessage=await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollBotton();
  }

  void moveScrollBotton(){
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut
    );
  }
}