import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _contactItem(
          title: 'Products & Order',
          phoneNumber: '+1 123-456-7890',
          icon: Icons.phone_outlined,
        ),
        _contactItem(
          title: 'Info & Enquiries',
          phoneNumber: '+1 123-456-7890',
          icon: Icons.info_outline,
        ),
        _contactItem(
          title: 'Store Locator',
          phoneNumber: '+1 123-456-7890',
          icon: Icons.location_on_outlined,
        ),
        const SizedBox(height: 20),
        const Text(
          'Stay In Touch',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialMediaIcon(Icons.facebook),
            const SizedBox(width: 20),
            _socialMediaIcon(Icons.facebook),
            const SizedBox(width: 20),
            _socialMediaIcon(Icons.facebook)
          ],
        ),
      ],
    );
  }

  Widget _contactItem({required String title, required String phoneNumber, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                phoneNumber,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  launchUrl(Uri.parse('tel:$phoneNumber'));
                },
                icon: Icon(icon),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _socialMediaIcon(IconData icon) {
    return IconButton(
      onPressed: () {}, // Implement social media links here
      icon: Icon(icon),
    );
  }
}