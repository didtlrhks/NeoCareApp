import 'package:flutter/material.dart';
import 'package:flutter_application_neocare/Screen/home_page.dart';

class PatientInfoPage extends StatefulWidget {
  const PatientInfoPage({super.key});

  @override
  State<PatientInfoPage> createState() => _PatientInfoPageState();
}

class _PatientInfoPageState extends State<PatientInfoPage> {
  final TextEditingController _birthYearController = TextEditingController();
  final TextEditingController _diseaseController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String? selectedGender;
  String? selectedCareLevel;
  String? selectedMobility;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("요청 완료"),
          content: const Text("요청이 완료되었습니다."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(), // 이동할 페이지
                  ),
                  (route) => false, // 네비게이션 스택을 모두 제거
                );
              },
              child: const Text("확인"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간병 요청'),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '환자 상태를 입력해 주세요.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // 나이 입력 필드
            const Text('나이', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _birthYearController,
              decoration: const InputDecoration(
                hintText: '태어난 년도를 입력해 주세요.',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // 성별 선택
            const Text('성별', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => selectedGender = '남자'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedGender == '남자'
                          ? Colors.black
                          : Colors.grey[200],
                    ),
                    child: Text(
                      '남자',
                      style: TextStyle(
                        color: selectedGender == '남자'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => selectedGender = '여자'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedGender == '여자'
                          ? Colors.black
                          : Colors.grey[200],
                    ),
                    child: Text(
                      '여자',
                      style: TextStyle(
                        color: selectedGender == '여자'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // 장기요양 등급 선택
            const Text('장기요양 등급',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                hintText: '장기요양등급을 선택해 주세요.',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: '1등급', child: Text('1등급')),
                DropdownMenuItem(value: '2등급', child: Text('2등급')),
                DropdownMenuItem(value: '3등급', child: Text('3등급')),
                DropdownMenuItem(value: '4등급', child: Text('4등급')),
              ],
              onChanged: (value) => setState(() => selectedCareLevel = value),
            ),
            const SizedBox(height: 20),
            // 거동 가능 여부
            const Text('거동 가능 여부',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => selectedMobility = '가능'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedMobility == '가능'
                          ? Colors.black
                          : Colors.grey[200],
                    ),
                    child: Text(
                      '가능',
                      style: TextStyle(
                        color: selectedMobility == '가능'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => selectedMobility = '불가능'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedMobility == '불가능'
                          ? Colors.black
                          : Colors.grey[200],
                    ),
                    child: Text(
                      '불가능',
                      style: TextStyle(
                        color: selectedMobility == '불가능'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // 질환 및 질병 입력 필드
            const Text('질환 및 질병',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _diseaseController,
              decoration: const InputDecoration(
                hintText: '질환 및 질병을 입력해 주세요.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // 기타 특이사항 입력 필드
            const Text('기타 특이사항',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                hintText: '특이사항을 입력해 주세요.',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            // 간병 요청 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showDialog(); // 요청 완료 다이얼로그 표시
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  '간병 요청',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
