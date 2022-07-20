import 'package:awsilny_client/services/auth.dart';
import 'package:awsilny_client/services/database.dart';
import 'package:awsilny_client/shared/colors.dart';
import 'package:awsilny_client/shared/constants.dart';
import 'package:awsilny_client/shared/loading.dart';
import 'package:awsilny_client/shared/showSignIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

// import './sign_in.dart';

class RegisterationScreen extends StatefulWidget {
  static const String idScreen = "register";

  const RegisterationScreen({Key? key}) : super(key: key);

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {

  bool loading = false;

  final Database _database = Database();

  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController phoneTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();


  String error = '';

  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: Colors.blueGrey[50]),
          child: Column(
            children: [
              const SizedBox(
                height: 45.0,
              ),
              const Image(
                image: AssetImage("images/logo1.png"),
                width: 160.0,
                height: 160.0,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                " إنشاء حساب",
                style: TextStyle(fontSize: 30.0, fontFamily: "Brand-Regular"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      TextFormField(
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'جميع الحقول مطلوبة';
                          }
                          return null;
                        }),
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.text,
                        decoration:
                            inputDecoration.copyWith(labelText: 'الإسم'),
                        style: const TextStyle(
                            fontSize: 14.0, fontFamily: "Brand-Regular"),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'جميع الحقول مطلوبة';
                          }
                          return null;
                        }),
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: inputDecoration.copyWith(
                            labelText: 'البريد الإلكتروني'),
                        style: const TextStyle(
                            fontSize: 14.0, fontFamily: "Brand-Regular"),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'جميع الحقول مطلوبة';
                          }
                          return null;
                        }),
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.phone,
                        decoration:
                            inputDecoration.copyWith(labelText: 'رقم التلفون'),
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'جميع الحقول مطلوبة';
                          }
                          return null;
                        }),
                        controller: passwordTextEditingController,
                        obscureText: true,
                        decoration:
                            inputDecoration.copyWith(labelText: 'كلمة المرور'),
                        style: const TextStyle(fontSize: 24.0),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        error,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.primaryColor,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(34.0),
                          ),
                        ),
                        child: Container(
                          height: 50.0,
                          child: const Center(
                            child: Text(
                              "إنشاء الحساب",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            // create authentication user (email and password)
                            User newUser =
                                await _auth.signUpWithEmailAndPassword(
                                    emailTextEditingController.text,
                                    passwordTextEditingController.text);

                            if (newUser == null) {
                              print('error signing in!');
                              setState(() {
                                loading = false;
                                passwordTextEditingController.text = '';
                                error = 'خطأ في التسجيل';
                              });
                            } else {
                              // create user collection in the database (all user data)
                              _database.createNewCustomer(
                                newUser.uid,
                                nameTextEditingController.text,
                                emailTextEditingController.text,
                                phoneTextEditingController.text,
                                );
                              print(newUser.uid);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<ShowSignIn>(builder: (context, showSignIn, child) {
                return TextButton(
                  onPressed: () {
                    showSignIn.toggleShowSignIn();
                  },
                  child: const Text(
                    "اذا كنت تملك حساب مسيقا إضغط ل 'تسجيل الدخول'",
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
