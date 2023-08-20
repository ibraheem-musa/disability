import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/custom_design.dart';
import 'package:disability/helper_widget/static_variables.dart';
import 'package:disability/model/user_model.dart';
import 'package:disability/screens/authentication/Login.dart';
import 'package:disability/screens/homePageScreens/Donations.dart';
import 'package:disability/screens/homePageScreens/contact_us.dart';
import 'package:disability/screens/homePageScreens/jop_portal.dart';
import 'package:disability/screens/homePageScreens/medical_centers.dart';
import 'package:disability/screens/homePageScreens/support_us.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

double highitAndWidth =0;
  List category=[
    {"text":'Social Hub', "image":"assets/hompage_icons/social-reach.png"},
  {"text":'Donations',     "image":"assets/hompage_icons/donation.png"},
  {"text":'Job Portal',    "image":"assets/hompage_icons/helmet.png"},
  {"text":'Medical Centers',"image":"assets/hompage_icons/hospital.png"},
  {"text":'Support Us',        "image":"assets/hompage_icons/idea.png"},
  {"text":'Contact Us',      "image":"assets/hompage_icons/labour-day.png"},
  ];
  @override
  void initState() {
    super.initState();
    // Add a 5-second delay before navigating to MainScreen
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        highitAndWidth= StaticVariables().width(context)/2.3;
      });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Home ',style: TextStyle(color:DisabilityColors.textDarkGrey,),),
        backgroundColor: DisabilityColors.blue,
        centerTitle: true,
        actions:  [
          InkWell(
            onTap: () async {
               await FirebaseAuth.instance.signOut();
                UserModel.remove().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginDemo(),
                    ),
                  );
                });
            },
            child: Row(children: [
              Icon(Icons.logout,color: DisabilityColors.yellow,),
              Center(child: Text("  Logout  ",style: TextStyle(color:DisabilityColors.yellow,),)),],),
          ),

        ],

      ),
      body: Center(
        child: Container(

          decoration: BoxDecoration(
            // color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  //-----  Social Hub
                    categoryForm(context,category[0]["text"],category[0]["image"]),
                    //-----  Donations
                    InkWell(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => DonationScreen()));

                        },
                        child: categoryForm(context,category[1]["text"],category[1]["image"]))],),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //-----  Job Portal
                    InkWell(
                        onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => JopPortal()));

                        },
                        child: categoryForm(context,category[2]["text"],category[2]["image"])),
                    //-----  Medical Centers
                    InkWell(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => MedicalCenters()));

                        },
                        child: categoryForm(context,category[3]["text"],category[3]["image"]))],),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //-----  Support
                    InkWell(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => SupportUS()));
                        },
                        child: categoryForm(context,category[4]["text"],category[4]["image"])),
                    //-----  Contact Us
                    InkWell(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => ContactUs()));
                          },
                        child: categoryForm(context,category[5]["text"],category[5]["image"]))],),
              ),

            ],),
        ),
      ),
    );
  }
  Widget categoryForm(BuildContext context,String text,String image){
    return  AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      decoration: CustomDesign().costumeBoxDecoration(borderColor: DisabilityColors.borderColor,borderWidth: 2),
      height: highitAndWidth,
      width: StaticVariables().width(context)/2.3,

      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(image,height:StaticVariables().width(context)/6 ),
              ),
              Text(text,style: TextStyle(fontSize: 16,),)
            ],),
        ),
      ),
    );
  }
}
