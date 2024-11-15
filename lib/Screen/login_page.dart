import 'package:flutter/material.dart';
import 'package:flutter_application_neocare/screen/caregiverscreens/caregiver_page.dart';
import 'package:flutter_application_neocare/screen/guardian_page.dart';
import 'home_page.dart';
import 'signup_selection_page.dart'; // 회원 유형 선택 페이지

class LoginPage extends StatelessWidget {
  final String role;
  const LoginPage({super.key, required this.role});

  void _handleLogin(BuildContext context) {
    if (role == 'caregiver') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CaregiverProfilePage()),
        (Route<dynamic> route) => false,
      );
    } else if (role == 'guardian') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NEO CARE"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                '소중한 가족을 위한 선택\n케어플러스와 함께 시작하세요.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(
                  labelText: '아이디(이메일)을 입력해주세요.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: '비밀번호를 입력해주세요.',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _handleLogin(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                '빠르게, 케어플러스와 만나는 방법',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle, color: Colors.green, size: 40),
                  SizedBox(width: 20),
                  Icon(Icons.account_circle, color: Colors.orange, size: 40),
                  SizedBox(width: 20),
                  Icon(Icons.account_circle, color: Colors.blue, size: 40),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    // 회원가입 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpSelectionPage(),
                      ),
                    );
                  },
                  child: const Text(
                    '회원가입 하기',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '아이디 찾기',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '비밀번호 찾기',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
