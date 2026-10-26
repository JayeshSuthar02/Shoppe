import 'package:flutter/material.dart';
import 'package:shoppe/features/shop/screens/product_detail_screen.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;

  const CategoryProductsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dummyProducts = List.generate(
      10,
      (index) => {
        'name': '$categoryName Item ${index + 1}',
        'price': (index + 1) * 15.0,
        'originalPrice': (index + 1) * 20.0,
        'image': _getDummyImageForCategory(categoryName, index),
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(categoryName, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Filter/Sort Row
              Row(
                children: [
                  Text(
                    '${dummyProducts.length} Items found',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Products Grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: dummyProducts.length,
                  itemBuilder: (context, index) {
                    final product = dummyProducts[index];
                    return _buildProductCard(context, product);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              title: product['name'],
              imagePath: product['image'],
              price: product['price'],
              originalPrice: product['originalPrice'],
            ),
          ),
        );
      },
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: product['image'].toString().startsWith('http')
                  ? Image.network(
                      product['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image, color: Colors.grey, size: 50),
                    )
                  : Image.asset(
                      product['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image, color: Colors.grey, size: 50),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product['name'],
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              '\$${product['price'].toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 5),
            Text(
              '\$${product['originalPrice'].toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.red.shade300,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ],
    ),
    );
  }

  String _getDummyImageForCategory(String category, int index) {
    // 1. Har category ke liye alag-alag multiple images ki List banayein
    final List<String> clothingImages = [
      'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?q=80&w=500&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?q=80&w=500&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?q=80&w=500&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1556821840-3a63f95609a7?q=80&w=500&auto=format&fit=crop',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfAYjSqOuFv6GbhXRvoSoyOC7i8pbn1NvcmQMVFwr5kQ&s=10',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhvmL84CmiCAIi3AKNSvc8GcKNXpq9Jo28ukyXOBMWpw&s=10',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpw2zz_DeH7icA1K9c-LHg7ejs25qlWkM1ayUA-1aCOA&s=10',
    ];

    final List<String> shoesImages = [
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=500&auto=format&fit=crop',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNsb5maYpqnkwELPOXfaMugywhRNcCDn7PMO3FXtNA8Q&s=10',
      'https://images.unsplash.com/photo-1608231387042-66d1773070a5?q=80&w=500&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?q=80&w=500&auto=format&fit=crop',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw8DM1uFksYZS1j3g3jAFTjrOfhy3vWjenvda1GGIuMA&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2IQkVKVKBcK_ZTUMXIbIh5Vg8LLA_AFBXTZqecQr9mg&s',
    ];

    final List<String> watchImages = [
      'https://images.unsplash.com/photo-1524805444758-089113d48a6d?q=80&w=500&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?q=80&w=500&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1542496658-e33a6d0d50f6?q=80&w=500&auto=format&fit=crop',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6G-EfCj_rcaR8BIN6Ck10KUy6RpY2XR1esbtZyqP4yA&s=10',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSboXkX20rGXKvCl6xPlZglZeTNAS-8Q0WafaBdJf7OGA&s=10',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsjfO-mtS9L7VajwbEB3ZCp4AUU3HCVML29TbovxDPew&s=10',
    ];

    final List<String> hoodiesImages = [
      'https://images.unsplash.com/photo-1556821840-3a63f95609a7?q=80&w=500&auto=format&fit=crop', // Hoodie 1
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_tGungXMbVWwwza4j1W2liloHo_I9MNryJcmeI7kIOg&s=10',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsGa9Ad98enNbqpMel6CHrlGSDu-yZQi1nY_myVxSSpA&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwBhhjFdLjkn7gUd0BqYic41RfYaYQMiDsEIJ0MZoNbg&s=10',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8NjJNIGhM9jNzm65NJ3kcUjxnRal_R3i5O45en-sChA&s=10',
    ];

    // 2. Modulo (%) operator ka use karke index ke hisaab se image bhejein
    // % ka fayda ye hai ki agar list mein 3 image hain aur item 10 hain, toh images repeat hongi par error nahi aayega.
    if (category.toLowerCase() == 'clothing') {
      return clothingImages[index % clothingImages.length];
    } else if (category.toLowerCase() == 'shoes') {
      return shoesImages[index % shoesImages.length];
    } else if (category.toLowerCase() == 'watch') {
      return watchImages[index % watchImages.length];
    } else if (category.toLowerCase() == 'hoodies') {
      return hoodiesImages[index % hoodiesImages.length];
    }

    return 'https://via.placeholder.com/500?text=No+Image'; // Fallback
  }
}
