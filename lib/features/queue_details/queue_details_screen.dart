import 'package:flutter/material.dart';
import 'package:grad_project/features/queue_details/widgets/app_bar_widget.dart';
import 'package:grad_project/features/queue_details/widgets/auto_pharmacy_queue_card.dart';
import 'package:grad_project/features/queue_details/widgets/back_to_home.dart';
import 'package:grad_project/features/queue_details/widgets/patient_info.dart';
import 'package:grad_project/features/queue_details/widgets/patient_ticket.dart';
import 'package:grad_project/features/queue_details/widgets/qr_header.dart';
import 'package:grad_project/features/queue_details/widgets/qr_scan.dart';

class QueueDetailsScreen extends StatelessWidget {
  const QueueDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 310,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  AppBarWidget(),
                  Positioned(
                    top: 90,
                    left: 20,
                    right: 20,
                    child: PatientTicket(),
                  ),
                ],
              ),
            ),
            QrHeader(),
            QrScan(),
            PatientInfo(),
            AutoPharmacyQueueCard(),
            BackToHome(),
          ],
        ),
      ),
    );
  }
}
