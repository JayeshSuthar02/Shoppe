import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<String> images;
  final String title;
  final String number;
  final VoidCallback? onTap;

  const CategoryList({
    super.key,
    required this.images,
    required this.title,
    required this.number,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      height: 192,
      width: 155,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: images[0].startsWith('http')
                        ? Image.network(images[0], fit: BoxFit.cover)
                        : Image.asset(images[0], fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 3),
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: images[1].startsWith('http')
                        ? Image.network(images[1], fit: BoxFit.cover)
                        : Image.asset(images[1], fit: BoxFit.cover),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 3),
            Row(
              children: [
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: images[2].startsWith('http')
                        ? Image.network(images[2], fit: BoxFit.cover)
                        : Image.asset(images[2], fit: BoxFit.cover),
                  ),
                ),

                const SizedBox(width: 3),
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: images[3].startsWith('http')
                        ? Image.network(images[3], fit: BoxFit.cover)
                        : Image.asset(images[3], fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Container(
                  height: 20,
                  width: 38,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      number,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
