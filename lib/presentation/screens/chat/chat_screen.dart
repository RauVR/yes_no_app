import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/share/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://scontent.flim10-1.fna.fbcdn.net/v/t39.30808-6/337385856_179977698159900_2446320294519255820_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ubltxIiYB7cAX8obmlK&_nc_ht=scontent.flim10-1.fna&oh=00_AfBd9cNhlyblZ161mJhEf4ZKCO8E5mCJ4LH_FQZffuQBvA&oe=6531F117'),
          ),// lo envolvemos en un padding
        ),
        title: const Text('La Otra'),
        //centerTitle: true,
      ),
      body: _ChatView(),//Click derecho > refactor > extraer widget y le damos nombre _ChatView
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();
    //Ahora que provider maneja el estado lo que haremos es que al agregar el
    // watch haremos que siempre este atento por si cambia el estado lo que
    // hara q renderice nuevamente la pantalla

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column( // A esta columna la envolvemos en un widget, luego al column lo envolvmos en un padding
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context,index){
                    final message = chatProvider.messageList[index];
                    return(message.fromWho==FromWho.hers)
                      ? HerMessageBubble(message: message,)
                      : MyMessageBubble(message : message);
            })),


            //   CAJA DE TEXTO
            MessageFieldBox(
              onValue: (value)=>chatProvider.sendMessage(value),
              //Esto captura los mensajes que escribo y los muestra en pantalla



            ),
          ],
        ),
      ),
    );
  }
}
