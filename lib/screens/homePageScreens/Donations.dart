import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/custom_design.dart';
import 'package:disability/helper_widget/static_variables.dart';
import 'package:disability/screens/homePageScreens/donationWidget/money_donation.dart';
import 'package:disability/screens/homePageScreens/donationWidget/physical_donation.dart';
import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(' Donation ',style: TextStyle(color:DisabilityColors.textDarkGrey,),),
        backgroundColor: DisabilityColors.blue,
        centerTitle: true,),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //-----  Social Hub
            InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MySample()));
                },
                child: categoryForm(context,"Money ","assets/hompage_icons/payment.png")),
            //-----  Donations
            InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => PhysicalDonation()));

                },
                child: categoryForm(context,"physical","assets/hompage_icons/love.png"))],),
      ),
    );
  }
  Widget categoryForm(BuildContext context,String text,String image){
    return  Container(
      decoration: CustomDesign().costumeBoxDecoration(borderColor: DisabilityColors.borderColor,borderWidth: 2),
      height: StaticVariables().width(context)/2.3,
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

