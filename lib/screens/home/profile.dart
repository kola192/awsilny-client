import 'package:awsilny_client/shared/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _showSheet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "عبدالرحيم طه",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const Text(
            //   "driver@gmail.com",
            //   style: TextStyle(
            //     fontSize: 20.0,
            //     color: Colors.blueGrey,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const SizedBox(
              height: 20.0,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            InfoCard(
                text: ' 0924485754',
                icon: Icons.phone,
                onPressed: () {
                  print("this is your phone");
                }),
            InfoCard(
                text: ' abdo123@gmail.com',
                icon: Icons.email,
                onPressed: () {
                  print("this is your Emaile");
                }),
            InfoCard(
                text: " black 2448  frary",
                icon: Icons.car_rental,
                onPressed: () async {
                  print("this is carinfo");
                }),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Card(
                color: Colors.grey[800],
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 115.0),
                child: const ListTile(
                  leading: Icon(
                    Icons.follow_the_signs,
                    color: Colors.white,
                  ),
                  title: Text(
                    "رجوع",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: _showBottomSheet(),
      floatingActionButton: _showSheet ? null : FloatingActionButton(
        backgroundColor: Colors.grey[700],
        onPressed: () {
          setState(() {
            _showSheet = true;
          });
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget? _showBottomSheet() {
    if (_showSheet) {
      return BottomSheet(
        enableDrag: false,
        onClosing: () {},
        builder: (context) {
          final formKey = GlobalKey<FormState>();
          TextEditingController nameController = TextEditingController();
          TextEditingController emailController = TextEditingController();
          TextEditingController phoneController = TextEditingController();
          TextEditingController passwordController = TextEditingController();
          return Container(
            // height: 500,
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      child: Text("x"),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.pink,
                      ),
                      onPressed: () {
                        _showSheet = false;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                const Icon(Icons.person,size: 100,),
                const SizedBox(height: 20,),
                const Text('تعديل الملف الشخصي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
                const SizedBox(height: 5,),
                Form(
                  key: formKey,
                  child: 
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,),
                      child: TextFormField(controller: nameController,
                        decoration: inputDecoration.copyWith(labelText: 'الإسم'),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'جميع الحقول مطلوبة';
                          }
                          return null;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,),
                      child: TextFormField(controller: emailController,
                        decoration: inputDecoration.copyWith(labelText: 'البريد الإلكتروني'),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'جميع الحقول مطلوبة';
                          }
                          return null;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,),
                      child: TextFormField(controller: phoneController,
                        decoration: inputDecoration.copyWith(labelText: 'رقم النلفون'),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'جميع الحقول مطلوبة';
                          }
                          return null;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 5),
                      child: TextFormField(controller: passwordController,
                      decoration: inputDecoration.copyWith(labelText: 'نوع المركبة'),
                      validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'جميع الحقول مطلوبة';
                          }
                          return null;
                        }),
                      ),
                    ),
                  ],)
                ),
                
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34.0),
                    ),
                  ),
                  // color: Colors.yellowAccent,
                  // textColor: Colors.black,
                  child: Container(
                    height: 50.0,
                    child: const Center(
                      child: Text(
                        "تعديل",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: "Brand Bold"),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _showSheet = false;
                      setState(() {
                        
                      });         
                    }
                    
                  },
                ),
              ],
            ),
          );
        },
      );
    } else {
      return null;
    }
  }
}

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function() onPressed;

  InfoCard({
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.yellow,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black87,
          ),
          title: Text(
            text,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}



