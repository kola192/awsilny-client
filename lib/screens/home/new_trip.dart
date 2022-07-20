import 'package:awsilny_client/services/auth.dart';
import 'package:awsilny_client/services/database.dart';
import 'package:awsilny_client/shared/colors.dart';
import 'package:awsilny_client/utils/current_location_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class NewTrip extends StatefulWidget {
  const NewTrip({Key? key}) : super(key: key);

  @override
  State<NewTrip> createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {
  late final MapController mapController;
  Database database = Database();

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    var location = [];
    List<Placemark> startPlace;
    List<Placemark> arrivePlace;
    return FutureBuilder<LocationData?>(
      future: currentLocation(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapchat) {
        if (snapchat.hasData) {
          final LocationData currentLocation = snapchat.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.appBarColor,
            ),
            body: Stack(
              children: [
                FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                      onTap: (p, latLong) async {
                        startPlace = await placemarkFromCoordinates(
                            currentLocation.latitude!,
                            currentLocation.longitude!);
                        arrivePlace = await placemarkFromCoordinates(
                            latLong.latitude, latLong.longitude);
                        final snackbar = SnackBar(
                          duration: const Duration(seconds: 6),
                          action: SnackBarAction(
                              label: "تأكبد",
                              onPressed: () {
                                database.orderTrip(user!.uid,startPlace.first.locality,
                                    arrivePlace.first.locality);
                                Navigator.pop(context);
                              }),
                          content: Text(
                              'تم تحديد موقع الوصول ${arrivePlace.first.locality} - ${arrivePlace.first.street} \n إضغط على زر التأكيد'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      center: LatLng(currentLocation.latitude!,
                          currentLocation.longitude!),
                      zoom: 15),
                  layers: [
                    TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']),
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          width: 100.0,
                          height: 100.0,
                          point: LatLng(currentLocation.latitude!,
                              currentLocation.longitude!),
                          builder: ((context) => const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
