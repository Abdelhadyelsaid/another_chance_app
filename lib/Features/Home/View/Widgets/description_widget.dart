import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescriptionCard extends StatelessWidget {
  const ProductDescriptionCard({super.key, required this.storeSnapshot});

  final DocumentSnapshot storeSnapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 1.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          _buildDescriptionRow(
            "Product Dimensions",
            storeSnapshot["product_dimensions"],
          ),
          _buildDescriptionRow(
              "Grams Date First Available", storeSnapshot["first_available"]),
          _buildDescriptionRow(
              "Item model number", storeSnapshot["model_number"]),
          _buildDescriptionRow("Department", storeSnapshot["Department"]),
        ],
      ),
    );
  }

  Widget _buildDescriptionRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 12, color: Colors.black),
          children: [
            TextSpan(
              text: "$title : ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
