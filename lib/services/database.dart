import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // final _database = FirebaseFirestore.instance;

  // users collection reference
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  // order trip
  Future orderTrip(
    startPlace,
    arrivePlace,
  ) async {
    print(startPlace);
    print(arrivePlace);
    orders.doc().set({
      'startPlace': startPlace,
      'arrivePlace': arrivePlace,
      'status': 'pending',
      'price': 3000,
      'time': DateTime.now()
    });
  }

  // create a new driver in the database
  void createNewDriver(id, name, email, phone, carType) async {
    users.doc(id).set({
      'name': name,
      'email': email,
      'phone': phone,
      'carType': carType,
      'role': 'driver'
    }).then((value) {
      // print(value);
      print('driver added');
    }).catchError((err) => print(err.toString()));
  }
}
