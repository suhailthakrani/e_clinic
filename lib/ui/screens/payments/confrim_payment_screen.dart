import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_clinic/models/appointment_model.dart';
import 'package:e_clinic/ui/widgets/custom_dialogs.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ConfrimPaymentScreen extends StatefulWidget {
  final AppointmentModel appointmentModel;
  final String paymentUrl;

  const ConfrimPaymentScreen({Key? key, required this.paymentUrl, required this.appointmentModel}) : super(key: key);

  @override
  ConfrimPaymentScreenState createState() => ConfrimPaymentScreenState();
}

class ConfrimPaymentScreenState extends State<ConfrimPaymentScreen> {
  WebViewController _controller = WebViewController();
  bool _isLoading = true;
  bool _paymentSuccessful = false;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(kWhiteColor)
      ..setNavigationDelegate(
        NavigationDelegate(
          // onProgress: (int progress) {
          //   setState(() {
          //     _isLoading = progress < 100;
          //   });
          // },
          // onPageStarted: (String url) {},
          onPageFinished: (String url) {
            Get.offAllNamed(kMainScreenRoute);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_paymentSuccessful) {
      return const Center(child: Text('Payment successful!'));
    }

    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Stripe Payment',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}