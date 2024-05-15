import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
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
  double imageSize = 55;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
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
                    // image list
                    Positioned(
                      right: 0,
                      top: 100,
                      child: SizedBox(
                        width: 90,
                        height: double.maxFinite,
                        child: ListView.builder(
                          itemCount: travelList.length,
                          itemBuilder: (context, index) {
                            return imageItem(index);
                          },
                        ),
                      ),
                    ),
                    // name and place
                    Positioned(
                      bottom: 80,
                      left: size.width / 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            travelList[_selectedIndex].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.placemark_fill,
                                color: Colors.white,
                              ),
                              Text(
                                travelList[_selectedIndex].location,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // card
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color.fromARGB(60, 0, 0, 0),
                              width: 1,
                            ),
                          ),
                          // distance card
                          child: Container(
                            width: 85,
                            height: 85,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text("Distance"),
                                Text(
                                  "${travelList[_selectedIndex].distance} Km ",
                                ),
                              ],
                            ),
                          ),
                        ),
                        // temo card
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color.fromARGB(60, 0, 0, 0),
                              width: 1,
                            ),
                          ),
                          child: Container(
                            width: 85,
                            height: 85,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text("Temp"),
                                Text(
                                  "${travelList[_selectedIndex].temp}\u00B0 C ",
                                ),
                              ],
                            ),
                          ),
                        ),
                        // rating card
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color.fromARGB(60, 0, 0, 0),
                              width: 1,
                            ),
                          ),
                          child: Container(
                            width: 85,
                            height: 85,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text("Rating"),
                                Text(
                                  "${travelList[_selectedIndex].rating} ",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // discreption
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Discreption'),
                          ExpandableText(
                            travelList[_selectedIndex].discription,
                            expandText: 'read more',
                            collapseText: 'show less',
                            textDirection: TextDirection.ltr,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Total Price'),
                                  Text(
                                    '${travelList[_selectedIndex].price}\$',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: const Icon(
                                  CupertinoIcons.arrow_right,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageItem(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedIndex == index
                      ? Colors.lightBlue.shade600
                      : Colors.white,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(travelList[index].image),
                  fit: BoxFit.fill,
                ),
              ),
              width: _selectedIndex == index ? imageSize + 15 : imageSize,
              height: _selectedIndex == index ? imageSize + 15 : imageSize,
              duration: const Duration(microseconds: 500),
            ),
          ),
        ),
      ],
    );
  }
}
