// AI DOCUMENTATION
// - I use chatgpt go tools for research any widget for see example how use 
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-01-27

import 'package:flutter/material.dart';
import 'models/product_model.dart';
import 'components/product_card.dart';
import 'screens/product_detail.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MainProductGallery(studentId: '653040463-7'),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MainProductGallery extends StatelessWidget {
  final String studentId;

  const MainProductGallery({super.key, required this.studentId});

  static final List<ProductModel> sampleProducts = [
    ProductModel(
      id: 1,
      name: 'Thai Tea',
      price: 45.00,
      imageUrl: 'https://f000.backblazeb2.com/file/recipekit-bucket/20230310181037-thai-tea-recipe.webp',
      description: 'Authentic Thai tea with rich flavor and creamy milk.',
      rating: 4.5,
    ),
    ProductModel(
      id: 2,
      name: 'Green Curry',
      price: 120.00,
      imageUrl: 'https://hot-thai-kitchen.com/wp-content/uploads/2022/04/Green-curry-chicken-sq-2.jpg',
      description: 'Spicy and creamy green curry with chicken.',
      rating: 4.0,
    ),
    ProductModel(
      id: 3,
      name: 'Pad Thai',
      price: 90.00,
      imageUrl: 'https://inquiringchef.com/wp-content/uploads/2023/02/Authentic-Pad-Thai-1908.jpg',
      description: 'Famous Thai stir-fried noodles with shrimp.',
      rating: 4.8,
    ),
    ProductModel(
      id: 4,
      name: 'Mango Sticky Rice',
      price: 85.00,
      imageUrl: 'https://cdn.jwplayer.com/v2/media/oaULnCZz/thumbnails/VXPSMJcl.jpg',
      description: 'Sweet sticky rice with fresh mango.',
      rating: 4.7,
    ),
    ProductModel(
      id: 5,
      name: 'Tom Yum Soup',
      price: 110.00,
      imageUrl: 'https://hot-thai-kitchen.com/wp-content/uploads/2013/03/tom-yum-goong-blog.jpg',
      description: 'Hot and sour soup with shrimp.',
      rating: 4.3,
    ),
    ProductModel(
      id: 6,
      name: 'Fried Rice',
      price: 70.00,
      imageUrl: 'https://cicili.tv/wp-content/uploads/2024/08/Chicken-Fried-Rice-Small-2.jpg',
      description: 'Classic Thai fried rice with egg and vegetables.',
      rating: 3.9,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Gallery by $studentId'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: sampleProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final product = sampleProducts[index];
            return ProductCard(
              product: product,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetail(product: product),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
