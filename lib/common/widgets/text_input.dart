import 'package:around_u/common/ui/ui.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      obscureText: false,
      decoration: Style.textInput,
    );
  }
}

TextField textField = TextField(
  obscureText: false,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Enter your username',
  ),
);
