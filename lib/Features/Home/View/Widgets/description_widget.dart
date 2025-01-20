import 'package:flutter/material.dart';

class ProductDescriptionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(8),
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
            "32.51 x 21.84 x 12.19 cm; 952.54",
          ),
          _buildDescriptionRow("Grams Date First Available", "6 Jun. 2020"),
          _buildDescriptionRow("Manufacturer", "Fila ASIN : B089RQLYNW"),
          _buildDescriptionRow("Item model number", "5JM00948-990"),
          _buildDescriptionRow("Department", "Women's"),
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

