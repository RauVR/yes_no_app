import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors= Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.circular(20)
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Her Messages', style: TextStyle(color:Colors.white),),
          ),
        ),
        const SizedBox(height: 5,),

        const _ImageBubble(),

        const SizedBox(height: 10,),

      ],
    );

  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(//Este clip nos permite hacer bordes redondeados
        borderRadius: BorderRadius.circular(20),
        child: Image.network("https://yesno.wtf/assets/yes/3-422e51268d64d78241720a7de52fe121.gif",
        width: size.width*0.5,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress==null) return child;
          return Container(
            width: size.width*0.5,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: const Text('Mi girl are sending a picture'),
          );
        },)
    );
  }
}

