import 'package:flutter/material.dart';

const kAmountTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

class CartPage extends StatefulWidget {
  static const String id = 'cart_page';

  const CartPage({super.key});
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  int itemCount = 3;
  int NumberOfPlants = 1;
  int NumberOfPlants1 = 1;
  int NumberOfPlants2 = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      appBar: AppBar(
        backgroundColor: const Color(0xffEFEFEF),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            const Text(
              'Cart',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.shopping_cart_outlined)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Text(
                  'Order list: ',
                ),
                Text(
                  '$itemCount items',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 320,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                              color: const Color(0xffEFEFEF),
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('images/item5.png'),
                              )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 22,
                                    width: 140,
                                    child: const Text(
                                      'Bird of Paradise',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        child: FloatingActionButton.small(
                                          elevation: 2,
                                          backgroundColor: Colors.grey.shade300,
                                          onPressed: () {
                                            setState(() {
                                              if (NumberOfPlants > 1) {
                                                NumberOfPlants--;
                                              }
                                            });
                                          },
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide.none),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text('$NumberOfPlants'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        child: FloatingActionButton.small(
                                          elevation: 2,
                                          backgroundColor:
                                              const Color(0xff67802F),
                                          onPressed: () {
                                            setState(() {
                                              NumberOfPlants++;
                                            });
                                          },
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide.none),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  '\$59.99',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '\$120.00',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 22,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffEFEFEF),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          size: 13,
                                          color: Colors.grey.shade700,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          'Remove',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                MaterialButton(
                                  height: 25,
                                  onPressed: () {},
                                  color: const Color(0xff67802F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Text(
                                    'Check Out',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                              color: const Color(0xffEFEFEF),
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('images/item1.png'),
                              )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 22,
                                    width: 140,
                                    child: const Text(
                                      'Monstera ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        child: FloatingActionButton.small(
                                          elevation: 2,
                                          backgroundColor: Colors.grey.shade300,
                                          onPressed: () {
                                            setState(() {
                                              if (NumberOfPlants1 > 1) {
                                                NumberOfPlants1--;
                                              }
                                            });
                                          },
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide.none),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text('$NumberOfPlants1'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        child: FloatingActionButton.small(
                                          elevation: 2,
                                          backgroundColor:
                                              const Color(0xff67802F),
                                          onPressed: () {
                                            setState(() {
                                              NumberOfPlants1++;
                                            });
                                          },
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide.none),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  '\$35.00',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '\$50.00',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 22,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffEFEFEF),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          size: 13,
                                          color: Colors.grey.shade700,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          'Remove',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                MaterialButton(
                                  height: 25,
                                  onPressed: () {},
                                  color: const Color(0xff67802F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Text(
                                    'Check Out',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                              color: const Color(0xffEFEFEF),
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('images/item8.png'),
                              )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 22,
                                    width: 140,
                                    child: const Text(
                                      'Ageratum ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        child: FloatingActionButton.small(
                                          elevation: 2,
                                          backgroundColor: Colors.grey.shade300,
                                          onPressed: () {
                                            setState(() {
                                              if (NumberOfPlants2 > 1) {
                                                NumberOfPlants2--;
                                              }
                                            });
                                          },
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide.none),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text('$NumberOfPlants2'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        child: FloatingActionButton.small(
                                          elevation: 2,
                                          backgroundColor:
                                              const Color(0xff67802F),
                                          onPressed: () {
                                            setState(() {
                                              NumberOfPlants2++;
                                            });
                                          },
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide.none),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  '\$40.00',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '\$80.00',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 22,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffEFEFEF),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          size: 13,
                                          color: Colors.grey.shade700,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          'Remove',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                MaterialButton(
                                  height: 25,
                                  onPressed: () {},
                                  color: const Color(0xff67802F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Text(
                                    'Check Out',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Promo Code',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: const Color(0xff67802F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal:',
                            style: kAmountTextStyle,
                          ),
                          Text(
                            '\$134.99',
                            style: kAmountTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[300],
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee:',
                            style: kAmountTextStyle,
                          ),
                          Text(
                            '\$15.00',
                            style: kAmountTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[300],
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax:',
                            style: kAmountTextStyle,
                          ),
                          Text(
                            '\$5.00',
                            style: kAmountTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[300],
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount:',
                            style: kAmountTextStyle,
                          ),
                          Text(
                            '\$154.99',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              height: 45,
              onPressed: () {},
              color: const Color(0xff67802F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Check Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
