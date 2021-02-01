import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/provider/space_provider.dart';
import 'package:bwa_cozy/widgets/bottom_navbar.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecomendedSpace();

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              SizedBox(
                height: edge,
              ),
              // NOTE ==> TITLE/HEADER
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Explore Now",
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Mencari kosan yang cozy",
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE ==> POPULAR CITIES
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Popular Cities",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      city: City(
                          id: 1,
                          name: 'Jakarta',
                          imageUrl: 'assets/images/city1.jpg'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      city: City(
                          id: 2,
                          name: 'Bandung',
                          imageUrl: 'assets/images/city2.jpg',
                          isPopular: true),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      city: City(
                          id: 3,
                          name: 'Surabaya',
                          imageUrl: 'assets/images/city3.jpg'),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE ==> REKOMENDED SPACE
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Recomended Space",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: FutureBuilder(
                  future: spaceProvider.getRecomendedSpace(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;

                      int index = 0;

                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(
                              space: item,
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE ==> TIPS & GUIDANCE
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Tips & Guidance",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: Column(
                  children: [
                    TipsCard(
                      tips: Tips(
                          id: 1,
                          title: 'City Guidlines',
                          imageUrl: 'assets/icons/ic_tips1.png',
                          updateAt: '20 Apr'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TipsCard(
                      tips: Tips(
                          id: 2,
                          title: 'Jakarta Fairship',
                          imageUrl: 'assets/icons/ic_tips2.png',
                          updateAt: '11 Desc'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 65 + edge,
              ),
            ],
          )),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - 2 * edge,
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBar(
              imageUrl: 'assets/icons/ic_home.png',
              isActive: true,
            ),
            BottomNavBar(
              imageUrl: 'assets/icons/ic_email.png',
              isActive: false,
            ),
            BottomNavBar(
              imageUrl: 'assets/icons/ic_card.png',
              isActive: false,
            ),
            BottomNavBar(
              imageUrl: 'assets/icons/ic_love.png',
              isActive: false,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
