import 'package:flutter/material.dart';
import 'package:prueba_tecnica/constants.dart';

class CardCategories extends StatelessWidget {
  final String image;
  final String title;
  final Function() onTap;
  final double? widthImage;
  const CardCategories({
    Key? key,
    required this.image,
    required this.title,
    this.widthImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 149,
        height: 157,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 17.99),
                child: Image.asset(image, width: widthImage ?? 58, height: 58),
              ),
              Text(title, style: kSubtitle),
            ],
          ),
        ),
      ),
    );
  }
}
