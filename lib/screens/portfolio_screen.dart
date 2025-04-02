import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  // Function to launch URLs (email, LinkedIn, etc.)
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header with Logo and Menu Icon
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.blue,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'AeroVision',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () {
                        // Add menu functionality if needed
                      },
                    ),
                  ],
                ),
              ),

              // Profile Photo
              const SizedBox(height: 20),
              ClipOval(
                child: Image.asset(
                  'assets/profile_photo.jpg', // Replace with your image path
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              // Welcome Text
              const SizedBox(height: 20),
              Text(
                'Welcome to my Portfolio',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),

              // Name and Profession
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hi I’m ',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Soeung Kimchhay', // Replace with your name
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Mobile Developer', // Replace with your profession
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              // Bio Section
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Collaborating with highly skilled individuals, our agency delivers top-quality services.',
                  // Replace with your bio
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ),

              // Buttons Section
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Replace with your email or social media link
                          _launchUrl(
                              'mailto:your.email@example.com?subject=Hire%20Me');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Hire Me!',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // Replace with your LinkedIn profile URL
                          _launchUrl(
                              'https://www.linkedin.com/in/your-linkedin-profile');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Download CV',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.download,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
