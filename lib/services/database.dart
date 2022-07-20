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
    customerID,
    startPlace,
    arrivePlace,
  ) async {
    print(startPlace);
    print(arrivePlace);
    orders.doc().set({
      'customerID': customerID,
      'startPlace': startPlace,
      'arrivePlace': arrivePlace,
      'status': 'pending',
      'price': 3000,
      'time': DateTime.now()
    });
  }

  // create a new driver in the database
  void createNewCustomer(id, name, email, phone) async {
    users.doc(id).set({
      'name': name,
      'email': email,
      'phone': phone,
      'role': 'customer'
    }).then((value) {
      // print(value);
      print('driver added');
    }).catchError((err) => print(err.toString()));
  }
}
