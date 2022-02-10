import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CardApp extends StatelessWidget {
  final NetworkImage imgCard;
  final String titleCard;

  const CardApp({
    Key? key,
    required this.imgCard,
    required this.titleCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black54,
      elevation: 1.0,
      color: const Color(0xfffbfbfb),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 30.0, top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 150.0,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imgCard,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -20.0,
                        left: 55.0,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: const Icon(
                            MdiIcons.heart,
                            color: Color(0xffff7723),
                          ),
                          backgroundColor: Colors.white,
                          mini: true,
                        ),
                      ),
                      Positioned(
                        top: -25.0,
                        right: -200.0,
                        child: FloatingActionButton.small(
                          onPressed: () {},
                          child: const Icon(
                            MdiIcons.dotsHorizontal,
                            color: Color(0xffb4b4b4),
                            textDirection: TextDirection.ltr,
                            semanticLabel: 'Icon',
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      titleCard,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
