import 'package:flutter/material.dart';

class SwiperCustomeText extends StatelessWidget {
  const SwiperCustomeText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(alignment: Alignment.centerLeft, child: Text(text)),
    );
  }
}
