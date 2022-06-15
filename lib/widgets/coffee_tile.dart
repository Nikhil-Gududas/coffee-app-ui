import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color buttonColor = const Color.fromARGB(255, 226, 129, 69);

class CoffeeTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final double price;
  final double ratings;

  const CoffeeTile(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.ratings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 40),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            Colors.blueGrey.withOpacity(0.2),
            Colors.grey.shade900.withOpacity(0.8)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(4, 4, 8, 4),
                        // height: 20,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(14)),
                            gradient: LinearGradient(colors: [
                              Colors.grey.shade900.withOpacity(0.6),
                              Colors.grey.shade900
                            ])),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: buttonColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('$ratings'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
            const TextSpan(text: "\n"),
            TextSpan(
                text: subTitle,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                )),
          ])),
          Row(
            children: [
              Text(
                "\$ ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: buttonColor,
                    fontSize: 26),
              ),
              Text(
                "$price",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: buttonColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
