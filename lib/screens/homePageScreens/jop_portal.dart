import 'package:disability/controller/get_and_add_portal_jop.dart';
import 'package:disability/helper_widget/alert_dialog.dart';
import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/custom_design.dart';
import 'package:disability/helper_widget/custom_textformfield.dart';
import 'package:disability/helper_widget/static_variables.dart';
import 'package:disability/model/jop_portal_model.dart';
import 'package:disability/model/user_model.dart';
import 'package:disability/screens/homePageScreens/jopportal_widget/jop_portal_widget.dart';
import 'package:flutter/material.dart';

class JopPortal extends StatefulWidget {
  const JopPortal({Key? key}) : super(key: key);

  @override
  State<JopPortal> createState() => _JopPortalState();
}

class _JopPortalState extends State<JopPortal> {
UserModel userModel =UserModel();

  bool loading =false;
  bool weAreFilter = true;
  JopPortalModel jopPortalModel = JopPortalModel();
  String dropdownFilterValue = 'any';

  List<String> forWhom = [
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
  List<JopPortalModel> jopPortalList = [

  ];
  List<JopPortalModel> jopFilteringPortalList = [];
@override
void initState() {
  UserModel.load().then((value) {
    userModel=value;
    PortalJobController().getPortalJobs().then((jopPortavalue) {
      setState(() {
        jopPortalList=jopPortavalue;
        loading=true;
      });
  });

  });


  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            ' Jop Portal ',
            style: TextStyle(
              color: DisabilityColors.textDarkGrey,
            ),
          ),
          backgroundColor: DisabilityColors.blue,
          centerTitle: true,
          actions: [
            Visibility(
              visible: userModel.accountType=="admin"||userModel.accountType=="medicalCenter",
              child: InkWell(
                onTap: () {
                  bottomSheetAddNewJop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: DisabilityColors.textDarkGrey,
                      ),
                      Text(
                        'Add Jop',
                        style: TextStyle(color: DisabilityColors.textDarkGrey),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bottomSheetFiltering();
          },
          child: Icon(Icons.filter_list),
        ),
        body:loading? weAreFilter
            ? jopPortalList.isNotEmpty
                ? ListView.builder(
                    itemCount: jopPortalList.length,
                    itemBuilder: (_, index) {
                      return JopPortalWidget(jopPortalList[index]);
                    })
                : noResult()
            : jopFilteringPortalList.isNotEmpty
                ? ListView.builder(
                    itemCount: jopFilteringPortalList.length,
                    itemBuilder: (_, index) {
                      return JopPortalWidget(jopFilteringPortalList[index]);
                    })
                : noResult():
        const Center(child: CircularProgressIndicator(),));
  }

  bottomSheetAddNewJop() {
    String dropdownValue = 'any';
    final _formKey = GlobalKey<FormState>();
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //title
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
                              child: Center(
                                  child: Text(
                                "Add New Jop",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              )),
                            ),
                            //drop down list
                            Center(
                              child: DropdownButton<String>(
                                // Step 3.
                                value: dropdownValue,
                                // Step 4.
                                items: forWhom.map<DropdownMenuItem<String>>(
                                    (String value) {
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
                                      jopPortalModel.jopForWhom = newValue!;
                                      dropdownValue = newValue;
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
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                            CustomTextFormField(
                              hintText: "Enter  Name",
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "mandatory field";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                jopPortalModel.jopName = value;
                              },
                            ),
                            //describe
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Text(
                                "Jop Description",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                            CustomTextFormField(
                              maxLines: 5,
                              hintText: "Enter  Description",
                              textInputType: TextInputType.multiline,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "mandatory field";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                jopPortalModel.jopDescription = value;
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
                                      color: DisabilityColors.mainColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                    onPressed: () {
                                      if(_formKey.currentState!.validate()){
                                        Messages().loading(context);
                                        setStateModal(() {
                                          setState(() {
                                            weAreFilter = true;
                                            jopFilteringPortalList = [];
                                          });
                                        });
                                        setState(() {
                                          jopPortalModel.jopPublisherPhone =userModel.phone;
                                          jopPortalModel.jopPublisherEmail = userModel.email;
                                          jopPortalModel.jopPublisherName = userModel.name;
                                          jopPortalModel.jopDateCreated =
                                              StaticVariables()
                                                  .formattedDate(DateTime.now());
                                          jopPortalModel.id = (jopPortalList.length+1).toString();

                                          Navigator.pop(context);
                                          PortalJobController().addPortalJobs(JopPortalModel(
                                            id: jopPortalModel.id,
                                            jopDateCreated:
                                            jopPortalModel.jopDateCreated,
                                            jopDescription:
                                            jopPortalModel.jopDescription,
                                            jopForWhom: jopPortalModel.jopForWhom,
                                            jopName: jopPortalModel.jopName,
                                            jopPublisherPhone:
                                            jopPortalModel.jopPublisherPhone,
                                            jopPublisherEmail:
                                            jopPortalModel.jopPublisherEmail,
                                            jopPublisherName:
                                            jopPortalModel.jopPublisherName,
                                          )).then((value) {

                                            Navigator.pop(context);
                                            jopPortalList.add(JopPortalModel(
                                              id: jopPortalModel.id,
                                              jopDateCreated:
                                              jopPortalModel.jopDateCreated,
                                              jopDescription:
                                              jopPortalModel.jopDescription,
                                              jopForWhom: jopPortalModel.jopForWhom,
                                              jopName: jopPortalModel.jopName,
                                              jopPublisherPhone:
                                              jopPortalModel.jopPublisherPhone,
                                              jopPublisherEmail:
                                              jopPortalModel.jopPublisherEmail,
                                              jopPublisherName:
                                              jopPortalModel.jopPublisherName,
                                            ));
                                          });

                                        });
                                      }
                                    },
                                    child: const Text(
                                      'Add',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
        }).then((value) {
      setState(() {});
    });
  }

  bottomSheetFiltering() {
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
                        children: [
                          //title
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
                            child: Center(
                                child: Text(
                              "Filter by your situation",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )),
                          ),
                          //drop down list
                          Center(
                            child: DropdownButton<String>(
                              // Step 3.
                              value: dropdownFilterValue,
                              // Step 4.
                              items: forWhom.map<DropdownMenuItem<String>>(
                                  (String value) {
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
                                    dropdownFilterValue = newValue!;
                                  });
                                });
                              },
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
                                    color: DisabilityColors.mainColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                  onPressed: () {
                                    setStateModal(() {
                                      setState(() {
                                        weAreFilter = false;
                                        jopFilteringPortalList = [];
                                      });
                                    });

                                    for (var element in jopPortalList) {
                                      if (element.jopForWhom
                                              .toString()
                                              .trim()
                                              .toLowerCase() ==
                                          (dropdownFilterValue
                                              .trim()
                                              .toLowerCase())) {
                                        setStateModal(() {
                                          setState(() {
                                            jopFilteringPortalList.add(element);
                                            // Navigator.pop(context);
                                          });
                                        });
                                      }
                                    }
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Filter ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
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

  Widget noResult() {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/hompage_icons/helmet.png",
              height: 200,
              width: 200,
              color: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
              child: Center(
                  child: Text(
                "There is No result",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
