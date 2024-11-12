import 'package:flutter/material.dart';

class RequestCarePage extends StatefulWidget {
  const RequestCarePage({super.key});

  @override
  State<RequestCarePage> createState() => _RequestCarePageState();
}

class _RequestCarePageState extends State<RequestCarePage> {
  String? selectedOption;

  void onSelectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간병 요청'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '어떤 간병이 필요하신가요?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  CareOptionCard(
                    imagePath: 'assets/images/guardian_img.png',
                    title: '단순간병',
                    isSelected: selectedOption == '단순간병',
                    onTap: () => onSelectOption('단순간병'),
                  ),
                  const SizedBox(height: 16),
                  CareOptionCard(
                    imagePath: 'assets/images/guardian_img.png',
                    title: '전문간병\n(자격증 소지자)',
                    isSelected: selectedOption == '전문간병\n(자격증 소지자)',
                    onTap: () => onSelectOption('전문간병\n(자격증 소지자)'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedOption != null
                    ? () {
                        // 다음 버튼 동작 추가
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedOption != null ? Colors.black : Colors.grey[200],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                ),
                child: Text(
                  '다음',
                  style: TextStyle(
                    color: selectedOption != null ? Colors.white : Colors.grey,
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

class CareOptionCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CareOptionCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.black : Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
          color: isSelected ? Colors.grey[300] : Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
              // color: isSelected ? Colors.black : Colors.grey,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                // color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
