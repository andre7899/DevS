import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key, required this.onValue});

  final ValueChanged<String> onValue;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    // final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textController.text;
          print('button: $textValue');
          textController.clear();
          onValue(textValue);
        },
      ),
    );
    return TextFormField(
      focusNode: focusNode,
      onTapOutside: (event) => focusNode.unfocus(),
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit $value');
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
