import 'package:flutter/material.dart';
import 'screen/caregiver_page.dart';
import 'screen/guardian_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: Center(
          child: WelcomeScreen(),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '케어플러스에 \n오신것을 환영합니다!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Padding(padding: EdgeInsets.all(40)),

          // 첫 번째 카드
          Card(
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CaregiverPage()),
                );
              },
              child: const Padding(
                padding:
                    EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 16),
                child: Row(
                  children: [
                    // 텍스트 부분
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '간병인을 요청하고 싶다면',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '보호자',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 이미지 부분
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/caregiver_img.png'),
                      radius: 30,
                    ),
                    Icon(Icons.arrow_forward_ios, size: 20),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),

          // 두 번째 카드
          Card(
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GuardianPage()),
                );
              },
              child: const Padding(
                padding:
                    EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 16),
                child: Row(
                  children: [
                    // 텍스트 부분
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '간병인을 요청하고 싶다면',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '간병인',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 이미지 부분
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/guardian_img.png'),
                      radius: 30,
                    ),
                    Icon(Icons.arrow_forward_ios, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
