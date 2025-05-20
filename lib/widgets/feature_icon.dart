import 'package:flutter/material.dart';

class FeatureIcon extends StatelessWidget {
  final String iconPath;
  final String label;

  const FeatureIcon({super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          iconPath,
          height: 19,
          width: 28,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 8, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
