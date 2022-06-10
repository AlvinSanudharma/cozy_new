import 'package:cozy_new/models/City.dart';
import 'package:cozy_new/models/Space.dart';
import 'package:cozy_new/theme.dart';
import 'package:cozy_new/widgets/city_card.dart';
import 'package:cozy_new/widgets/space_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: edge),
        child: ListView(
          children: [
            // NOTE: Header
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: Popular
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
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
                  SizedBox(width: 24),
                  CityCard(City(
                      id: 1, name: 'Jakarta', imageUrl: 'assets/city1.png')),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/city2.png',
                      isPopular: true)),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                    id: 3,
                    name: 'Surabaya',
                    imageUrl: 'assets/city3.png',
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                    id: 4,
                    name: 'Palembang',
                    imageUrl: 'assets/city4.png',
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/city5.png',
                      isPopular: true)),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                    id: 6,
                    name: 'Bogor',
                    imageUrl: 'assets/city6.png',
                  )),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: Recommended Space
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
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
                  SpaceCard(Space(
                      id: 1,
                      name: 'Kuretakeso Hott',
                      imageUrl: 'assets/space1.png',
                      price: 52,
                      city: 'Bandung',
                      country: 'Germany',
                      rating: 4)),
                  SizedBox(
                    height: 30,
                  ),
                  SpaceCard(Space(
                      id: 2,
                      name: 'Roemah Nenek',
                      imageUrl: 'assets/space2.png',
                      price: 11,
                      city: 'Seattle',
                      country: 'Bogor',
                      rating: 5)),
                  SizedBox(
                    height: 30,
                  ),
                  SpaceCard(Space(
                      id: 3,
                      name: 'Darrling How',
                      imageUrl: 'assets/space3.png',
                      price: 20,
                      city: 'Jakarta',
                      country: 'Indonesia',
                      rating: 3)),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
