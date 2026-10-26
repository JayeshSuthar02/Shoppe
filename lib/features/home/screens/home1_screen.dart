import 'package:flutter/material.dart';
import 'package:shoppe/features/home/widgets/category_list.dart';
import 'package:shoppe/features/home/widgets/banner_widget.dart';
import 'package:shoppe/features/home/widgets/flash_sale_timer.dart';
import 'package:shoppe/features/home/widgets/flash_sale_item.dart';
import 'package:shoppe/features/shop/screens/categories_screen.dart';
import 'package:shoppe/features/shop/screens/category_products_screen.dart';
import 'package:shoppe/features/shop/screens/product_detail_screen.dart';
import 'package:shoppe/features/shop/screens/flashsale_screen.dart';
import 'package:shoppe/features/shop/screens/new_items_screen.dart';

class Home1Screen extends StatefulWidget {
  const Home1Screen({super.key});

  @override
  State<Home1Screen> createState() => _Home1ScreenState();
}

class _Home1ScreenState extends State<Home1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shop',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 35,
                      width: 240,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          contentPadding: EdgeInsets.only(left: 15),
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                BannerWidget(),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoriesScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryProductsScreen(categoryName: 'Clothing')
                          ),
                        );
                      },
                      child: CategoryList(
                        images: const [
                          'assets/images/Shop/clothing_1.png',
                          'assets/images/Shop/clothing_2.png',
                          'assets/images/Shop/clothing_3.png',
                          'assets/images/Shop/clothing_4.png',
                        ],
                        title: 'Clothing',
                        number: '109',
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryProductsScreen(categoryName: 'Shoes')
                          ),
                        );
                      },
                      child: CategoryList(
                        images: const [
                          'https://images.pexels.com/photos/8079829/pexels-photo-8079829.jpeg',
                          'https://images.pexels.com/photos/38914242/pexels-photo-38914242.jpeg',
                          'https://images.pexels.com/photos/27256456/pexels-photo-27256456.jpeg',
                          'https://images.pexels.com/photos/36055201/pexels-photo-36055201.jpeg',
                        ],
                        title: 'Shoes',
                        number: '530',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryProductsScreen(categoryName: 'Watch')
                          ),
                        );
                      },
                      child: CategoryList(
                        images: const [
                          'https://images.pexels.com/photos/32452826/pexels-photo-32452826.jpeg',
                          'https://images.pexels.com/photos/34179696/pexels-photo-34179696.jpeg',
                          'https://images.pexels.com/photos/37050003/pexels-photo-37050003.jpeg',
                          'https://images.pexels.com/photos/17717727/pexels-photo-17717727.jpeg',
                        ],
                        title: 'Watch',
                        number: '530',
                      ),
                    ),
                    

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryProductsScreen(categoryName: 'Hoodies')
                          ),
                        );
                      },
                      child: CategoryList(
                        images: const [
                          'assets/images/Shop/hoodies_1.png',
                          'assets/images/Shop/hoodies_2.png',
                          'assets/images/Shop/hoodies_3.png',
                          'assets/images/Shop/hoodies_4.png',
                        ],
                        title: 'Hoodies',
                        number: '530',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Top Products',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 2),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Image.asset(
                          'assets/images/Category/topproduct_1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 2),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Image.asset(
                          'assets/images/Category/topproduct_2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 2),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Image.asset(
                          'assets/images/Category/topproduct_3.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 2),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Image.asset(
                          'assets/images/Category/topproduct_4.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 2),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Image.asset(
                          'assets/images/Category/topproduct_5.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'New Items',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewItemsScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        children: [
                          Text(
                            'See All',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_circle_right,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: NewItemsScreen.newProductsList.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: GestureDetector(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: item['image'].toString().startsWith('http')
                                      ? Image.network(
                                          item['image'],
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) =>
                                              const Icon(Icons.image, color: Colors.grey),
                                        )
                                      : Image.asset(
                                          item['image'],
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 140,
                                child: Text(
                                  item['title'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${item['price'].toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FlashSaleScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      const Text(
                        'Flash Sale',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.watch_later_outlined, color: Colors.blue),
                      const SizedBox(width: 5),
                      const FlashSaleTimer(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: FlashSaleScreen.allProducts.take(3).map((p) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FlashSaleItem(
                              imagePath: p.imagePath,
                              discount: '-${p.discount}%',
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 9),
                    Row(
                      children: FlashSaleScreen.allProducts.skip(3).take(3).map((p) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FlashSaleItem(
                              imagePath: p.imagePath,
                              discount: '-${p.discount}%',
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Most Popular',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FlashSaleScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        children: [
                          Text(
                            'See All',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_circle_right,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailScreen(
                                title: 'Most Popular Trendy Item 1',
                                imagePath: 'assets/images/MS1.png',
                                price: 89.99,
                                originalPrice: 109.99,
                                discount: '-18%',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 140,
                          width: 104,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 5),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6),
                                child: SizedBox(
                                  child: Image.asset(
                                    'assets/images/MS1.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 6,
                                      right: 6,
                                      top: 2,
                                    ),
                                    child: Text(
                                      '1780',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: -0.15,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.blue,
                                    size: 12,
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 6),
                                    child: Text(
                                      'New',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailScreen(
                                title: 'Most Popular Classic Item 2',
                                imagePath: 'assets/images/MS2.png',
                                price: 79.99,
                                originalPrice: 99.99,
                                discount: '-20%',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 140,
                          width: 104,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 5),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6),
                                child: SizedBox(
                                  child: Image.asset(
                                    'assets/images/MS2.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 6,
                                      right: 6,
                                      top: 2,
                                    ),
                                    child: Text(
                                      '1780',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.blue,
                                    size: 11,
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 6),
                                    child: Text(
                                      'Sale',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailScreen(
                                title: 'Most Popular Hot Item 3',
                                imagePath: 'assets/images/MS3.png',
                                price: 99.99,
                                originalPrice: 129.99,
                                discount: '-23%',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 140,
                          width: 104,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 5),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6),
                                child: SizedBox(
                                  child: Image.asset(
                                    'assets/images/MS3.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 6,
                                  right: 6,
                                  top: 2,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '1780',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.blue,
                                      size: 11,
                                    ),
                                    Spacer(),
                                    Text(
                                      'Hot',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Just For You',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(Icons.star, color: Colors.blue, size: 20),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductDetailScreen(
                                  title: 'Special Selection Item 1',
                                  imagePath: 'assets/images/Category/justforyou_1.png',
                                  price: 79.00,
                                  originalPrice: 99.00,
                                  discount: '-20%',
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 180,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/Category/justforyou_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const SizedBox(
                                width: 140,
                                child: Text(
                                  'Just for you',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const SizedBox(
                                width: 140,
                                child: Text(
                                  '\$79.00',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductDetailScreen(
                                  title: 'Special Selection Item 2',
                                  imagePath: 'assets/images/Category/justforyou_2.png',
                                  price: 79.00,
                                  originalPrice: 99.00,
                                  discount: '-20%',
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 180,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/Category/justforyou_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const SizedBox(
                                width: 140,
                                child: Text(
                                  'Just for you',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const SizedBox(
                                width: 140,
                                child: Text(
                                  '\$79.00',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductDetailScreen(
                                  title: 'Exclusive Fashion Item 3',
                                  imagePath: 'assets/images/Category/justforyou_3.png',
                                  price: 99.00,
                                  originalPrice: 129.00,
                                  discount: '-23%',
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 180,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/Category/justforyou_3.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const SizedBox(
                                width: 140,
                                child: Text(
                                  'Just for you',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const SizedBox(
                                width: 140,
                                child: Text(
                                  '\$99.00',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductDetailScreen(
                                  title: 'Exclusive Fashion Item 4',
                                  imagePath: 'assets/images/Category/justforyou_4.png',
                                  price: 99.00,
                                  originalPrice: 129.00,
                                  discount: '-23%',
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 180,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/Category/justforyou_4.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const SizedBox(
                                width: 140,
                                child: Text(
                                  'Just For you',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const SizedBox(
                                width: 140,
                                child: Text(
                                  '\$99.00',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
}
