import 'package:flutter/material.dart';
import 'HeaderImage.dart';

class MainBackground extends StatelessWidget {
  final Widget child;
  const MainBackground({
     Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Column(
        children: <Widget>[
         HeadrImage(),
          child,
        ],
      ),
    );
  }


}