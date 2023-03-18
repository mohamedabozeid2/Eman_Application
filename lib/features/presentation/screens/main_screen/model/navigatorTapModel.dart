import 'package:flutter/material.dart';

class NavigatorTapModel {
  final String image;
  final Color firstColor;
  final Color secondColor;
  final String title;
  final Widget pathWidget;

  NavigatorTapModel({
    required this.title,
    required this.firstColor,
    required this.secondColor,
    required this.image,
    required this.pathWidget,
  });
}
