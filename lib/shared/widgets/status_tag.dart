import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_theme.dart';

class StatusTag extends StatelessWidget {
  final String status;
  const StatusTag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    String text = status;

    switch (status.toLowerCase()) {
      case 'completed':
        backgroundColor = AppTheme.successColor;
        textColor = Colors.white;
        break;
      case 'ongoing':
        backgroundColor = AppTheme.infoColor;
        textColor = Colors.white;
        break;
      case 'stalled':
        backgroundColor = AppTheme.dangerColor;
        textColor = Colors.white;
        break;
      case 'planning':
        backgroundColor = AppTheme.warningColor;
        textColor = Colors.white;
        break;
      default:
        backgroundColor = Colors.grey.shade200;
        textColor = Colors.black87;
    }

    return Chip(
      label: Text(text),
      labelStyle: TextStyle(
          color: textColor, fontWeight: FontWeight.bold, fontSize: 12),
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      side: BorderSide.none,
    );
  }
}
