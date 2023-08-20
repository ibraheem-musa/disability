import 'dart:io';

import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/custom_design.dart';
import 'package:disability/helper_widget/custom_textformfield.dart';
import 'package:disability/helper_widget/static_variables.dart';
import 'package:disability/model/physical_donation_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhysicalDonation extends StatefulWidget {
  const PhysicalDonation({Key? key}) : super(key: key);

  @override
  State<PhysicalDonation> createState() => _PhysicalDonationState();
}

class _PhysicalDonationState extends State<PhysicalDonation> {

  //--------image------------------
  String ImageExtension ='';
  String  myImageString='';
  XFile? imageFile;
  bool imageChanged=false;

  PhysicalDonationModel physicalDonationModel =PhysicalDonationModel();
  List<PhysicalDonationModel> physicalList=[
    PhysicalDonationModel(id :"0" ,name: "Wheel",image: 'assets/icon1.png',description: "have tow wheel",phoneNumber: "04654611"),
    PhysicalDonationModel(id :"2" ,name: "Wheegfdgf dfggdfl",image: 'assets/icon1.png',description: "have fdgdgdfgdf tow wheel",phoneNumber: '2436541')

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(' Donation ',style: TextStyle(color:DisabilityColors.textDarkGrey,),),
        backgroundColor: DisabilityColors.blue,
        centerTitle: true,
         actions: [InkWell(
           onTap: (){
             bottomSheetAddNewDonation();
           },
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: [
                 Icon(Icons.add,color: DisabilityColors.textDarkGrey,),
                 Text('Add Donation',style: TextStyle(color: DisabilityColors.textDarkGrey ), )
               ],
             ),
           ),
         )  ],
      ),

      body: ListView.builder(
        itemCount:physicalList.length ,
          itemBuilder: (_,index){
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
          child: Container(
            decoration: CustomDesign().costumeBoxDecoration(borderColor: DisabilityColors.borderColor,borderWidth: 2),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                Expanded(flex: 1, child: Container(
                  decoration: CustomDesign().costumeBoxDecoration(borderColor: DisabilityColors.borderColor,borderWidth: 1,),
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(physicalList[index].image),
                  ),)),
                //---------
                Expanded(flex: 2, child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ID
                      Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Donation ID : "+physicalList[index].id ,style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600),),
                    ),
                      //name
                      Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Name :",style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600),),
                    ),
                      Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(physicalList[index].name,style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w400),),
                    ),
                      // Description
                      Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text('Description :',style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600),),
                    ),
                      Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(physicalList[index].description,style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w400),),
                    ),
                      //contact the donor Phone Number
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text("Contact the donor : "+physicalList[index].phoneNumber ,style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600),),
                      ),
                  ],),
                ))

              ],
            ),
          ),
        );
      }),
    );
  }
  bottomSheetAddNewDonation() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24.0),
          ),
        ),
        isScrollControlled: true,

        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, setStateModal) =>
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
                            child: Center(child: Text("Add New Donation" ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
                          ),
                          // image
                          imageChanged ?
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: Center(
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: StaticVariables().width(context)/1.5,
                                decoration: CustomDesign().costumeBoxDecorationWithOutBorder(contenarColor: DisabilityColors.grey5,
                                    borderRadios: 15),
                                child: Center(child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.file(

                                    File(imageFile!.path),
                                    height: 100,
                                    width: StaticVariables().width(context)/1.5,
                                    fit: BoxFit.cover,
                                  ),
                                ),),

                              ),
                            ),
                          ):
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: InkWell(
                              onTap: () async{
                                final ImagePicker picker = ImagePicker();
                                // Pick an image.
                                final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                if (image != null) {
                                  setStateModal(() {
                                    imageChanged=true;
                                    imageFile=image;
                                    physicalDonationModel.image=imageFile!.path;
                                  });
                                }
                              },
                              child: Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 100,
                                  width: StaticVariables().width(context)/1.5,
                                  decoration: CustomDesign().costumeBoxDecorationWithOutBorder(contenarColor: DisabilityColors.grey5,
                                      borderRadios: 15),
                                  child: Center(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add,color: DisabilityColors.textDarkGrey,),
                                      Text('Add Image',style: TextStyle(color: DisabilityColors.textDarkGrey ), )
                                    ],
                                  ),),

                                ),
                              ),
                            ),
                          ),
                          // name
                          const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Text(
                              "Name",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                          CustomTextFormField(
                            hintText: "Enter  Name",
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return  "mandatory field";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              physicalDonationModel.name = value;
                            },
                          ),
                          //phone
                          const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Text(
                              "Phone Number",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                          CustomTextFormField(
                            hintText: "Enter Your Phone Number",
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return  "mandatory field";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              physicalDonationModel.phoneNumber = value;
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 30),
                            child: Text(
                              "if you didn't add phone ,We will take your accounts phone \n( It's just for contact)",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                            ),
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
                              physicalDonationModel.description = value;
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
                                    setState(() {
                                      Navigator.pop(context);
                                      physicalList.add(
                                          PhysicalDonationModel(id:physicalDonationModel.id
                                              ,name:physicalDonationModel.name
                                              ,phoneNumber:physicalDonationModel.phoneNumber ,
                                              description:physicalDonationModel.description ,
                                              image:physicalDonationModel.image ));

                                    });

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
                    ),
                  ));
        }).then((value) {
      setState(() {
        imageChanged=false;
      });
    });
  }

}
