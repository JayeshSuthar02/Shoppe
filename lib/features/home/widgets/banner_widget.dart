import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int currentIndex = 0;
  final title = [
    'Hello',
    'Welcome',
    'Happy',
  ];
  final image = [
    'https://images.pexels.com/photos/5872177/pexels-photo-5872177.jpeg',
    'https://images.pexels.com/photos/5625003/pexels-photo-5625003.jpeg',
    'https://images.pexels.com/photos/5872184/pexels-photo-5872184.jpeg',
  ];
  final subtitle = [
    '80% off',
    '50% off',
    '70% off',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: title.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: image[index].startsWith('http')
                          ? Image.network(image[index], fit: BoxFit.cover)
                          : Image.asset(image[index], fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    left: 18,
                    top: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 0),
                        Text(
                          subtitle[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Happening \nNow',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
            height: 150,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.85,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(title.length, (index) {
            return Container(
              margin: const EdgeInsets.all(4),
              height: currentIndex == index ? 12 : 8,
              width: currentIndex == index ? 12 : 8,
              decoration: BoxDecoration(
                color: currentIndex == index ? Colors.blue : Colors.grey,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}
