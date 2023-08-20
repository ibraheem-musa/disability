import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disability/model/jop_portal_model.dart';

class PortalJobController{

  Future getPortalJobs()async{
List<JopPortalModel> listJopPortalModel =[];
  final data=await  FirebaseFirestore.instance.collection('PortalJob').get();
    data.docs.forEach((element) {
      listJopPortalModel.add(
          JopPortalModel(
            id: element.data()['id'],
            jopName:element.data()["jopName"],
            jopDescription:element.data()["jopDescription"],
            jopDateCreated:element.data()["jopDateCreated"],
            jopPublisherName:element.data()["jopPublisherName"],
            jopPublisherEmail:element.data()["jopPublisherEmail"],
            jopPublisherPhone:element.data()["jopPublisherPhone"],
            jopForWhom:element.data()["jopForWhom"],
          )
      );
    });
    return listJopPortalModel;
  }

  Future addPortalJobs(JopPortalModel jopPortalModel)async{
    Map<String ,dynamic> data ={
      'id':jopPortalModel.id,
      'jopName': jopPortalModel.jopName,
      'jopDescription': jopPortalModel.jopDescription,
      'jopDateCreated': jopPortalModel.jopDateCreated,
      'jopPublisherName': jopPortalModel.jopPublisherName,
      'jopPublisherEmail': jopPortalModel.jopPublisherEmail,
      'jopPublisherPhone': jopPortalModel.jopPublisherPhone,
      'jopForWhom': jopPortalModel.jopForWhom,
    };
    FirebaseFirestore.instance.collection('PortalJob').add(data);
  }
}