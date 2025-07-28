import 'package:flutter/material.dart';

import '../data/coffee_data.dart';
import 'coffee_detail_screen.dart';

class Homescreen extends StatelessWidget {
  final String username = "Sreeshna";
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Greeting
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  'Good Morning, $username 👋',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 25),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //  Horizontal PageView with 3 network images
              SizedBox(
                height: 200,
                child: PageView(
                  controller: PageController(viewportFraction: 0.9),
                  scrollDirection: Axis.horizontal,
                  children: [
                    promoCard("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWbnadI7qtnl84_CB2OLY6T4WGFXSz3VNLDw&s"),
                    promoCard("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJa90ACoCcz9ixl1Tj5Oax8CRcODQcrAOO5g&s"),
                    promoCard("https://marketplace.canva.com/EAGIBdu-HGc/1/0/1600w/canva-brown-and-white-geometric-we-are-open-banner-7lCFIM8VuLE.jpg"),
                  ],
                ),
              ),   const SizedBox(height: 25),

              // ☕ Coffee Section Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: const Text(
                  "Our Coffees",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 10),

              // ☕ Coffee List (from coffee_data.dart)
              ListView.builder(
                shrinkWrap: true, // ✅ important for scroll inside Column
                physics: const NeverScrollableScrollPhysics(),
                itemCount: coffeeList.length,
                itemBuilder: (context, index) {
    final coffee = coffeeList[index];
    return InkWell(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => CoffeeDetailScreen(coffee: coffee),
    ),
    );
    },
    child: Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
    BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
    ],
    ),
    child: Row(
    children: [
    // ☕ Bigger Coffee Image with Hero animation
    Hero(
    tag: coffee.name,
    child: ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Image.network(
    coffee.image,
    width: 100,
    height: 100,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) =>
    const Icon(Icons.broken_image, size: 60),
    ),
    ),
    ),
    const SizedBox(width: 15),

    // 📝 Coffee Details
    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(coffee.name,
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    const SizedBox(height: 5),
    Text(coffee.description,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(color: Colors.grey[700])),
    const SizedBox(height: 8),
    Text("₹${coffee.price}",
    style: const TextStyle(fontSize: 18, color: Colors.brown, fontWeight: FontWeight.w600)),
    ],
    ),
    ),
    const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
    ],
    ),
    ),
    );
    },
)
] )))
);
}
  // 🔧 Helper for Promo Cards
  Widget promoCard(String url) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      ),
    );
  }
}
