import 'package:flutter/material.dart';
import 'login_page.dart'; // LoginPage import 추가

class CaregiverPage extends StatelessWidget {
  const CaregiverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '도움에 도움을 더하다',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        // 스크롤을 가능하게 하는 위젯
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                '보호자',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5E35B1), // 색상은 이미지 참조하여 보라색으로 지정
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '보호자 분들은 간병 정보를 등록하면\n간병인들과부터 합리적인 견적을\n받아보실 수 있습니다.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Container(
                width: 400,
                height: 450,
                color: Colors.grey[300], // 이미지 대체용 회색 배경
                child: const Center(
                  child: Text(
                    '400 x 475\n짙은 이차 간병인과 환한 미소의 환자가\n어울릴 기대에 찬 장면을 바라보며 웃고있는 사진',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // LoginPage로 이동하는 코드 추가
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E35B1), // 보라색 버튼
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
