import 'package:coffee_app/model/product_model.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final ProductModel productModel;
  const DetailView({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(productModel.title),
    );
  }
}
