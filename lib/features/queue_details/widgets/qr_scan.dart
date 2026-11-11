import 'package:flutter/material.dart';

class QrScan extends StatelessWidget {
  const QrScan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(Icons.qr_code_2, size: 200),
    );
  }
}
