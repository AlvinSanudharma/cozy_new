import 'package:cozy_new/models/City.dart';
import 'package:cozy_new/theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: whiteGreyColor,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl!,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                city.isPopular
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30))),
                          child: Center(
                            child: Image.asset(
                              'assets/icon_star.png',
                              width: 22,
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name ?? '',
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
