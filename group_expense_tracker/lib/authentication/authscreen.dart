import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formkey = GlobalKey<FormState>();
  var _enteredemail = '';
  var _enteredpassword = '';
  var _isLogin = true;
  void _onLogin() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
    }

    try {
      if (_isLogin) {
        await _firebase.signInWithEmailAndPassword(
            email: _enteredemail, password: _enteredpassword);
      } else {
        await _firebase.createUserWithEmailAndPassword(
            email: _enteredemail, password: _enteredpassword);
      }
    } on FirebaseAuthException catch (error) {
     _authFailed(error.message);
    }
  }
  void _authFailed(String? msg)
  {
     ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg ?? 'Authentication Failed')));
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle txtstyle =TextStyle(color: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/background.jpg'),
            fit: BoxFit.fill)
          ),
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Email',style: txtstyle),
                  ),
                  TextFormField(
                    style: txtstyle,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null ||
                          value.trim().length < 5 ||
                          !value.contains('@')) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _enteredemail = newValue ?? '';
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Password',style: txtstyle),
                  ),
                  TextFormField(
                    style: txtstyle,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.trim().length < 8) {
                        return 'Invalid Password';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _enteredpassword = newValue ?? '';
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: FloatingActionButton(
                      onPressed: _onLogin,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(_isLogin ? 'Log In' : 'Sign Up'),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                      
                    },
                    child: Text(
                      _isLogin
                          ? 'Don\'t have an Account? '
                          : 'Already have an Account?',
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
