// Social Icon reuseable widget
import 'package:flutter/material.dart';

InkWell socialIconButton(ontap, imagePath) {
  return InkWell(
    borderRadius: BorderRadius.circular(50),
    onTap: ontap,
    child: Ink(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset(imagePath),
      ),
    ),
  );
}
