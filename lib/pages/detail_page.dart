import 'package:cozy_new/widgets/facility_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cozy_new/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    urlLauncher(url) async {
      if (!await launchUrl(url)) throw 'Could not launch $url';
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset(
            'assets/thumbnail.png',
            width: MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              SizedBox(height: 328),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    // NOTE: Title
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kuretakeso Hott',
                                style: blackTextStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text.rich(TextSpan(
                                  text: '\$52',
                                  style: purpleTextStyle.copyWith(fontSize: 16),
                                  children: [
                                    TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 16))
                                  ]))
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                                color: Color(0xff989BA1),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // NOTE: Main Facilities
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Text(
                          'Main Facilities',
                          style: blackTextStyle.copyWith(fontSize: 16),
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilityItem(
                            imageUrl: 'assets/icon_kitchen.png',
                            name: 'kitchen',
                            total: 2,
                          ),
                          FacilityItem(
                            imageUrl: 'assets/icon_bedroom.png',
                            name: 'bedroom',
                            total: 3,
                          ),
                          FacilityItem(
                              imageUrl: 'assets/icon_cupboard.png',
                              name: 'big lemari',
                              total: 3),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    // NOTE: Photos
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Text(
                          'Photos',
                          style: blackTextStyle.copyWith(fontSize: 16),
                        )),
                    SizedBox(height: 12),
                    Container(
                      height: 88,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(width: edge),
                          Image.asset(
                            'assets/photo1.png',
                            width: 110,
                            height: 88,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Image.asset(
                            'assets/photo2.png',
                            width: 110,
                            height: 88,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Image.asset(
                            'assets/photo3.png',
                            width: 110,
                            height: 88,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Image.asset(
                            'assets/photo4.png',
                            width: 110,
                            height: 88,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Image.asset(
                            'assets/photo5.png',
                            width: 110,
                            height: 88,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: edge,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text(
                        'Location',
                        style: blackTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jln. Kappan Sukses No. 20\nPalembang',
                            style: greyTextStyle.copyWith(fontSize: 14),
                          ),
                          InkWell(
                            onTap: (() {
                              urlLauncher(
                                  Uri.parse('https://www.google.co.id/'));
                            }),
                            child: Image.asset(
                              'assets/btn_map.png',
                              width: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        child: ElevatedButton(
                          onPressed: (() {
                            urlLauncher(Uri.parse('tel:+1-555-010-999'));
                          }),
                          style: ElevatedButton.styleFrom(
                              primary: purpleColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17))),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              )
            ],
          ),
          // NOTE: Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: Image.asset(
                    'assets/btn_back.png',
                    width: 40,
                  ),
                ),
                Image.asset(
                  'assets/btn_wishlist.png',
                  width: 40,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
