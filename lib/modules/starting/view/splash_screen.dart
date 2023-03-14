import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/attendance_logs.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/date_picker.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/sign_in.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/images.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  bool isLoad = false;

  final box = GetStorage();
  Future chooseScreen() async {
    var _idStore = AppString.idStore;

    var userId = box.read(_idStore);
    print(userId);
    if (userId == null) {
      //Get.toNamed(onboard);
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => datePickarScreen(),
          )); //signInscreen
    } else {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => datePickarScreen(),
          )); //signInscreen
    }
  }

  isMove() {
    setState(() {
      isLoad = !isLoad;
    });
  }

  var _width1 = 150.0;
  var _height1 = 70.0;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      isMove();
    });

    Future.delayed(Duration(seconds: 3), () {
      chooseScreen();
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _width1 = AppLayout.getWidth(28.0);
        _height1 = AppLayout.getHeight(45.0);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Container(
          width: _width,
          height: _height,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 2),
                alignment: isLoad ? Alignment.topCenter : Alignment.center,
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: _width1,
                  height: _height1,
                  child: Image.asset(Images.logo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
