import 'package:flutter/material.dart';

import '../data/coffee.dart';

class CoffeeDetailScreen extends StatelessWidget {
  final Coffee coffee;
  const CoffeeDetailScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(coffee.name),
        backgroundColor: Colors.brown[100],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ☕ Big Coffee Image
            Hero(
              tag: coffee.name,
              child: Image.network(
                coffee.image,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 100),
              ),
            ),

            const SizedBox(height: 20),

            // 📝 Coffee Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffee.name,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    coffee.description,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),

                  // 🥛 Ingredients
                  const Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: coffee.ingredients.map((item) {
                      return Chip(label: Text(item));
                    }).toList(),
                  ),

                  const SizedBox(height: 30),

                  // 💰 Price
                  Text(
                    "Price: ₹${coffee.price}",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 🛒 Order Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Order Placed Successfully!")),
                    );
                  },
                  child: const Text("Order Now", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
