import 'package:flutter/material.dart';
import 'package:shoppe/features/home/widgets/flash_sale_timer.dart';
import 'package:shoppe/features/shop/screens/product_detail_screen.dart';

class Product {
  final String imagePath;
  final String title;
  final double originalPrice;
  final int discount;

  Product({
    required this.imagePath,
    required this.title,
    required this.originalPrice,
    required this.discount,
  });

  double get price => originalPrice - (originalPrice * discount / 100);
}

class FlashSaleScreen extends StatefulWidget {
  const FlashSaleScreen({super.key});

  static final List<Product> allProducts = [
    Product(
      imagePath: 'assets/images/Category/flashsale_1.png',
      title: 'Flash Sale Special Item 1',
      originalPrice: 20.00,
      discount: 20,
    ),
    Product(
      imagePath: 'assets/images/Category/flashsale_2.png',
      title: 'Flash Sale Special Item 2',
      originalPrice: 30.00,
      discount: 20,
    ),
    Product(
      imagePath: 'assets/images/Category/flashsale_3.png',
      title: 'Flash Sale Special Item 3',
      originalPrice: 25.00,
      discount: 40,
    ),
    Product(
      imagePath: 'assets/images/Category/flashsale_4.png',
      title: 'Flash Sale Special Item 4',
      originalPrice: 50.00,
      discount: 50,
    ),
    Product(
      imagePath: 'assets/images/Category/flashsale_5.png',
      title: 'Flash Sale Special Item 5',
      originalPrice: 40.00,
      discount: 20,
    ),
    Product(
      imagePath: 'assets/images/Category/flashsale_6.png',
      title: 'Flash Sale Special Item 6',
      originalPrice: 100.00,
      discount: 50,
    ),
  ];

  @override
  State<FlashSaleScreen> createState() => _FlashSaleScreenState();
}

class _FlashSaleScreenState extends State<FlashSaleScreen> {
  int selectedDiscount = 0; // 0 means 'All'

  final List<int> discountFilters = [0, 20, 30, 40, 50];

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = selectedDiscount == 0
        ? FlashSaleScreen.allProducts
        : FlashSaleScreen.allProducts.where((p) => p.discount == selectedDiscount).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Flash Sale', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Flash Sale',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.watch_later_outlined, color: Colors.blue),
                          const SizedBox(width: 5),
                          const FlashSaleTimer(),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Choose Your Discount',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Filters Row
                  Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: discountFilters.map((discount) {
                        return _buildFilterChip(discount);
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            
            // --- SCROLLABLE BOTTOM SECTION ---
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // Banner Image
                      Stack(
                        children: [
                          Container(
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/Shop/flashsale/flashsale.png',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.image, size: 50, color: Colors.grey),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'Live',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            selectedDiscount == 0 ? 'All Discounts' : '$selectedDiscount% Discount',
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // Grid of Products
                      filteredProducts.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Center(child: Text("No items found for this discount")),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.72,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                              ),
                              itemCount: filteredProducts.length,
                              itemBuilder: (context, index) {
                                return _buildProductCard(filteredProducts[index]);
                              },
                            ),
                      const SizedBox(height: 20), // Bottom padding for scroll
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildFilterChip(int discount) {
    bool isSelected = selectedDiscount == discount;
    String text = discount == 0 ? 'All' : '$discount%';

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDiscount = discount;
        });
      },
      child: Container(
        height: 35,
        width: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  const BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.blue : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              title: product.title,
              imagePath: product.imagePath,
              price: product.price,
              originalPrice: product.originalPrice,
              discount: '-${product.discount}%',
            ),
          ),
        );
      },
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      product.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '-${product.discount}%',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ),
        const SizedBox(height: 8),
        Text(
          product.title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '\$${product.originalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
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
}
