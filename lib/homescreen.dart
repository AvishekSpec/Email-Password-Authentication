import 'package:crud_firebase/Functions/auth_functions.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false; // check point for login and signup with username
  String email = '';
  String password = '';
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Email/Pas Auth and CRUD Operations"),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isLogin
                  ?
                  //shows username only when login is false:user is shown in the signup page
                  TextFormField(
                      key: ValueKey('username'),
                      decoration: InputDecoration(hintText: "Enter Username"),
                      //validating username
                      validator: (value) {
                        if (value.toString().length < 6) {
                          return "Username must be at least 6 characters long";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          username = value!;
                        });
                      })
                  : Container(),
              TextFormField(
                  key: ValueKey('email'),
                  decoration: InputDecoration(hintText: "Enter Email"),
                  //validating email
                  validator: (value) {
                    if (!value.toString().contains('@')) {
                      return "Invalid Email";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  }),
              TextFormField(
                  obscureText: true,
                  key: ValueKey('password'),
                  decoration: InputDecoration(hintText: "Enter Password"),
                  //validating password
                  validator: (value) {
                    if (value.toString().length < 6) {
                      return "Password must be at least 6 characters long";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          signup(email, password);
                        }
                      },
                      child: isLogin ? Text("Login") : Text("Sign Up"))),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: isLogin
                      ? Text("Don't have an sccount?   Sign Up")
                      : Text("Already Signed Up?   Log In"))
            ],
          ),
        ),
      ),
    );
  }
}
