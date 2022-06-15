import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  Widget? child;
  final double? height;
  final double? width;
  ButtonContainer(
      {Key? key, required this.child, this.height = 45, this.width = 45})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.grey.shade900,
          border: Border.all(width: 3, color: Colors.black26),
          gradient: LinearGradient(colors: [
            // Colors.grey.shade800,
            const Color(0XFF22262c),
            Colors.grey.shade900
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(14)),
      child: child,
    );
  }
}
