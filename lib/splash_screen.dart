import 'package:disability/model/user_model.dart';
import 'package:disability/screens/HomePage.dart';
import 'package:disability/screens/authentication/Login.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool startScreenAnimation = true;
  double logoImageSize = 70;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300)).then((value) => setState(() {
      startScreenAnimation = false;
      logoImageSize = 150;
    }));

    UserModel.load().then((user) {
      if(user.name!=''){
        Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomePage()));
        }));
      }else{
        UserModel.remove().then((valueUserRemove) {
        if (valueUserRemove) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => LoginDemo()));
        }
      });

      }
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   double height= MediaQuery.of(context).size.height;
   double width= MediaQuery.of(context).size.width;

   return Container(
     color: Colors.white,
      height: height,
      width: width,
      child:   Hero(
        tag: "logo",
        child: Center(
          child: AnimatedContainer(
              height: logoImageSize,
              duration: Duration(seconds: 1),
              child: Center(child: Container(
                child:Image.asset(
                    "assets/icon1.png",
                ),
              ),),
        ),
      ),

     ),);
  }
}
