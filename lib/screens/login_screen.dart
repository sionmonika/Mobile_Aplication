import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Make sure to import your WelcomeScreen

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create controllers for the text fields
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    bool rememberMe = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email Field
            TextField(
              controller: emailController,
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
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 15),

            // Remember Me Checkbox
            Row(
              children: [
                StatefulBuilder(
                  builder: (context, setState) {
                    return Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    );
                  },
                ),
                const Text('Remember me'),
              ],
            ),
            const SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Here you would typically validate the credentials
                // For this example, we'll just navigate if email is not empty
                if (emailController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(
                        username: emailController.text
                            .split('@')
                            .first, // Use the part before @ as username
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter your email')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            // OR Divider
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('OR'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),

            // Google Login Button
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                side: const BorderSide(color: Colors.grey),
              ),
              icon: Image.asset(
                'assets/google_icon.png',
                width: 24,
                height: 24,
              ),
              label: const Text(
                'Login with Google',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),

            // Register Link
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: 'Don\'t have an account? '),
                    TextSpan(
                      text: 'Register',
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
