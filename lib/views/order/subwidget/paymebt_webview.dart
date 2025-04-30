import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/loading_lottie.dart';
import 'package:chopnow/common/reusable_text_widget.dart';
import 'package:chopnow/controllers/checkout_controller.dart';
import 'package:chopnow/controllers/order_controller.dart';
import 'package:chopnow/enty_point.dart';
import 'package:chopnow/models/order_request.dart';
import 'package:chopnow/views/order/subwidget/completed_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class PaymentWebViewPage extends StatefulWidget {
  const PaymentWebViewPage({
    super.key,
    required this.paymentLink,
    required this.orderData,
    required this.item,
  });

  final String paymentLink;
  final String orderData;
  final OrderRequest item;

  @override
  State<PaymentWebViewPage> createState() => _PaymentWebViewPageState();
}

class _PaymentWebViewPageState extends State<PaymentWebViewPage> {
  late final WebViewController _controller;
  final OrderController orderController = Get.find<OrderController>();
  final CheckoutController checkoutController = Get.put(CheckoutController());

  bool isLoading = true; // Add a loading state

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true; // Start loading animation
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false; // Stop loading animation
            });

            // Check if the URL indicates success or failure
            if (url.contains('success')) {
              orderController.addToOrder(widget.orderData, widget.item);
              checkoutController.noteToRider.text = "";
              checkoutController.noToRestaurant.text = "";
              checkoutController.fullname.text = "";
              checkoutController.phone.text = "";
              

              Get.off(
                () => const CompletedPayment(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 800),
              );
            } else if (url.contains('cancel')) {
              Get.to(
                () => const MainScreen(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 800),
              );
            }
          },
        ),
      )
      ..addJavaScriptChannel(
        "Toaster",
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        },
      )
      ..loadRequest(Uri.parse(widget.paymentLink));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolor.White,
        leading: IconButton(
          icon: Icon(HeroiconsOutline.arrowLeft, color: Tcolor.TEXT_Body),
          onPressed: () {
            Get.back();
          },
        ),
        title: ReuseableText(
          title: "Complete Payment",
          style: TextStyle(
              color: Tcolor.TEXT_Label,
              fontWeight: FontWeight.w500,
              fontSize: 28.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (isLoading) // Show Lottie animation while loading
              Center(
                child: LoadingLottie()
              ),
          ],
        ),
      ),
    );
  }
}
