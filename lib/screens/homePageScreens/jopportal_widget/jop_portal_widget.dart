import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/custom_design.dart';
import 'package:disability/model/jop_portal_model.dart';

import 'package:flutter/material.dart';

class JopPortalWidget extends StatefulWidget {
  JopPortalModel jopPortalModel;
   JopPortalWidget(this.jopPortalModel);

  @override
  State<JopPortalWidget> createState() => _JopPortalWidgetState();
}

class _JopPortalWidgetState extends State<JopPortalWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
      child: Container(
        decoration: CustomDesign().costumeBoxDecoration(
            borderColor: DisabilityColors.borderColor,
            borderWidth: 2,
            contenarColor: DisabilityColors.grey5.withOpacity(0.2)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //id and date
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ID
                    Text(
                      "Jop ID :  # " + widget.jopPortalModel.id,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: DisabilityColors.grey40),
                    ),
                    // date
                    Text(
                      widget.jopPortalModel.jopDateCreated,
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              // jopForWhom
              TextForJopInfo(widget.jopPortalModel.jopForWhom,
                  "For Whom Hero this jop : "),
              // Name
              TextForJopInfo(
                  widget.jopPortalModel.jopName, "Jop Name : "),
              //Description
              TextForJopInfo(widget.jopPortalModel.jopDescription,
                  "Jop Description : "),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                child: Divider(
                    height: 2,
                    thickness: 2,
                    color: DisabilityColors.grey5),
              ),
              //Publisher Info
              SizedBox(
                height: 15,
              ),
              const Text(
                "Jop Publisher Info : ",
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              //Email
              SizedBox(
                height: 5,
              ),
              Text(
                "Email :   ${widget.jopPortalModel.jopPublisherEmail}",
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
              //Name
              SizedBox(
                height: 5,
              ),
              Text(
                "Name :   ${widget.jopPortalModel.jopPublisherName}",
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
              //Phone
              SizedBox(
                height: 5,
              ),
              Text(
                "Phone :   ${widget.jopPortalModel.jopPublisherPhone}",
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget TextForJopInfo(String supTitle, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Wrap(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text(
            supTitle,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

}
