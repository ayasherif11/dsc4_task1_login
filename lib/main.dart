import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(FormClass());
}

class FormClass extends StatefulWidget {
  @override
  _FormClassState createState() => _FormClassState();
}

class _FormClassState extends State<FormClass> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          key: _scaffoldKey,
            resizeToAvoidBottomInset: false,
            // appBar: AppBar(
            //   title: Text("SignIn", style: TextStyle(color: Colors.white70)),
            //   backgroundColor: Color(0xFF7d7f91),
            // ),
            body: Builder(
              builder: (context) => Stack(

                  // decoration:BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage("assets/images/Back.jpg"),
                  //     scale: .2         ,
                  //     fit: BoxFit.cover
                  //   )
                  // ),
                  children: [
                    ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: Image.asset(
                          "assets/images/Back2.jpg",
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 70),
                      alignment: Alignment.topCenter,
                      child: Text("SignIn",
                          style: TextStyle(
                              fontFamily: "Lobster",
                              fontSize: 60,
                              color: Color(0xFF002536))),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Color(0xFFf6f8ff),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        alignment: Alignment.bottomCenter,
                        height: 600,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(


                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ("Name Required");
                                  } else
                                    return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                      color: Color(0xFF7b8a91), fontSize: 20),
                                  // hintText: "Enter Your Name",
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Color(0xFF7b8a91),
                                  ),
                                  // hintStyle:
                                  //     TextStyle(fontSize: 24, color: Colors.white24),

                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xFF3b4545),
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1)),
                                ),
                              ),
                              SizedBox(height: 25),
                              TextFormField(
                                obscureText: _isObscure,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ("Password Required");
                                  } else
                                    return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      color: Color(0xFF7b8a91), fontSize: 20),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xFF7b8a91),
                                  ),
                                  suffixIcon:IconButton(
                                      icon: Icon(
                                          _isObscure ? Icons.visibility : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });},

                                      color: Color(0xFF7b8a91)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xFF3b4545),
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1)),
                                ),
                                keyboardType: TextInputType.numberWithOptions(),
                                // keyboardType: TextInputType.visiblePassword,
                              ),
                              Container(
                                  height: 90,
                                  width: 200,
                                  padding: EdgeInsets.only(top: 40),
                                  child: Builder(
                                    builder: (context) => RaisedButton(
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Text(
                                                  " Are you sure you want to sing in?"),
                                              title: Text(
                                                "WARNING",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,color: Color(0xFF002536)),
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      if (_formKey.currentState!.validate()) {
                                                        _scaffoldKey
                                                            .currentState
                                                            !.showSnackBar(
                                                                SnackBar(
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          content: Text(
                                                              "Successfully Logined!",
                                                              style: TextStyle(
                                                                  color: Color(0xFF002536),
                                                                  fontSize:
                                                                      16)),
                                                        duration:
                                                              const Duration(
                                                                  seconds: 5),
                                                          backgroundColor:
                                                              Color(0xFFF6EDCF),

                                                          // padding: EdgeInsets.all(6),
                                                          // margin: EdgeInsets.only(left: 7),
                                                        ));
                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                    },
                                                    // padding: EdgeInsets.all(6),
                                                    // margin: EdgeInsets.only(left: 7)

                                                    child: Text("Ok",style: TextStyle(color: Color(0xFF002536)),)),
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Cancel",style: TextStyle(color: Color(0xFF2A6171)),)),
                                              ],
                                            );
                                          }),
                                      color: Color(0xFF002536),
                                      focusColor: Colors.grey,
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                            color: Color(0xFFf6f8ff),
                                            fontSize: 23,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            )));
  }
}
