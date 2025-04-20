import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Core/Const/colors.dart';

class ContactUsWidget extends StatelessWidget {
  final String phoneNumber = '+201017104167';
  final String whatsappNumber = '+201017104167';
  final String facebookUrl = 'https://facebook.com/anotherChance';
  final String instagramUrl = 'https://instagram.com/anotherChance';
  final String twitterUrl = 'https://twitter.com/anotherChance';

  const ContactUsWidget({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _openWhatsApp() {
    final whatsappUrl = "https://wa.me/${whatsappNumber.replaceAll('+', '')}";
    _launchUrl(whatsappUrl);
  }

  void _callPhoneNumber() {
    final telUrl = "tel:$phoneNumber";
    _launchUrl(telUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 10,
            margin: const EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            color: Colors.white.withOpacity(0.85),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Let\'s Get in Touch!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'We’re here to help. Reach out through any of the methods below.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  _buildContactTile(
                    icon: Icons.phone,
                    title: phoneNumber,
                    onTap: _callPhoneNumber,
                  ),
                  _buildContactTile(
                    icon: Icons.chat,
                    title: 'WhatsApp',
                    onTap: _openWhatsApp,
                  ),
                  const Divider(),
                  _buildContactTile(
                    icon: Icons.facebook,
                    title: 'Facebook',
                    onTap: () => _launchUrl(facebookUrl),
                  ),
                  _buildContactTile(
                    icon: Icons.camera_alt,
                    title: 'Instagram',
                    onTap: () => _launchUrl(instagramUrl),
                  ),
                  _buildContactTile(
                    icon: Icons.alternate_email,
                    title: 'Twitter',
                    onTap: () => _launchUrl(twitterUrl),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactTile(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: cPrimaryColor.withOpacity(0.3)),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
