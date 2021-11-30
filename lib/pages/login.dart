// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_phone_shop/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool loginpressed = false;

  movetohome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loginpressed = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
      setState(() {
        loginpressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            "Welcome".text.headline3(context).make().box.py16.make().expand(),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    style: context.textTheme.headline5,
                    validator: (value) =>
                        value!.isEmpty ? "Email cannot be empty" : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    cursorWidth: 6,
                    cursorRadius: Radius.circular(6),
                    decoration: InputDecoration(labelText: "Email"),
                  ).p16().card.elevation(0).make().cornerRadius(28).p8(),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is empty";
                      } else if (value.length < 8) {
                        return "Password is short";
                      } else {
                        return null;
                      }
                    },
                    cursorWidth: 6,
                    cursorRadius: Radius.circular(6),
                    style: context.textTheme.headline5,
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password"),
                  ).p16().card.elevation(0).make().cornerRadius(28).p8(),
                ],
              ).expand(flex: 5),
            ),
            IconButton(
                    onPressed: () => movetohome(context),
                    icon: Icon(
                            loginpressed
                                ? Icons.done_all_rounded
                                : Icons.login_rounded,
                            size: 36)
                        .shimmer(
                            duration: Duration(seconds: 3),
                            primaryColor: context.theme.primaryColor,
                            secondaryColor: context.theme.primaryColorDark))
                .glassMorphic(
                    border: loginpressed
                        ? Border.all(
                            width: 2, color: context.theme.secondaryHeaderColor)
                        : Border.all(
                            width: 0,
                            color: context.theme.secondaryHeaderColor),
                    width: loginpressed ? 256 : 128,
                    height: 72,
                    blur: 30,
                    circularRadius: 120)
                .p16()
          ],
        ),
      ),
    );
  }
}
