import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/support/widgets/asked_q_Item.dart';
import 'package:grad_project/support/widgets/support_point.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Help & Support",
          style: AppStyles.blackBold16.copyWith(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Need assistance with your clinic queue or app features? We're here to help!",
                style: AppStyles.black18SemiBold.copyWith(height: 1.5),
              ),
              SizedBox(height: 20),

              SupportPoint(
                title: 'Live Queue Support',
                description: 'For immediate issues regarding your active ticket, delays, or clinic check-in, please speak directly with the clinic’s reception desk or use the in-app support chat.',
              ),
              SupportPoint(
                title: 'Contact Us',
                description: 'For technical issues, feedback, or clinic partnerships, reach our support team at support@silentqueue.com or call our hotline at +20 123 456 7890.',
              ),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              Text(
                "Common FAQs",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              AskedQItem(
                question: 'How do I join a queue?',
                answer: "Simply scan the clinic's QR code or select the department from the app.",
              ),
              AskedQItem(
                question: 'Will my name be called out loud?',
                answer: 'No! Silent Queue uses digital tickets and push notifications instead of calling names in the waiting room.',
              ),
              AskedQItem(
                question: 'Can I cancel my ticket?',
                answer: 'Yes, you can cancel your spot anytime directly from your active ticket screen.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
