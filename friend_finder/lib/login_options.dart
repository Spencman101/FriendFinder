import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'main.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({super.key});

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  bool _obscurePassword = true;
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Options'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Log In',
                  style: theme.textTheme.headlineLarge,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10, left: 10, right: 10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email/Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: IconButton(
                        tooltip: _obscurePassword ? 'Show Password' : 'Hide Password',
                        icon: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        }
                      )
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                const MyHomePage(title: 'FriendFinder'),
                          ),
                        );
                      },
                      child: Text('Log In'),
                    ),
                  ),
                  TextButton( 
                  onPressed: () {},
                  child: 
                    Text(
                      'Forgot Password?',
                      style: 
                        TextStyle(
                          decoration: TextDecoration.underline
                        ),
                    )
                  ),
                  const SizedBox(height: 20),
                  Text(
                      'Don\'t have an account yet?',
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}