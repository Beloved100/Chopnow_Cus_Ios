// import 'package:chopnow_new_customer_app/payment_service.dart';
// import 'package:chopnow_new_customer_app/views/order/subwidget/completed_payment.dart';
// import 'package:get/get.dart';
// // Adjust the import to your actual redirect page

// class PaymentController extends GetxController {
//   final PaymentService _paymentService = PaymentService();

//   Future<void> makePayment({
//     required int  amount,
//     required String currency,
//     // required String paymentMethod,
//     required String email,
//     // required String txRef,
//   }) async {
//     try {
//       print("worked to this point");
//       final paymentResponse = await _paymentService.initiatePayment(
//         amount: amount,
//         currency: currency,
//         // paymentMethod: paymentMethod,
//         email: email,
//         // txRef: txRef,
//         // redirectUrl: 'https://your-redirect-url.com', // Your redirect URL
//       );

//       if (paymentResponse['status'] == 'success') {
//         // Navigate to the redirect page
//         Get.to(() => CompletedPayment());
//       } else {
//         // Handle payment failure
//         Get.snackbar('Payment Error', 'Payment was not successful.');
//       }
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     }
//   }
// }
