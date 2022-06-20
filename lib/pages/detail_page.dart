import 'package:cozy_new/widgets/facility_item.dart';
import 'package:cozy_new/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cozy_new/theme.dart';
import 'package:cozy_new/pages/error_page.dart';
import 'package:cozy_new/models/Space.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    urlLauncher(url) async {
      if (await canLaunchUrl(url)) {
        launchUrl(url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Stack(
        children: [
          Image.network(
            widget.space.imageUrl!,
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
                                widget.space.name ?? '',
                                style: blackTextStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text.rich(TextSpan(
                                  text: '\$${widget.space.price ?? 0}',
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
                            children: [1, 2, 3, 4, 5].map((index) {
                              return Container(
                                margin: EdgeInsets.only(left: 2),
                                child: RatingItem(
                                  index: index,
                                  rating: widget.space.rating ?? 0,
                                ),
                              );
                            }).toList(),
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
                            total: widget.space.numberOfKitchens,
                          ),
                          FacilityItem(
                            imageUrl: 'assets/icon_bedroom.png',
                            name: 'bedroom',
                            total: widget.space.numberOfBedrooms,
                          ),
                          FacilityItem(
                              imageUrl: 'assets/icon_cupboard.png',
                              name: 'big lemari',
                              total: widget.space.numberOfCupboards),
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
                        children: widget.space.photos!.map((item) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: edge - 12,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                item,
                                width: 110,
                                height: 88,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
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
                    // NOTE: Location
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.space.address ?? ''}\n${widget.space.city ?? ''}',
                            style: greyTextStyle.copyWith(fontSize: 14),
                          ),
                          InkWell(
                            onTap: (() {
                              urlLauncher(Uri.parse(widget.space.mapUrl ?? ''));
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
                            urlLauncher(
                                Uri.parse('tel:${widget.space.phone ?? ''}'));
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
                InkWell(
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                    });
                  },
                  child: Image.asset(
                    isClicked
                        ? 'assets/btn_wishlist_filled.png'
                        : 'assets/btn_wishlist.png',
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
