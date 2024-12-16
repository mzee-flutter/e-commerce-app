import 'package:e_commerce/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/side_pannel.dart';

class ProductPage extends StatefulWidget {
  static const String id = 'product_page';
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   isSelected == 2 ? buttonBackgroundColor : iconColor;
  // }

  final List<Map<String, dynamic>> productImages = [
    {
      'name': 'BellFlowers',
      'price': 20.0,
      'image': 'images/item1.png',
    },
    {
      'name': 'Orange',
      'price': 15.0,
      'image': 'images/item2.png',
    },
    {
      'name': 'Rosemary',
      'price': 35.0,
      'image': 'images/item3.png',
    },
    {
      'name': 'jasmine',
      'price': 100,
      'image': 'images/item4.png',
    },
    {
      'name': 'Hydrangea',
      'price': 79.90,
      'image': 'images/item5.png',
    },
    {
      'name': 'Daffodils',
      'price': 80.0,
      'image': 'images/item6.png',
    },
    {
      'name': 'Gardenia',
      'price': 35.0,
      'image': 'images/item7.png',
    },
    {
      'name': 'Rose Flower',
      'price': 50.0,
      'image': 'images/item8.png',
    },
    {
      'name': 'African lily',
      'price': 99.90,
      'image': 'images/item9.png',
    },
    {
      'name': 'white Rose',
      'price': 120,
      'image': 'images/item10.png',
    },
    {
      'name': 'Arecaceae',
      'price': 79.99,
      'image': 'images/item11.png',
    }
  ];
  String? fullName;
  int? isSelected;
  Color iconColor = Color(0xff67802F);
  Color buttonBackgroundColor = Colors.white;

  Widget build(BuildContext context) {
    final Object? argument = ModalRoute.of(context)?.settings.arguments;
    fullName = (argument is String) ? argument : 'guest';
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      drawer: SidePannel(),
      appBar: AppBar(
        backgroundColor: Color(0xffEFEFEF),
        title: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.search_rounded,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffB1C589),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Get',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '50% OFF',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '1-20 October',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/loginPic.webp'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoriesButton(
                        title: 'Popular',
                        color: Color(0xff67802F),
                        titleColor: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CategoriesButton(
                        title: 'Indoor',
                        color: Color(0xffE7E7E7),
                        titleColor: Colors.grey.shade600,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CategoriesButton(
                        title: 'Outdoor',
                        color: Color(0xffE7E7E7),
                        titleColor: Colors.grey.shade600,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CategoriesButton(
                        title: 'Office',
                        color: Color(0xffE7E7E7),
                        titleColor: Colors.grey.shade600,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CategoriesButton(
                        title: 'Garden',
                        color: Color(0xffE7E7E7),
                        titleColor: Colors.grey.shade600,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CategoriesButton(
                        title: 'Balcony',
                        color: Color(0xffE7E7E7),
                        titleColor: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleItemContainer(productImages: productImages),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xffFEFEFE),
        backgroundColor: Color(0xffEFEFEF),
        buttonBackgroundColor: Color(0xff67802F),
        height: 60,
        index: 2,
        items: [
          Icon(Icons.home,
              color: isSelected == 0 ? buttonBackgroundColor : iconColor),
          Icon(Icons.favorite_border_outlined,
              color: isSelected == 1 ? buttonBackgroundColor : iconColor),
          Icon(Icons.qr_code_scanner_rounded,
              color: isSelected == 2 ? buttonBackgroundColor : iconColor),
          Icon(Icons.shopping_cart_outlined,
              color: isSelected == 3 ? buttonBackgroundColor : iconColor),
          Icon(Icons.person_2_outlined,
              color: isSelected == 4 ? buttonBackgroundColor : iconColor),
        ],
        onTap: (index) {
          setState(() {
            isSelected = index;
            if (index == 3) {
              Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (BuildContext context) => CartPage()));
            }
            if (index == 4) {
              Navigator.pushNamed(
                context,
                SidePannel.id,
                arguments: fullName,
              );
            }
          });
        },
      ),
    );
  }
}

class SingleItemContainer extends StatefulWidget {
  const SingleItemContainer({
    required this.productImages,
  });
  final List<Map<String, dynamic>> productImages;
  SingleItemContainerState createState() => SingleItemContainerState();
}

class SingleItemContainerState extends State<SingleItemContainer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          physics: ScrollPhysics(),
          //we have two option for the itemCount
          //1--> list.length means make that much item that are present in the list(But it better it keep the itemCount Dynamic)
          //2--> itemCount is fix(e.g: 10) then you must have eleven item in the list
          //otherwise it give runTime error.
          itemCount: widget.productImages.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 180,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: 115,
                    width: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            '${widget.productImages.elementAt(index)['image']}'),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: isChecked
                            ? Icon(
                                Icons.favorite,
                                size: 17,
                                color: Color(0xff67802F),
                              )
                            : Icon(
                                Icons.favorite_outline,
                                size: 17,
                                color: Color(0xff67802F),
                              ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          color: Color(0xffE6F7E4),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${widget.productImages.elementAt(index)['name']}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$${widget.productImages.elementAt(index)['price']}',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Color(0xff67802F),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoriesButton extends StatelessWidget {
  CategoriesButton({
    required this.title,
    required this.color,
    required this.titleColor,
  });
  final String title;
  final Color color;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 1,
      onPressed: () {},
      color: color,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none,),
      child: Text(
        title,
        style: TextStyle(
          color: titleColor,
        ),
      ),
    );
  }
}
