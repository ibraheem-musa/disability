import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disability/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Regester {
  final _auth = FirebaseAuth.instance;

  Future<int> signUp({required String email,required String password,required String roles,required String phone,required String userName}) async {

    int returnValue=0;
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value)  {

            postDetailsToFirestore(email, roles,userName,phone);
            returnValue=200;
     })
          .catchError((e) {
        returnValue=400;
      });
       return returnValue;
  }

 Future<bool> postDetailsToFirestore(String email, String roles,String username, String phone) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({'email': email, 'roles': roles,'name':username,'phone':phone}).then((value) {
      return true;
    });
      return false;
  }
  void route(String email, String password) {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {UserModel user =UserModel();
      user.email=email;
      user.name=documentSnapshot.get('name');
      user.phone=documentSnapshot.get('phone');
      user.passWord=password;
      user.accountType=documentSnapshot.get('roles');
       user.save();
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Future<int> signIn(String email, String password) async {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route(email,password);
        return 200;
      } on FirebaseAuthException catch (e) {
        return 400;
      }
  }

}