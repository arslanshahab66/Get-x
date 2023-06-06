import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_webservice/places.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String? _mapStyle;
  GoogleMapController? mycontroller;
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  TextEditingController destinationcontroller = TextEditingController();
  bool showSourceField = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  mycontroller = controller;
                  mycontroller!.setMapStyle(_mapStyle);
                },
              ),
            ),
            buildProfileTile(),
            buildTextField(),
            buildCurrentLocationIcon(),
            buildNotificationIcon(),
            buildBottomSheet(),
          ],
        ),
      ),
    );
  }

  Widget buildProfileTile() {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          width: Get.width,
          // height: Get.width * 0.5,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: 'Good Morning, ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                    TextSpan(
                        text: 'Arslan ',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ])),
                  const Text(
                    'Where are you going?',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Future<String> showGoogleAutoComplete() async {
    const kGoogleApiKey = "AIzaSyCHhO9tVm_pxioZQyYM4_CoNQlnpPHlrnY";
    Prediction? p = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      strictbounds: false,
      region: "us",
      language: "en",
      context: context,
      mode: Mode.overlay,
      apiKey: kGoogleApiKey,
      components: [Component(Component.country, "us")],
      types: ["(cities)"],
      hint: "Search City",
    );

    return p!.description!;
  }

  Widget buildTextField() {
    return Positioned(
      top: 130,
      left: 20,
      right: 20,
      child: Container(
        padding: EdgeInsets.only(left: 15),
        width: Get.width,
        // height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4,
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          controller: destinationcontroller,
          readOnly: true,
          onTap: () async {
            String selectedplace = await showGoogleAutoComplete();
            destinationcontroller.text = selectedplace;
            setState(() {
              showSourceField = true;
            });
          },
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xffA7A7A7)),
          decoration: InputDecoration(
            hintText: 'Search for your destination',
            hintStyle: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget buildCurrentLocationIcon() {
    return const Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30, right: 8),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.my_location,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildNotificationIcon() {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 40, left: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.notifications,
            color: Color(0xffC3CDD6),
          ),
        ),
      ),
    );
  }

  Widget buildBottomSheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Get.width * 0.75,
        height: 25,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4,
                  blurRadius: 10)
            ],
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        child: Center(
          child: Container(
            width: Get.width * 0.6,
            height: 3,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
