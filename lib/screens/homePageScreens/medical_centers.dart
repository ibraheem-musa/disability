import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/custom_design.dart';
import 'package:disability/helper_widget/custom_textformfield.dart';
import 'package:disability/model/medical_centers_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MedicalCenters extends StatefulWidget {
  const MedicalCenters({Key? key}) : super(key: key);

  @override
  State<MedicalCenters> createState() => _MedicalCentersState();
}

class _MedicalCentersState extends State<MedicalCenters> {
  MedicalCentersModel medicalCentersModel =MedicalCentersModel();
  List<String> specialized = [
    'any',
    'Blindness',
    'Person with low vision',
    'Cerebral Palsy',
    'Hearing impairment',
    'Leprosy cured person',
    'Locomotor disability',
    'Mental illness',
    'Learning Disabilities (Dyslexia)',
    'Impairment',
    'Disabilities',
    'Handicap',
    'Rehabilitation',
    'Person with Disability',
    'Institution for persons – with disabilities.',
  ];
  List<MedicalCentersModel> listOfMedicalCenters=[
    MedicalCentersModel(
    id: '0',
      name: 'Medo des',
      drName: "hodaa",
      rating: 5,
      specialization: "eye and vision",

  )];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Medical Centers ',style: TextStyle(color:DisabilityColors.textDarkGrey,),),
        backgroundColor: DisabilityColors.blue,
        centerTitle: true,
        actions:  [
          InkWell(
            onTap: (){bottomSheetAddNewJop();},
            child: Row(children: [
              Icon(Icons.add,color: DisabilityColors.yellow,),
              Center(child: Text(" Add Medical Center ",style: TextStyle(color:DisabilityColors.yellow,),)),],),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: listOfMedicalCenters.length,
          itemBuilder: (_,index){
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: CustomDesign().costumeBoxDecorationWithOutBorder(contenarColor: DisabilityColors.grey5,borderRadios: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //name
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(listOfMedicalCenters[index].name , style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                      ),
                    ),
                    Row(

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text("("+listOfMedicalCenters[index].rating.toString()+")" , style: TextStyle(fontSize: 12,),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8,left: 8),
                          child: RatingBar(
                            initialRating:listOfMedicalCenters[index].rating,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            ignoreGestures: true,
                            itemSize: 25,
                            itemCount: 5,
                            glow: false,
                            tapOnlyMode: false,
                            ratingWidget: RatingWidget(
                              half: Icon(
                                Icons.star,
                                color: DisabilityColors.mainColor,
                              ),
                              full: Icon(
                                Icons.star,
                                color: DisabilityColors.mainColor,
                              ),
                              empty: Icon(
                                Icons.star,
                                color: DisabilityColors.grey40,
                              ),
                            ),
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),
                      ],
                    )

                ],),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Icon(Icons.accessibility,size: 20,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                      child: Text(listOfMedicalCenters[index].specialization , style: TextStyle(fontSize: 14,),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 1,color: DisabilityColors.grey40,),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text("Dr :  ", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
                      Text(listOfMedicalCenters[index].drName , style: TextStyle(fontSize: 14,),),
                    ],
                  ),
                ),

            ],),),
        );
      }),
    );
  }

  bottomSheetAddNewJop() {
    String dropdownValue = 'any';
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
              builder: (BuildContext context, setStateModal) => Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      //title
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
                        child: Center(child: Text("Add Medical Center" ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
                      ),
                      //drop down list
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text(
                          "specialized",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Center(
                        child: DropdownButton<String>(
                          // Step 3.
                          value: dropdownValue,
                          // Step 4.

                          items:
                          specialized.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 15),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (String? newValue) {
                            setStateModal(() {
                              setState(() {
                                medicalCentersModel.specialization = newValue!;
                                dropdownValue= newValue;
                              });
                            });

                          },
                        ),
                      ),
                      // name
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text(
                          "Jop Name",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                      CustomTextFormField(
                        hintText: "Enter Medical Center Name",
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return  "mandatory field";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          medicalCentersModel.name = value;
                        },
                      ),
                      //describe
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text(
                          "Dr Name",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                      CustomTextFormField(
                        hintText: "Enter Dr Name",
                        textInputType: TextInputType.multiline,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return  "mandatory field";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          medicalCentersModel.drName = value;
                        },
                      ),
                      //
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text(
                          "Rating",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8,left: 8),
                          child: RatingBar(
                            initialRating:medicalCentersModel.rating,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemSize: 40,
                            itemCount: 5,
                            glow: true,
                            ratingWidget: RatingWidget(
                              half: Icon(
                                Icons.star,
                                color: DisabilityColors.mainColor,
                              ),
                              full: Icon(
                                Icons.star,
                                color: DisabilityColors.mainColor,
                              ),
                              empty: Icon(
                                Icons.star,
                                color: DisabilityColors.grey5,
                              ),
                            ),
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            onRatingUpdate: (rating) {
                              setState(() {
                                setStateModal(() {
                                  medicalCentersModel.rating=rating;
                                });
                              });

                            },
                          ),
                        ),
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
                                Navigator.pop(context);
                                medicalCentersModel.id='0';
                                setState(() {
                                  listOfMedicalCenters.add(MedicalCentersModel(
                                    specialization: medicalCentersModel.specialization,
                                    rating: medicalCentersModel.rating,
                                    drName: medicalCentersModel.drName,
                                    name: medicalCentersModel.name,
                                    id: medicalCentersModel.id,
                                  ));

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
                    ],
                  ),
                ),
              ));
        }).then((value) {
      setState(() {});
    });
  }
}
