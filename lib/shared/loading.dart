import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.blueGrey[50],
      child: Center(
          child: SpinKitFadingCircle(
        color: Colors.blue[900],
        size: 50.0,
      )),
    );
  }
}
