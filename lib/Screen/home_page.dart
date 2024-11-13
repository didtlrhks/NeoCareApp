import 'package:flutter/material.dart';
import 'package:flutter_application_neocare/data/dummy_data.dart';
import 'package:flutter_application_neocare/models/care_request_model.dart';

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

//#1 홈
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
                // 간병 요청 페이지로 이동
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
                  Text(
                    '간병요청하기',
                    style: TextStyle(color: Colors.white),
                  ),
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
            dummyCareRequests.isEmpty
                ? Container(
                    height: 160,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text("진행중인 간병이 없습니다.\n간병을 요청해 주세요."),
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dummyCareRequests.length,
                    itemBuilder: (context, index) {
                      final CareRequest request = dummyCareRequests[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Card(
                          color: const Color(0xFFEDE7F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        request.careCategory,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.arrow_forward_ios,
                                        size: 16, color: Colors.grey),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  request.careType,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today,
                                        size: 14, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    Text(
                                      "${request.startDate.toLocal()} ~ ${request.endDate.toLocal()}",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        size: 14, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    Text(
                                      request.careLocation,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "환자 나이: ${request.age}세, ${request.gender}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  "장기요양등급: ${request.careLevel}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  "거동 가능 여부: ${request.isMobile ? '가능' : '불가능'}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "질환 및 질병: ${request.disease}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "기타 특이사항: ${request.notes}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
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
    );
  }
}

//#2 간병요청
class RequestCareScreen extends StatelessWidget {
  const RequestCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간병인 요청'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '간병인 요청 내역',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: dummyCareRequests.length,
                itemBuilder: (context, index) {
                  final request = dummyCareRequests[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CareRequestCard(request: request),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 요청하기 버튼 동작 추가
        },
        backgroundColor: const Color(0xFF5E35B1),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CareRequestCard extends StatelessWidget {
  final CareRequest request;

  const CareRequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 2,
      color: const Color(0xFFEDE7F6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '기간제',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${request.startDate.toLocal().toString().split(' ')[0]} ~ ${request.endDate.toLocal().toString().split(' ')[0]}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.access_time, size: 16),
                    SizedBox(width: 4),
                    Text(
                      '돌봄시간',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      ' 01:00 ~ 02:00', // 예시 시간, 필요시 더미 데이터에 추가
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}

//#3 알림요청
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

//#4 내정보
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
