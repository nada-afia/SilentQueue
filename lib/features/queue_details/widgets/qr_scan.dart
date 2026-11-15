import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
      child: QrImageView(
        data: 'TICKET-1042',
        version: QrVersions.auto,
        size: 200,
        backgroundColor: Colors.white,
      ),
    );
  }
}
