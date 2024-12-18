import 'package:flutter/material.dart';

class PlantDetailPage extends StatefulWidget {
  static const String id = 'plantdetail_page';
  PlantDetailPageState createState() => PlantDetailPageState();
}

class PlantDetailPageState extends State<PlantDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
        backgroundColor: Color(0xffEFEFEF),
        title: Row(
          children: [
            Icon(
              Icons.arrow_back,
              weight: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
            ),
            Text(
              'Plant details',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/item3.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Container(
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage('images/item10.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0xff67802F),
                              width: 2,
                            ),
                            image: DecorationImage(
                              image: AssetImage('images/item3.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              alignment: Alignment.topLeft,
                              image: AssetImage('images/item6.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          child: FloatingActionButton(
                            heroTag: null,
                            onPressed: () {},
                            backgroundColor: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none),
                            child: const Icon(
                              Icons.remove,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          child: FloatingActionButton(
                            heroTag: null,
                            onPressed: () {},
                            backgroundColor: Color(0xff67802F),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none),
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Rosemery Plant',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 7,
                          spreadRadius: 3,
                          offset: Offset(0, 5),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('images/sun1.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Sunlight',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '20-30%',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('images/humidity1.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Humidity',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '20-30%',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Description',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 120,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Text(
                        'Rosemary (Rosmarinus officinalis) is a fragrant, woody, perennial herb native to the Mediterranean region. It features needle-like, evergreen leaves that are green on top and white underneath, with a dense covering of short, woolly hairs. The plant produces small, blue to purple flowers, which may also appear in white, pink, or deep blue, typically blooming in spring and summer.As a woody shrub, rosemary can grow up to 1.5 meters in height, with some varieties spreading horizontally.Preferring well-drained, sandy, or loamy soil, rosemary thrives in full sun, needing at least 6-8 hours of direct sunlight daily. It is drought-tolerant once established, though regular watering supports its growth in hot, dry conditions. Ideal for warm climates, rosemary can also tolerate some cold, being hardy in USDA zones 8-10.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffEFEFEF).withOpacity(0.5),
                              Color(0xffEFEFEF).withOpacity(0.9),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$40.00',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: 45,
                    onPressed: () {},
                    color: Color(0xff67802F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 21,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
