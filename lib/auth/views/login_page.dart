import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
    );
    return ScreenTypeLayout(
      breakpoints: const ScreenBreakpoints(
        tablet: 600,
        desktop: 950,
        watch: 300,
      ),
      mobile: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250.w,
                height: 250.w,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5.w)),
              Text("Cape", style: TextStyle(fontSize: 50.sp)),
              Padding(padding: EdgeInsets.only(top: 20.w)),
              const MainButton(text: 'Login with Google'),
            ],
          ),
        ),
      ),
    );
  }
}

class MainButton extends GetView<LoginController> {
  final String text;
  const MainButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.center,
        height: 60.w,
        width: 240.w,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10.w),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 14.w),
              blurRadius: 18.w,
              spreadRadius: -24.w,
              color: Colors.black45,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // print("login tapped");
              controller.login();
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 28.w,
                    height: 28.w,
                    child: SvgPicture.asset(
                      "assets/icons/google_logo_single.svg",
                      height: 28.w,
                      width: 28.w,
                    ),
                  ),
                  Text(
                    text,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
