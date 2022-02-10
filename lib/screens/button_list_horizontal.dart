import 'package:flutter/material.dart';

class ButtonListHorizontal extends StatelessWidget {
  final String textButton;
  final Color backgroundColorButton;

  const ButtonListHorizontal({
    Key? key,
    required this.paddingListH,
    required this.textButton,
    required this.backgroundColorButton,
  }) : super(key: key);

  final EdgeInsets paddingListH;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingListH,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: 3,
          shadowColor: Colors.white,
          backgroundColor: backgroundColorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          side: BorderSide.none,
        ),
        onPressed: () {},
        child: Text(textButton,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }

}