import 'package:example/package.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Test());
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  //Create a default instance of enum for our initial Bank type
  BankType bankType = BankType.melat;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // call the package class name to start using the iran bank cart
              IranBanks(
                height: 200,
                width: 300,
                // All this field should be String
                usernameAndFamily: "طاها اهوازی",
                expCartMonth: "06",
                // All this field should be String
                expCartYear: "05",
                // All this field should be String
                shabbaNumber: "23456756736754747846",
                // All this field should be String
                cvv2: "6118",
                //Cart number is int
                cartNumber: 123456789101112,
                // All this field should be String
                shomarehHesab: "12344567845234",
                //Use the default bank type from enums
                banktype: bankType,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.meli;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/melilogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.ayandeh;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/ayandehlogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.sepah;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/sepahlogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.keshavarzi;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/keshavarzilogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.maskan;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/maskanlogo.png"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.sanatvamadan;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/sanatvamadanlogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.saderat;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/saderatlogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.taavon;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/taavonlogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.postbank;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/postbanklogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.refah;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/refahlogo.png"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
