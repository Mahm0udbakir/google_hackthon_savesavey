import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/color_manager.dart';
import '../../../../helpers/text_styles.dart';

class TermsAndVerification extends StatefulWidget {
  const TermsAndVerification({super.key});

  @override
  _TermsAndVerificationState createState() => _TermsAndVerificationState();
}

class _TermsAndVerificationState extends State<TermsAndVerification> {
  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isAccepted = !_isAccepted;
              });
            },
            child: Icon(
              _isAccepted ? Icons.check_box : Icons.check_box_outline_blank,
              color: ColorManager.secondary,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'By clicking on ‘sign up’, you’re agreeing to the Save Savey app ',
                style: TextStyles.font15WhiteRegular,
                children: [
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyles.font15WhiteRegular.copyWith(
                      color: ColorManager.secondary,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showTermsDialog(context);
                      },
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyles.font15WhiteRegular.copyWith(
                      color: ColorManager.secondary,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showPrivacyPolicyDialog(context);
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showTermsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Terms of Service", style: TextStyles.font20BlackBold),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle("Effective Date: April 11, 2025"),
                      _buildParagraph(
                        "These Terms of Service govern your use of the Save Savey app. By signing up, you agree to abide by these terms and conditions.",
                      ),
                      _buildSectionTitle("1. User Responsibilities"),
                      _buildBulletPoint("Provide accurate account information."),
                      _buildBulletPoint("Ensure the security of your credentials."),
                      _buildBulletPoint("Do not engage in fraudulent activities."),
                      _buildSectionTitle("2. Account & Security"),
                      _buildParagraph("Your bank details and transaction history are securely stored and will not be shared without your consent."),
                      _buildSectionTitle("3. Changes to Terms"),
                      _buildParagraph("We may update these terms from time to time. Continued use means acceptance of the revised terms."),
                      _buildSectionTitle("4. Contact Us"),
                      _buildParagraph("For any questions, contact us at: anas.nasr132003@gmail.com"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Close", style: TextStyle(color: ColorManager.secondary, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showPrivacyPolicyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Privacy Policy", style: TextStyles.font20BlackBold),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle("Effective Date: April 11, 2025"),
                      _buildParagraph(
                        "Your privacy is important to us. This Privacy Policy explains how we collect, use, store, and protect your information.",
                      ),
                      _buildSectionTitle("1. Information We Collect"),
                      _buildBulletPoint("Personal Information (Name, Email, Phone, etc.)"),
                      _buildBulletPoint("Financial Information (Bank Account Details, Transactions)"),
                      _buildBulletPoint("Usage Data (App Behavior, IP Address)"),
                      _buildBulletPoint("Cookies & Tracking Technologies"),
                      _buildSectionTitle("2. How We Use Your Information"),
                      _buildBulletPoint("Provide Services - Manage transactions & accounts"),
                      _buildBulletPoint("Improve User Experience - Optimize performance"),
                      _buildBulletPoint("Comply with Legal Obligations"),
                      _buildBulletPoint("Communicate with You - Send updates & alerts"),
                      _buildSectionTitle("3. Security Measures"),
                      _buildBulletPoint("Encryption for secure data transmission"),
                      _buildBulletPoint("Secure Storage with restricted access"),
                      _buildBulletPoint("Fraud Prevention & Multi-Factor Authentication"),
                      _buildSectionTitle("4. Contact Us"),
                      _buildParagraph("For questions or concerns, contact us at:\n📧 Email: anas.nasr132003@gmail.com\n🌐 Website: [Website URL]"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Close", style: TextStyle(color: ColorManager.secondary, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 5),
    child: Text(
      title,
      style: TextStyles.font16BlackBold,
    ),
  );
}

Widget _buildParagraph(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Text(
      text,
      style: TextStyles.font14BlackRegular,
    ),
  );
}

Widget _buildBulletPoint(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, bottom: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Expanded(
          child: Text(
            text,
            style: TextStyles.font14BlackRegular,
          ),
        ),
      ],
    ),
  );
}
