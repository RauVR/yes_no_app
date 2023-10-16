import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final focusNode=FocusNode();
    final textController=TextEditingController();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(

        enabledBorder: outlineInputBorder,
        hintText: 'End your message with a "?"',
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: (){
            final textValue=textController.value.text;
            print('Button: $textValue');
            textController.clear();
          },
        )
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();//quita el teclado cuando doy click a otra parte de la pantalla
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('changed: $value');
        textController.clear();
        focusNode.requestFocus();//para qe continue apareciendo el teclado despues de
                                  // darle done o chek
      },
    );
  }
}
