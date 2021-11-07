import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 300));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyText1!
                    .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                      },
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                          labelStyle: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.normal),
                          hintStyle: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.normal)),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length cannot be less than 6 characters";
                        }
                      },
                      obscureText: true,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                          labelStyle: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.normal),
                          hintStyle: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.normal)),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: context.theme.primaryColorLight,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
