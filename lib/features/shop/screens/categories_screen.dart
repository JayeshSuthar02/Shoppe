import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int selectedIndex = 1; // Default to Female as in image

  Widget _buildTopButton(String title, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 45,
        width: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.blue.shade50 : Colors.grey.shade50,
          border: isSelected
              ? Border.all(color: Colors.blue, width: 1)
              : Border.all(color: Colors.transparent),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              color: isSelected ? Colors.blue : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> femaleCategories = const [
    {
      'title': 'Clothing',
      'imagePath': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfAYjSqOuFv6GbhXRvoSoyOC7i8pbn1NvcmQMVFwr5kQ&s=10',
      'subcategories': ['Dresses', 'Pants', 'Skirts', 'Shorts', 'Jackets', 'Hoodies', 'Shirts', 'Polo', 'T-Shirts', 'Tunics']
    },
    {
      'title': 'Shoes',
      'imagePath': 'https://images.pexels.com/photos/7857501/pexels-photo-7857501.jpeg',
      'subcategories': ['Heels', 'Flats', 'Sneakers', 'Running Shoes', 'Boots']
    },
    {
      'title': 'Bags',
      'imagePath': 'https://images.pexels.com/photos/36931056/pexels-photo-36931056.jpeg',
      'subcategories': ['Handbags', 'Wallets', 'Travel Bags', 'Backpacks']
    },
    {
      'title': 'Accessories',
      'imagePath': 'https://images.pexels.com/photos/37401695/pexels-photo-37401695.jpeg',
      'subcategories': ['Jewelry', 'Sunglasses', 'Hats', 'Belts']
    },
    {
      'title': 'Watches',
      'imagePath': 'https://images.pexels.com/photos/9713527/pexels-photo-9713527.jpeg',
      'subcategories': ['Analog', 'Digital', 'SmartWatch']
    },
  ];

  final List<Map<String, dynamic>> maleCategories = const [
    {
      'title': 'Clothing',
      'imagePath': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfAYjSqOuFv6GbhXRvoSoyOC7i8pbn1NvcmQMVFwr5kQ&s=10',
      'subcategories': ['Shirts', 'T-Shirts', 'Jeans', 'Pants', 'Shorts', 'Jackets', 'Hoodies', 'Suits']
    },
    {
      'title': 'Shoes',
      'imagePath': 'https://images.pexels.com/photos/7857501/pexels-photo-7857501.jpeg',
      'subcategories': ['Sneakers', 'Running Shoes', 'Formal Shoes', 'Boots', 'Loafers']
    },
    {
      'title': 'Bags',
      'imagePath': 'https://images.pexels.com/photos/36931056/pexels-photo-36931056.jpeg',
      'subcategories': ['Backpacks', 'Wallets', 'Travel Bags', 'Messengers']
    },
    {
      'title': 'Accessories',
      'imagePath': 'https://images.pexels.com/photos/37401695/pexels-photo-37401695.jpeg',
      'subcategories': ['Belts', 'Hats', 'Sunglasses', 'Ties']
    },
    {
      'title': 'Watches',
      'imagePath': 'https://images.pexels.com/photos/9713527/pexels-photo-9713527.jpeg',
      'subcategories': ['Analog', 'Digital', 'SmartWatch']
    },
    {
      'title': 'Grooming',
      'imagePath': 'https://images.pexels.com/photos/35157699/pexels-photo-35157699.jpeg',
      'subcategories': ['Beard Care', 'Shaving', 'Skin Care', 'Hair Care']
    },
  ];

  final List<Map<String, dynamic>> allCategories = const [
    {
      'title': 'Clothing',
      'imagePath': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfAYjSqOuFv6GbhXRvoSoyOC7i8pbn1NvcmQMVFwr5kQ&s=10',
      'subcategories': ['Dresses', 'Pants', 'Skirts', 'Shorts', 'Jackets', 'Hoodies', 'Shirts', 'Polo', 'T-Shirts', 'Tunics', 'Jeans', 'Suits']
    },
    {
      'title': 'Shoes',
      'imagePath': 'https://images.pexels.com/photos/7857501/pexels-photo-7857501.jpeg',
      'subcategories': ['Sneakers', 'Running Shoes', 'Formal Shoes', 'Boots', 'Heels', 'Flats', 'Loafers']
    },
    {
      'title': 'Bags',
      'imagePath': 'https://images.pexels.com/photos/36931056/pexels-photo-36931056.jpeg',
      'subcategories': ['Backpacks', 'Handbags', 'Wallets', 'Travel Bags', 'Messengers']
    },
    {
      'title': 'Grooming',
      'imagePath': 'https://images.pexels.com/photos/35157699/pexels-photo-35157699.jpeg',
      'subcategories': ['Beard Care', 'Shaving', 'Skin Care', 'Hair Care']
    },
    {
      'title': 'Accessories',
      'imagePath': 'https://images.pexels.com/photos/37401695/pexels-photo-37401695.jpeg',
      'subcategories': ['Belts', 'Hats', 'Sunglasses', 'Jewelry', 'Ties']
    },
    {
      'title': 'Watches',
      'imagePath': 'https://images.pexels.com/photos/9713527/pexels-photo-9713527.jpeg',
      'subcategories': ['Analog', 'Digital', 'SmartWatch']
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> currentCategories;
    if (selectedIndex == 0) {
      currentCategories = allCategories;
    } else if (selectedIndex == 1) {
      currentCategories = femaleCategories;
    } else {
      currentCategories = maleCategories;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Categories', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTopButton('All', 0),
                  _buildTopButton('Female', 1),
                  _buildTopButton('Male', 2),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: currentCategories.length,
                  itemBuilder: (context, index) {
                    final category = currentCategories[index];
                    return _CategoryExpandableItem(
                      title: category['title'],
                      imagePath: category['imagePath'],
                      subcategories: List<String>.from(category['subcategories']),
                      initiallyExpanded: index == 0, // Expand the first one by default
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

class _CategoryExpandableItem extends StatefulWidget {
  final String title;
  final String imagePath;
  final List<String> subcategories;
  final bool initiallyExpanded;

  const _CategoryExpandableItem({
    required this.title,
    required this.imagePath,
    required this.subcategories,
    this.initiallyExpanded = false,
  });

  @override
  State<_CategoryExpandableItem> createState() =>
      _CategoryExpandableItemState();
}

class _CategoryExpandableItemState extends State<_CategoryExpandableItem> {
  late bool isListExpanded;

  @override
  void initState() {
    super.initState();
    isListExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        children: [
          // Main Header Card
          GestureDetector(
            onTap: () {
              setState(() {
                isListExpanded = !isListExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Left side Image
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: widget.imagePath.startsWith('http')
                          ? Image.network(
                              widget.imagePath,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image, color: Colors.grey),
                            )
                          : Image.asset(
                              widget.imagePath,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image, color: Colors.grey),
                            ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Category Text
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  // Right side Arrow
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      isListExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 28,
                      color: isListExpanded ? Colors.blue : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Expandable Grid
          if (isListExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.8, // Adjust for width/height ratio
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: widget.subcategories.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.red.shade100, // Light pinkish border
                        width: 1,
                      ),
                    ),
                    child: Text(
                      widget.subcategories[index],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
