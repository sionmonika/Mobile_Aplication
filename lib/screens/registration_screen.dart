import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register new account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            // Password Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            // Confirm Password Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Password Confirmation',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 15),

            // Terms Checkbox
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'By creating an account, you agree to our '),
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Register Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            // Login Link
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: 'Already have an account? '),
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
