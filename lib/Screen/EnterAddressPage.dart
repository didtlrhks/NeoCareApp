import 'package:flutter/material.dart';
import 'package:flutter_application_neocare/Screen/PatientInfoPage.dart';

class EnterAddressPage extends StatefulWidget {
  const EnterAddressPage({super.key});

  @override
  State<EnterAddressPage> createState() => _EnterAddressPageState();
}

class _EnterAddressPageState extends State<EnterAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '간병 장소는 어디인가요?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                hintText: '예: 경기 양주시 부흥로 1907번길 182 (고읍동)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {}); // 상태 업데이트를 통해 버튼 활성화 상태 변경
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _detailsController,
              decoration: const InputDecoration(
                hintText: '추가 상세주소 (예: 용진빌딩 2층)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {}); // 상태 업데이트를 통해 버튼 활성화 상태 변경
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addressController.text.isNotEmpty
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PatientInfoPage()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _addressController.text.isNotEmpty
                      ? Colors.black
                      : Colors.grey[200],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                ),
                child: Text(
                  '다음',
                  style: TextStyle(
                    color: _addressController.text.isNotEmpty
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
