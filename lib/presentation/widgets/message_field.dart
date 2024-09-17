import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageField extends StatelessWidget {
  final onValue;
  const MessageField({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        decoration: InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: "Ingresa tu mensage",
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                final textValue = textController.value.text;
                print(textValue);
                onValue(textValue);
                focusNode.requestFocus();
                textController.clear();
              },
            )),
        onFieldSubmitted: (value) {
          print("Submit");
          onValue(value);
          focusNode.requestFocus();
          textController.clear();
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }
}
