import 'package:flutter/material.dart';
import 'package:flutter_application_neocare/screen/RequestCarePage.dart';
import 'package:flutter_application_neocare/data/dummy_data.dart';
import 'package:flutter_application_neocare/models/care_request_model.dart';
import 'package:flutter_application_neocare/widget/care_request_card.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_neocare/screen/edit_profile_screen.dart';
import 'dart:io';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RequestCarePage()),
                );
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
                        child: CareRequestCard(request: request),
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RequestCarePage()));
        },
        backgroundColor: const Color(0xFF5E35B1),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "김네오";
  String userPhone = "010-9876-5432";
  XFile? profileImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        profileImage = selectedImage;
      });
    }
  }

  void _navigateToEditProfile() async {
    final updatedName = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(userName: userName),
      ),
    );

    if (updatedName != null) {
      setState(() {
        userName = updatedName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // 로그아웃 기능 추가
                  },
                  child: const Text(
                    "로그아웃",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "안녕하세요.\n보호자님",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: profileImage != null
                    ? Image.file(File(profileImage!.path)).image
                    : null,
                backgroundColor: Colors.grey[200],
                child: profileImage == null
                    ? const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              userName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton.icon(
              onPressed: _navigateToEditProfile,
              icon: const Icon(Icons.edit, size: 16, color: Colors.grey),
              label: const Text(
                "프로필 수정",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "연락처",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        userPhone,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // 연락처 변경 기능 추가
                    },
                    child: const Text(
                      "변경하기",
                      style: TextStyle(
                        color: Color(0xFF5E35B1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildMenuItem(Icons.lock, "비밀번호 변경"),
            _buildMenuItem(Icons.access_time, "간병인 이용내역"),
            _buildMenuItem(Icons.exit_to_app, "탈퇴신청"),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(text),
      onTap: () {
        // 기능 추가
      },
    );
  }
}

// Separate screen for editing profile name
class EditProfileScreen extends StatefulWidget {
  final String userName;
  const EditProfileScreen({super.key, required this.userName});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _saveName() {
    Navigator.pop(context, _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("프로필 수정"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "이름",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveName,
              child: const Text("확인"),
            ),
          ],
        ),
      ),
    );
  }
}
