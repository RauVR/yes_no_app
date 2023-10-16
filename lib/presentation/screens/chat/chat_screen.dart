import 'package:flutter/material.dart';
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
        title: const Text('My Princess'),
        //centerTitle: true,
      ),
      body: _ChatView(),//Click derecho > refactor > extraer widget y le damos nombre _ChatView
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column( // A esta columna la envolvemos en un widget, luego al column lo envolvmos en un padding
          children: [
            Expanded(child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context,index){
                  return (index % 2 == 0)
                  ? const HerMessageBubble()
                  : const MyMessageBubble();
            })),


            //   CAJA DE TEXTO
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
