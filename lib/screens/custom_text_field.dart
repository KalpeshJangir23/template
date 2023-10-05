// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:template/screens/colorsutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool enabled;
  final TextEditingController controller;
  final int maxLine;
  final bool showDiv;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.enabled,
    required this.controller,
    required this.maxLine,
    required this.showDiv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(color: textColor),
          decoration: InputDecoration(label: Text(hintText), labelStyle: TextStyle(color: textColor), border: InputBorder.none),
          enabled: enabled,
          controller: controller,
          maxLines: maxLine,
        ),
        if (showDiv)
          Divider(
            thickness: 2,
            color: Colors.white60,
          )
      ],
    );
  }
}
