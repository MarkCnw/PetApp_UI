import 'package:flutter/material.dart';
import 'package:pet_app/Model/pets_model.dart';

class PetHomeScreen extends StatefulWidget {
  const PetHomeScreen({super.key});

  @override
  State<PetHomeScreen> createState() => _PetHomeScreenState();
}

class _PetHomeScreenState extends State<PetHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<PetsModel>> categories = [
      cats,
      dogs,
      birds,
      snakes,
      other
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("images/real.png"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Hi Mark",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text.rich(TextSpan(
                  text: "Adopt\n",
                  style: TextStyle(
                    height: 1.1,
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Your pet's here!",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ])),
            ),
            SizedBox(height: 20),
            CategorySelection(),
            selectedIndex < categories.length
                ? Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: SizedBox(
                      height: 570,
                      child: ListView.builder(
                        itemCount: categories[selectedIndex].length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, top: 30),
                                  child: Row(
                                    children: [
                                      Expanded(child: Stack(
                                        children: [
                                          Container(),
                                        ],
                                      ))
                                    ],
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      )),
    );
  }

  SizedBox CategorySelection() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 30, top: 10),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 75,
                      decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Color(0xffFF9166)
                              : Color(0xffFF9166).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: selectedIndex == index
                                  ? Color(0xffFF9166).withOpacity(0.5)
                                  : Colors.transparent,
                              blurRadius: 12,
                              spreadRadius: 2,
                            )
                          ]),
                      child: Center(
                        child: Text(
                          categoryList[index],
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.amber[900],
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
