import 'package:flutter_screenutil/flutter_screenutil.dart';

String googleApiKey = 'AIzaSyCmPEJz8RGp0qdZnnV0A0Owq9NKh0hBFOo';

double height = 1640.h;
double width = 720.w;

// const String appBaseUrl = "http://localhost:4000" ;
//  const String appBaseUrl = "https://chopnowbackendrefixnew-production.up.railway.app" ;

 const String appBaseUrl = "https://chopnow-backend-refix-newest-6ej3.vercel.app" ;

// 
const String payoutUrl = "http://51.21.10.28:3000";


// "https://chopnowbackend-production.up.railway.app"

const double minLat = 8.40; // Southern boundary
const double maxLat = 8.60; // Northern boundary
const double minLng = 4.45; // Western boundary
const double maxLng = 4.70; // Eastern boundary


List<String> orderList = [
  "Pending",
  "Paid",
  "Preparing",
  "Delivering",
  "Delivered",
  "Cancelled",
];



List<String> cartOrderList = [
  "Cart",
  "Active Orders",
  "Order History"
];