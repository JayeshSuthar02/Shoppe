import 'package:flutter/material.dart';
import 'package:shoppe/core/utils/cart_wishlist_manager.dart';
import 'package:shoppe/features/home/screens/home1_screen.dart';
import 'package:shoppe/features/profile/screens/profile_screen.dart';
import 'package:shoppe/features/shop/screens/categories_screen.dart';
import 'package:shoppe/features/shop/screens/cart_screen.dart';
import 'package:shoppe/features/shop/screens/wishlist_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    Home1Screen(),
    WishlistScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ValueListenableBuilder<List<ProductItem>>(
              valueListenable: CartWishlistManager.wishlistNotifier,
              builder: (context, wishlist, child) {
                return Badge(
                  isLabelVisible: wishlist.isNotEmpty,
                  label: Text('${wishlist.length}'),
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.favorite_border),
                );
              },
            ),
            activeIcon: ValueListenableBuilder<List<ProductItem>>(
              valueListenable: CartWishlistManager.wishlistNotifier,
              builder: (context, wishlist, child) {
                return Badge(
                  isLabelVisible: wishlist.isNotEmpty,
                  label: Text('${wishlist.length}'),
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.favorite),
                );
              },
            ),
            label: 'Like',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: ValueListenableBuilder<List<ProductItem>>(
              valueListenable: CartWishlistManager.cartNotifier,
              builder: (context, cart, child) {
                return Badge(
                  isLabelVisible: cart.isNotEmpty,
                  label: Text('${cart.length}'),
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.shopping_cart_outlined),
                );
              },
            ),
            activeIcon: ValueListenableBuilder<List<ProductItem>>(
              valueListenable: CartWishlistManager.cartNotifier,
              builder: (context, cart, child) {
                return Badge(
                  isLabelVisible: cart.isNotEmpty,
                  label: Text('${cart.length}'),
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.shopping_cart),
                );
              },
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
