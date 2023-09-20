import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum BankType {
  meli,
  ayandeh,
  sepah,
  keshavarzi,
  maskan,
  sanatvamadan,
  saderat,
  taavon,
  postbank,
  refah,
  melat,
}

class IranBanks extends StatefulWidget {
  const IranBanks({
    Key? key,
    required this.cartNumber,
    required this.height,
    required this.width,
    required this.banktype,
    required this.usernameAndFamily,
    required this.expCartMonth,
    required this.expCartYear,
    required this.shabbaNumber,
    required this.cvv2,
    required this.shomarehHesab,
    this.heighBackImage = 150,
    this.widthBackImage = 300,
  }) : super(key: key);
  final int cartNumber;
  final String expCartMonth;
  final String expCartYear;
  final String shabbaNumber;
  final String usernameAndFamily;
  final String cvv2;
  final String shomarehHesab;
  final double height, width;
  final double heighBackImage;
  final double widthBackImage;
  final BankType banktype;
  @override
  // ignore: library_private_types_in_public_api
  _IranBanksState createState() => _IranBanksState();
}

class _IranBanksState extends State<IranBanks> {
  late bool _showFrontSide;
  late bool _flipXAxis;
  int count = 0;

  String setIMageAdress() {
    String imagePath = ''; // Initialize imagePath

    // Determine the image path based on the bankType
    switch (widget.banktype) {
      case BankType.meli:
        imagePath = 'assets/melilogo.png';
        return imagePath;
      case BankType.ayandeh:
        imagePath = 'assets/ayandehlogo.png';
        return imagePath;
      case BankType.sepah:
        imagePath = 'assets/sepahlogo.png';
        return imagePath;
      case BankType.keshavarzi:
        imagePath = 'assets/keshavarzilogo.png';
        return imagePath;
      case BankType.maskan:
        imagePath = 'assets/maskanlogo.png';
        return imagePath;
      case BankType.sanatvamadan:
        imagePath = 'assets/sanatvamadanlogo.png';
        return imagePath;
      case BankType.saderat:
        imagePath = 'assets/saderatlogo.png';
        return imagePath;
      case BankType.taavon:
        imagePath = 'assets/taavonlogo.png';
        return imagePath;
      case BankType.postbank:
        imagePath = 'assets/postbanklogo.png';
        return imagePath;
      case BankType.refah:
        imagePath = 'assets/refahlogo.png';
        return imagePath;
      case BankType.melat:
        imagePath = 'assets/melatlogo.png';
        return imagePath;
    }
  }

  Color setColorBank() {
    // Determine the Color based on the bankType
    switch (widget.banktype) {
      case BankType.meli:
        return Colors.blue;
      case BankType.ayandeh:
        return const Color.fromARGB(255, 187, 106, 0);

      case BankType.sepah:
        return const Color.fromARGB(255, 185, 224, 255);

      case BankType.keshavarzi:
        return const Color.fromARGB(255, 243, 240, 33);

      case BankType.maskan:
        return const Color.fromARGB(255, 224, 91, 1);

      case BankType.sanatvamadan:
        return const Color.fromARGB(129, 0, 0, 0);

      case BankType.saderat:
        return const Color.fromARGB(174, 0, 17, 253);

      case BankType.taavon:
        return const Color.fromARGB(255, 88, 173, 241);

      case BankType.postbank:
        return const Color.fromARGB(255, 2, 146, 9);

      case BankType.refah:
        return const Color.fromARGB(255, 107, 33, 243);

      case BankType.melat:
        return Colors.red;
    }
  }

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
    _flipXAxis = true;
  }

  @override
  Widget build(BuildContext context) {
    return buildFlipAnimation();
  }

  void _changeRotationAxis(bool isX) {
    setState(() {
      isX ? _flipXAxis = true : _flipXAxis = false;
    });
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget buildFlipAnimation() {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
          setState(() {
            if (kDebugMode) {
              print("RIGHT ROTATION");
            }
            if (count == 0) {
              _changeRotationAxis(true);
              _switchCard();
              count++;
            }
            if (count != 0) {
              Future.delayed(const Duration(milliseconds: 600))
                  .then((value) => count = 0);
            }
          });
        }
        if (details.delta.dx < 0) {
          setState(() {
            if (kDebugMode) {
              print("LEFT ROTATION");
            }
            if (count == 0) {
              _changeRotationAxis(true);
              _switchCard();
              count++;
            }
            if (count == 0) {
              _changeRotationAxis(true);
              _switchCard();
              count++;
            }
            if (count != 0) {
              Future.delayed(const Duration(milliseconds: 500))
                  .then((value) => count = 0);
            }
          });
        }
      },
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 0) {
          setState(() {
            if (count == 0) {
              _changeRotationAxis(false);
              _switchCard();
              count++;
            }
            if (count == 0) {
              _changeRotationAxis(false);
              _switchCard();
              count++;
            }
            if (count != 0) {
              Future.delayed(const Duration(milliseconds: 500))
                  .then((value) => count = 0);
            }
          });
          if (kDebugMode) {
            print("DOWN ROTATION");
          }
        }
        if (details.delta.dy < 0) {
          setState(() {
            if (count == 0) {
              _changeRotationAxis(false);
              _switchCard();
              count++;
            }
            if (count == 0) {
              _changeRotationAxis(false);
              _switchCard();
              count++;
            }
            if (count != 0) {
              Future.delayed(const Duration(milliseconds: 500))
                  .then((value) => count = 0);
            }
          });
          if (kDebugMode) {
            print("UP ROTATION");
          }
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
        child: _showFrontSide ? _buildFront() : _buildRear(),
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 1, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 2, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: const ValueKey(true),
      backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      cartNumber: widget.cartNumber,
      height: widget.height,
      width: widget.width,
      faceName: "Front",
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(setColorBank(), BlendMode.color),
                child: Image.asset(
                  "assets/back.png",
                  height: widget.heighBackImage,
                  width: widget.heighBackImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/shetab.png",
                      height: 50,
                      width: 50,
                    ),
                    Image.asset(
                      setIMageAdress(),
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "IR${widget.shabbaNumber}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 65,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(204, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.cartNumber.toString(),
                        style: const TextStyle(
                          fontFamily: 'Kalameh',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.expCartYear}/${widget.expCartMonth}",
                              style: const TextStyle(
                                fontFamily: 'Kalameh',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.usernameAndFamily,
                              style: const TextStyle(
                                fontFamily: 'Kalameh',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(204, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "CVV2:${widget.cvv2}",
                              style: const TextStyle(
                                fontFamily: 'Kalameh',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.shomarehHesab,
                              style: const TextStyle(
                                fontFamily: 'Kalameh',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRear() {
    return __buildLayout(
        key: const ValueKey(false),
        width: widget.width,
        height: widget.height,
        cartNumber: widget.cartNumber,
        backgroundColor: setColorBank(),
        faceName: "Rear",
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              width: 280,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "استفاده از این کارت صرفا مخصوص دارنده کارت میباشد",
                    style: TextStyle(
                      fontFamily: 'Kalameh',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "در صورتی که صاحب کارت بانکی نیستید با بانک در میان بگذارید",
                    style: TextStyle(
                      fontFamily: 'Kalameh',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget __buildLayout(
      {required Key key,
      required Widget child,
      required String faceName,
      required double height,
      required double width,
      int? cartNumber,
      required Color backgroundColor}) {
    return Container(
      key: key,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
