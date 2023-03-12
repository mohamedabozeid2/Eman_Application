import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveIndicator extends StatelessWidget {
  final String os;
  final Color color;

  const AdaptiveIndicator({super.key, required this.os, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    if (os == 'android') {
      return CircularProgressIndicator(color: color,);
    }
    return CupertinoActivityIndicator(color: color,);
  }
}
