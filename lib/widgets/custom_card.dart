import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/update_product_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.length > 10 
                          ? '${product.title.substring(0, 10)}...' 
                          : product.title,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.favorite, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: 32,
            child: CachedNetworkImage(
              imageUrl: product.image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => SizedBox(
                height: 100,
                width: 100,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => SizedBox(
                height: 100,
                width: 100,
                child: Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}