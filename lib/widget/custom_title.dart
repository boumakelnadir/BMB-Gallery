import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
    required this.size,
    this.sizeSubTitle,
    this.color,
    this.colorSubTitle,
    this.subTitle,
  });
  final String title;
  final double size;
  final Color? color;
  final String? subTitle;
  final Color? colorSubTitle;
  final double? sizeSubTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                textAlign: TextAlign.left,
                title,
                style: TextStyle(
                  fontSize: size,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          Text(
            textAlign: TextAlign.left,
            subTitle ?? title,
            style: TextStyle(
              fontSize: sizeSubTitle,
              fontWeight: FontWeight.bold,
              color: colorSubTitle,
            ),
          ),
        ],
      ),
    );
  }
}
