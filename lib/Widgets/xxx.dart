// import 'package:family_services/Widgets/bottomSheet.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:location/location.dart';
// import 'Widgets/chipFilter.dart';
// import 'functions/map.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// late LocationData currentLocation;
// Future<void> main() async {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();// Ensure Flutter binding initialization
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//   runApp(MyApp());
//   // WidgetsFlutterBinding.ensureInitialized();
// }
//
//
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key, });
//
//
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(
//           title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   void initState() {
//     super.initState();
//     initialization();
//   }
//
//   void initialization() async {
//     // This is where you can initialize the resources needed by your app while
//     // the splash screen is displayed.  Remove the following example because
//     // delaying the user experience is a bad design practice!
//     // ignore_for_file: avoid_print
//     await checkLocationPermission();
//     currentLocation = await getLocation();
//     FlutterNativeSplash.remove();
//   }
//   // final Location location = Location();
//   //
//   // Future<void> _showInfoDialog() {
//   //   return showDialog<void>(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: const Text('Demo Application'),
//   //         content: SingleChildScrollView(
//   //           child: ListBody(
//   //             children: <Widget>[
//   //               const Text('Created by Guillaume Bernos'),
//   //               InkWell(
//   //                 child: const Text(
//   //                   'test location',
//   //                   style: TextStyle(
//   //                     decoration: TextDecoration.underline,
//   //                   ),
//   //                 ),
//   //                 onTap: () async => await _checkLocationPermission,
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //         actions: <Widget>[
//   //           TextButton(
//   //             child: const Text('Ok'),
//   //             onPressed: () {
//   //               Navigator.of(context).pop();
//   //             },
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//
//     var markers= [
//       Marker(
//         point: LatLng(currentLocation.latitude as double, currentLocation.longitude as double),
//         width: 50,
//         height: 50,
//         builder: (context) => FlutterLogo(),
//       ),
//       Marker(
//         point: LatLng(currentLocation.latitude!+0.005 as double, currentLocation.longitude as double),
//         width: 50,
//         height: 50,
//         builder: (context) => FlutterLogo(),
//       ),
//     ];
//
//     var mapController = MapController(); // Create a MapController
//     return SafeArea(
//       child: Scaffold(
//         // appBar: AppBar(
//         //   // Here we take the value from the MyHomePage object that was created by
//         //   // the App.build method, and use it to set our appbar title.
//         //   title: Text(widget.title),
//         // ),
//         body: Center(
//           child: Stack(
//             children: [
//               FlutterMap(
//                 options: MapOptions(
//                   center: LatLng(currentLocation.latitude as double,
//                       currentLocation.longitude as double),
//                   zoom: 11,
//                 ),
//                 mapController: mapController,
//                 // Provide the MapController to the map widget
//                 children: [
//                   TileLayer(
//                     urlTemplate:
//                     'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                     userAgentPackageName: 'com.example.app',
//                   ),
//                   /// /////////////////////////////////////////////////////////////////////////
//                   MarkerClusterLayerWidget(
//                     options: MarkerClusterLayerOptions(
//                       maxClusterRadius: 45,
//                       size: const Size(40, 40),
//                       anchor: AnchorPos.align(AnchorAlign.center),
//                       fitBoundsOptions: const FitBoundsOptions(
//                         padding: EdgeInsets.all(50),
//                         maxZoom: 15,
//                       ),
//                       markers: markers,
//                       builder: (context, markers) {
//                         return Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.blue),
//                           child: Center(
//                             child: Text(
//                               markers.length.toString(),
//                               style: const TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   /// //////////////////////////////////////////////////////////////////////////
//                 ],
//               ),
//
//               /// chip active filters//////////////////////////////////////////////////////////////////////////
//
//               Padding(
//                 padding: EdgeInsets.only(top: 15),
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: Wrap(
//                     spacing: 8.0,
//                     runSpacing: 4.0,
//                     alignment: WrapAlignment.center,
//                     direction: Axis.horizontal,
//                     children: List.generate(
//                         filters.keys
//                             .toList()
//                             .length,
//                             (index) {
//                           if (filters.values.toList()[index]==true){
//                             return CustomChip(
//                               textLable: lable(index),
//                             );}else{
//                             return Container(
//                               width: 0,
//                             );
//                           }
//                         }),
//                     // children: [
//                     //   ActionChip(
//                     //     avatar: Icon(Icons.favorite_border),
//                     //     label: const Text(filters),
//                     //     onPressed: () {
//                     //       setState(() {
//                     //         // favorite = !favorite;
//                     //       });
//                     //     },
//                     //   ),
//                     // ],
//                   ),
//                 ),
//               ),
//
//
//               /// //////////////////////////////////////////////////////////////////////////
//               Positioned(
//                 right: 22,
//                 bottom: 85,
//                 child: GestureDetector(
//                   onTap: () async {
//                     currentLocation = await getLocation();
//                     var lat = currentLocation.latitude;
//                     var long = currentLocation.longitude;
//                     mapController.move(LatLng(lat!, long!),
//                         11); // Change the center dynamically
//                   },
//                   child: Container(
//                     width: 45,
//                     height: 45,
//                     decoration: const ShapeDecoration(
//                       color: Colors.white,
//                       shape: OvalBorder(
//                         side: BorderSide(width: 0.50, color: Color(0xFFEDEDED)),
//                       ),
//                       shadows: [
//                         BoxShadow(
//                           color: Color(0x3F000000),
//                           blurRadius: 4,
//                           offset: Offset(0, 4),
//                           spreadRadius: 0,
//                         )
//                       ],
//                     ),
//                     child: Icon(
//                       Icons.my_location,
//                     ),
//                   ),
//                 ),
//               ),
//
//               /// //////////////////////////////////////////////////////////////////
//               Positioned(
//                 right: 22,
//                 bottom: 143,
//                 child: GestureDetector(
//                   onTap: () async {
//                     showModalBottomSheet<void>(
//                       backgroundColor: Colors.transparent,
//                       context: context,
//                       builder: (BuildContext context) {
//                         return bottomSheet();
//                       },
//                     ).then((value) => rebuild());
//                   },
//                   child: Container(
//                     width: 45,
//                     height: 45,
//                     decoration: const ShapeDecoration(
//                       color: Colors.white,
//                       shape: OvalBorder(
//                         side: BorderSide(width: 0.50, color: Color(0xFFEDEDED)),
//                       ),
//                       shadows: [
//                         BoxShadow(
//                           color: Color(0x3F000000),
//                           blurRadius: 4,
//                           offset: Offset(0, 4),
//                           spreadRadius: 0,
//                         )
//                       ],
//                     ),
//                     child: const Icon(
//                       Icons.filter_alt_outlined,
//                     ),
//                   ),
//                 ),
//               ),
//
//               /// ///////////////////////////////////////////////////////////////////////////////
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//
//             });
//           },
//           tooltip: 'Increment',
//           child: Icon(Icons.menu),
//         ), // This trailing comma makes auto-formatting nicer for build methods.
//       ),
//     );
//   }
//
//   lable(int index) {
//     if (filters.values.toList()[index] == true) {
//       return filters.keys.toList()[index];
//     }
//   }
//   rebuild(){
//     setState(() {});
//   }
//
//
//
// }
//
//
//
