import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecycleScreen extends StatelessWidget {
  const RecycleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title Section
                const Text(
                  "See how it’s made",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  color: Colors.grey[200], // Gray container background
                  child: const Text(
                    "Discover the journey of transforming discarded plastic into innovative eco-friendly products. Each step reflects our commitment to sustainability and quality craftsmanship.",
                    style: TextStyle(fontSize: 16.0,),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24.0),

                // Step Cards (2 per row)
                Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: [
                    // Step 1
                    _buildStepCard(
                      number: "1",
                      title: "Collection",
                      description:
                      "Plastic waste is carefully sourced from trusted recycling programs.",
                      imagePath: "assets/images/collection.png", // Replace with your image
                    ),
                    // Step 2
                    _buildStepCard(
                      number: "2",
                      title: "Sorting",
                      description:
                      "Materials are sorted, cleaned, and prepared for processing.",
                      imagePath: "assets/images/sorting.png", // Replace with your image
                    ),
                    // Step 3
                    _buildStepCard(
                      number: "3",
                      title: "Transformation",
                      description:
                      "Advanced techniques convert plastic into durable raw materials.",
                      imagePath: "assets/images/transformation.png", // Replace with your image
                    ),
                    // Step 4
                    _buildStepCard(
                      number: "4",
                      title: "Creation",
                      description:
                      "Advanced techniques convert plastic into durable raw materials.",
                      imagePath: "assets/images/creation.png", // Replace with your image
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget for each step card
  Widget _buildStepCard({
    required String number,
    required String title,
    required String description,
    required String imagePath,
  }) {
    return InkWell(
      onTap: (){

      },
      child: SizedBox(
        width: .42.sw, // Divide space for two cards per row
        child: Stack(
          children: [
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8.0), // Space for number
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    Image.asset(
                      imagePath,
                      height: 80.0,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14.0, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -2,
              left: 16.0,
              child: Text(
                "$number.",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
