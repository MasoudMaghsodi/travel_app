import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/model/TravelModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              width: double.infinity,
              height: size.height / 1.8,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height / 2.1,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60)),
                      image: DecorationImage(
                        image: AssetImage(travelList[_selectedIndex].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //head icons
                  Positioned(
                    right: 0,
                    top: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(101, 255, 255, 255),
                            ),
                            child: const Icon(CupertinoIcons.lessthan),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(101, 255, 255, 255),
                            ),
                            child: const Icon(CupertinoIcons.heart),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
