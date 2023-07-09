import 'package:coffee_app/data/product_data.dart';
import 'package:coffee_app/utility/colors.dart';
import 'package:coffee_app/view/detail/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../data/cat_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Java Coffee",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Zelazna 21/55",
                        style: TextStyle(fontSize: 11, color: ktextgreyClr),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: ktextgreyClr)),
                    child: const Icon(Icons.notifications_none_outlined),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://img.freepik.com/premium-vector/coffee-shop-facebook-cover-template-design_361928-25.jpg",
                          height: 170,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search favourite coffee",
                          prefixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                            itemCount: catData.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: catData[index].active
                                                ? kblackClr
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: ktextgreyClr)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Image.network(
                                                catData[index].image,
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                catData[index].title,
                                                style: TextStyle(
                                                    color: catData[index].active
                                                        ? kwhiteClr
                                                        : ktextgreyClr),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Text(
                            "Popular",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AlignedGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        shrinkWrap: true,
                        itemCount: productData.length,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailView(
                                        productModel: productData[index]),
                                  ));
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(color: ktextgreyClr),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    decoration: const BoxDecoration(
                                        color: klightgreyClr,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: Image.network(
                                      productData[index].image,
                                      height: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            productData[index].title,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "-${productData[index].percent}%",
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            "\$${productData[index].price}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
