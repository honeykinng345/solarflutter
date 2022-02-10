import 'package:basic/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body(),

    );
  }
}

class body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return
      Center(child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bglogin.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Center(
                    child: Text(
                      "Login",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 35.0,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ))),

            Expanded(child:
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    alignment: Alignment.center,
                    width: size.width * 0.700,
                    height: size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/editbg.png"),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                         Padding(padding:EdgeInsets.only(
                        top: 200.0),
                           child:  Text("Please Fill all the fields"),
                         ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: 50.0, bottom: 5.0, left: 20, right: 20),
                            child: TextFelid('Enter your Email', 'Email')),
                        Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, bottom: 5.0, left: 20, right: 20),
                            child: TextFelid(
                                'Enter your Password', 'Password')),
                        LoginButton()

                      ],
                    )

                )
            )

            )

          ],
        )
        ,

      ),
      );
  }

  TextField TextFelid(String hint, String label) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(

          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(fontSize: 20.0, color: Constant.kPrimaryColor),
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.black54),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constant.kPrimaryColor, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constant.kPrimaryColor, width: 2.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0))),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

        margin: EdgeInsets.only(top: 10.0),
        width: 160.0,
        height: 50.0,
        child: ElevatedButton(
          onPressed: () => Navigator(),
          child: Text(
            "Login",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700),
          ),
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.black,
              onSurface: Colors.pink,
              primary: Constant.kPrimaryColor,
              elevation: 10.0,
              padding: EdgeInsets.all(10.0)),
        ));
  }
}
