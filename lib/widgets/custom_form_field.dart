import 'package:flutter/material.dart';

Widget customFormField(
    {String? label,
    String? hint,
    controller,
    prefixIcon,
    suffixIcon,
    validator,
    keyBoardType,
    obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: TextFormField(
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyBoardType,
          controller: controller,
          decoration: InputDecoration(
              hintText: hint,
              contentPadding: EdgeInsets.all(15),
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
              enabled: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.white,
              filled: true,
              isDense: true),
        ),
      ),
    ],
  );
}
