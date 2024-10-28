import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // 현재 선택된 탭 인덱스

  // 각 탭에 표시할 화면들을 리스트로 정의
  final List<Widget> _pages = [
    const HomeScreen(),
    const RequestCareScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  // 탭 선택 시 인덱스를 업데이트
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
      body: IndexedStack(
        index: _currentIndex, // 현재 선택된 인덱스에 해당하는 화면만 표시
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // 현재 선택된 탭 인덱스
        onTap: _onTabTapped, // 탭 선택 시 호출
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '간병요청',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '알림',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내정보',
          ),
        ],
        selectedItemColor: const Color(0xFF5E35B1), // 선택된 항목 색상
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// 각 탭에 해당하는 화면들 정의
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 480,
              color: Colors.grey[300],
              child: const Center(
                child: Text("480 x 480"),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 간병 요청하기 버튼 동작
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5E35B1),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.request_quote, color: Colors.white),
                  SizedBox(width: 8),
                  Text('간병요청하기'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '진행 중인 간병',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 160,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Center(
                child: Text("진행중인 간병이 없습니다.\n간병을 요청해 주세요."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestCareScreen extends StatelessWidget {
  const RequestCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '간병 요청 화면',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '알림 화면',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '내 정보 화면',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
