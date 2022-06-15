import 'dart:ui';

import 'package:coffee_app/widgets/ButtonContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color iconColor = Color.fromARGB(255, 94, 92, 95);
const Color buttonColor = Color.fromARGB(255, 226, 129, 69);

List<String> sizes = ['S', 'M', 'L'];

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> productMap;
  int selectedIndex = 0;
  ProductDetailPage({
    Key? key,
    required this.productMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    const subTitleColor = Color(0XFFAEAEAE);
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 6,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: _width,
                        child: Image.asset(
                          productMap['imagePath'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(26),
                          child: Container(
                            height: 150,
                            width: _width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 26, vertical: 16),
                            // color: Colors.blue,
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: productMap["title"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 28,
                                                color: Colors.white
                                                    .withOpacity(0.8))),
                                        const TextSpan(text: "\n"),
                                        TextSpan(
                                            text: productMap["subTitle"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,
                                                color: Colors.white
                                                    .withOpacity(0.7))),
                                      ])),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star_rounded,
                                            color: buttonColor,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            productMap['ratings'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          typeContainer("Coffee",
                                              'assets/images/coffee-seed.png'),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          typeContainer("Coffee",
                                              'assets/images/drop.png')
                                        ],
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          height: 40,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: const Color(0XFF101419)),
                                          child: const Text(
                                            "Medium Roasted",
                                            style: TextStyle(
                                              color: Color(0XFFAEAEAE),
                                            ),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 16,
                        child: ButtonContainer(
                            child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: iconColor,
                          ),
                        )),
                      ),
                      Positioned(
                        top: 20,
                        right: 16,
                        child: ButtonContainer(
                            child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_rounded,
                            color: iconColor,
                          ),
                        )),
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        color: subTitleColor,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ExpandableText(productMap['description']),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Size',
                      style: TextStyle(
                        color: subTitleColor,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 35,
                      child: StatefulBuilder(
                        builder: (context, setState) => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sizes.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: 40, left: index == 0 ? 16 : 0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 34),
                                  decoration: BoxDecoration(
                                      color: selectedIndex == index
                                          ? Colors.transparent
                                          : Colors.grey[800],
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: selectedIndex == index
                                            ? Colors.orange
                                            : Colors.transparent,
                                      )),
                                  child: Center(
                                    child: Text(
                                      sizes[index],
                                      style: TextStyle(
                                          color: selectedIndex == index
                                              ? Colors.orange
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: GoogleFonts.nunito(color: subTitleColor),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "\$ ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: buttonColor,
                                      fontSize: 26),
                                ),
                                Text(
                                  productMap['price'].toString(),
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ],
                            )
                          ],
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: buttonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 15)),
                          onPressed: () {},
                          child: Text(
                            'Buy Now',
                            style: GoogleFonts.nunito(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container typeContainer(String name, String path) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0XFF101419)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(
              path,
              fit: BoxFit.scaleDown,
              color: const Color(0XFFD17842),
            ),
          ),
          Text(
            name,
            style: const TextStyle(color: Color(0XFFAEAEAE)),
          )
        ],
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text, {Key? key}) : super(key: key);

  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AnimatedSize(
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
              constraints: widget.isExpanded
                  ? const BoxConstraints()
                  : const BoxConstraints(maxHeight: 50.0),
              child: Text(
                widget.text,
                softWrap: true,
                overflow: TextOverflow.fade,
              ))),
      widget.isExpanded
          ? ConstrainedBox(constraints: const BoxConstraints())
          : Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  child: const Text(
                    '...Read More',
                    style: TextStyle(color: buttonColor),
                  ),
                  onPressed: () => setState(() => widget.isExpanded = true)),
            ),
    ]);
  }
}
