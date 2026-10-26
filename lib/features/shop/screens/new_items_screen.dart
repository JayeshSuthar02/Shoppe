import 'package:flutter/material.dart';
import 'package:shoppe/features/shop/screens/product_detail_screen.dart';

class NewItemsScreen extends StatelessWidget {
  const NewItemsScreen({super.key});

  static const List<Map<String, dynamic>> newProductsList = [
    {
      'title': 'New Trend Fashion Jacket',
      'image': 'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg',
      'price': 49.00,
      'originalPrice': 69.00,
      'discount': '-28%',
    },
    {
      'title': 'Sneakers Sport Shoes',
      'image': 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg',
      'price': 59.00,
      'originalPrice': 79.00,
      'discount': '-25%',
    },
    {
      'title': 'Luxury Gold Watch',
      'image': 'https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg',
      'price': 89.00,
      'originalPrice': 120.00,
      'discount': '-26%',
    },
    {
      'title': 'Stylish Leather Handbag',
      'image': 'https://images.pexels.com/photos/1152077/pexels-photo-1152077.jpeg',
      'price': 65.00,
      'originalPrice': 85.00,
      'discount': '-23%',
    },
    {
      'title': 'Classic Dark Sunglasses',
      'image': 'https://images.pexels.com/photos/701877/pexels-photo-701877.jpeg',
      'price': 35.00,
      'originalPrice': 45.00,
      'discount': '-22%',
    },
    {
      'title': 'Urban Streetwear Hoodie',
      'image': 'https://images.pexels.com/photos/1183266/pexels-photo-1183266.jpeg',
      'price': 75.00,
      'originalPrice': 95.00,
      'discount': '-21%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'New Arrivals',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Tagline & Count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${newProductsList.length} New Products Added',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.new_releases, color: Colors.blue, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Latest',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // Grid List of New Items
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.68,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: newProductsList.length,
                  itemBuilder: (context, index) {
                    final item = newProductsList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              title: item['title'],
                              imagePath: item['image'],
                              price: item['price'],
                              originalPrice: item['originalPrice'],
                              discount: item['discount'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(12),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(15),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(15),
                                      ),
                                      child: item['image'].toString().startsWith('http')
                                          ? Image.network(
                                              item['image'],
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) =>
                                                  const Icon(Icons.image,
                                                      color: Colors.grey, size: 50),
                                            )
                                          : Image.asset(
                                              item['image'],
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) =>
                                                  const Icon(Icons.image,
                                                      color: Colors.grey, size: 50),
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Text(
                                        'NEW',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title'],
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${item['price'].toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        '\$${item['originalPrice'].toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
