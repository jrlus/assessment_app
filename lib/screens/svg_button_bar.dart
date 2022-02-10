import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgButtonBar extends StatelessWidget {
  final String imgSvg;
  final Color colorSvg;
  final double heightSvg = 30.0;
  final double widthSvg = 30.0;

  const SvgButtonBar({
    Key? key,
    required this.imgSvg,
    this.colorSvg = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imgSvg,
      width: widthSvg,
      height: heightSvg,
      color: colorSvg,
      cacheColorFilter: true,
      matchTextDirection: true,
    );
  }
}