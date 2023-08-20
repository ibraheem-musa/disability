import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/custom_design.dart';
import 'package:disability/helper_widget/custom_textformfield.dart';
import 'package:flutter/material.dart';

class SupportUS extends StatefulWidget {
  const SupportUS({Key? key}) : super(key: key);

  @override
  State<SupportUS> createState() => _SupportUSState();
}

class _SupportUSState extends State<SupportUS> {
 String whatYouCanDo ='';
 String describeIt ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Support us ',style: TextStyle(color:DisabilityColors.textDarkGrey,),),
        backgroundColor: DisabilityColors.blue,
        centerTitle: true,

      ),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: CustomDesign().costumeBoxDecoration(contenarColor: DisabilityColors.grey5,circular: 12,borderColor: DisabilityColors.mainColor),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 50, 15, 50),
              child: Text("it's not about what you can do ,\n it's just about your contribution and We appreciate your efforts . ",
              style:  TextStyle(fontWeight: FontWeight.w600,fontSize: 16 ),textAlign: TextAlign.center,),
            ),
          ),
        ),
        // name
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Text(
            "Name",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        CustomTextFormField(
          hintText: " what you can do ?",
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return  "mandatory field";
            }
            return null;
          },
          onChanged: (value) {
            whatYouCanDo = value;
          },
        ),
        //describe
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Text(
            "Description",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        CustomTextFormField(
          maxLines: 5,
          hintText: "Enter  Description",
          textInputType: TextInputType.multiline,
          validator: (value) {
            if (value!.isEmpty) {
              return  "mandatory field";
            }
            return null;
          },
          onChanged: (value) {
            describeIt = value;
          },
        ),

        // button
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 20),
          child: Center(
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: DisabilityColors.mainColor, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {

                },
                child: const Text(
                  'Add ',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ],),
      
    );
  }
}
