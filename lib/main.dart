import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo.jpg', height: 40),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First Page Section: Unlock Your Potential
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Unlock Your Potential with Worktency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Discover industry-leading courses designed to equip you with real-world skills. Join our community and start your journey to success today.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Image.asset(
                    'assets/images/illustration_desk.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 32),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.book, color: Colors.blue),
                    label: const Text(
                      'Explore Courses',
                      style: TextStyle(color: Colors.blue),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person_add, color: Colors.white),
                    label: const Text(
                      'Join as an educator',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Second Page Section: Why Choose Worktency & Featured Course
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Why Choose Worktency?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFeatureCard(
                        title: 'Expert Instructors',
                        icon: Icons.person,
                      ),
                      _buildFeatureCard(
                        title: 'Flexible Learning',
                        icon: Icons.schedule,
                      ),
                      _buildFeatureCard(
                        title: 'Hands-On Learning',
                        icon: Icons.handshake,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Featured Course',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: List.generate(6, (index) {
                      return _buildCourseCard(
                        title: 'Microsoft word',
                        instructor: 'Mr. Bunthorn Liv\nProfessor @IIC',
                        price: '\$39.99',
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Third Page Section: Meet Our Teachers
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Meet Our Teachers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTeacherCard(
                        name: 'Dr. VALY Dona',
                        title: 'Researcher, AI Specialist',
                        imageUrl: 'assets/images/instructor1.jpg',
                      ),
                      _buildTeacherCard(
                        name: 'HOK Tin',
                        title: 'Web Developer',
                        imageUrl: 'assets/images/instructor2.jpg',
                      ),
                      _buildTeacherCard(
                        name: 'HENG Thipsey',
                        title: 'Lecturer at ITC',
                        imageUrl: 'assets/images/instructor3.jpg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'To reach our only One goal, what we can share with you today',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/classroom_scene.jpg',
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  '"Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate"',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Dr. Valy Dona | Professor @IIC, Cofounder @Worktency',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        minimumSize: const Size(100, 36),
                                      ),
                                      child: const Text(
                                        'Machine learning',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        minimumSize: const Size(100, 36),
                                      ),
                                      child: const Text(
                                        'Artificial Intelligent',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Fourth Page Section: About Us
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/classroom_scene.jpg',
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'engines driving the technological revolution of our time, transforming the way we work, live, and innovate',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Dr. Valy Dona | Professor @IIC, Cofounder @Worktency',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  minimumSize: const Size(100, 36),
                                ),
                                child: const Text(
                                  'Machine learning',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  minimumSize: const Size(100, 36),
                                ),
                                child: const Text(
                                  'Artificial Intelligent',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See more',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMenuItem('Contact Us'),
                      _buildMenuItem('FAQs'),
                      _buildMenuItem('Community Forum'),
                      _buildMenuItem('Term of Service'),
                      _buildMenuItem('Careers'),
                      _buildMenuItem('Leadership'),
                      _buildMenuItem('Blog'),
                      _buildMenuItem('Social Impact'),
                      _buildMenuItem('Cookies Setting'),
                      _buildMenuItem('Terms'),
                      _buildMenuItem('Accessibility Statement'),
                      _buildMenuItem('Investors'),
                      _buildMenuItem('GO Pro Course'),
                      _buildMenuItem('Affiliate'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Certified',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Image.asset(
                    'assets/images/certification_seal.jpg',
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      '2023 © Worktency, Inc. All rights reserved.',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My courses'),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_filled),
            label: 'Online course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({required String title, required IconData icon}) {
    return Expanded(
      child: Card(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 40, color: Colors.orange),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String instructor,
    required String price,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              color: Colors.blue[100],
              child: const Center(
                child: Text(
                  'W',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              instructor,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 36),
              ),
              child: const Text('Start', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildTeacherCard({
    required String name,
    required String title,
    required String imageUrl,
  }) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
