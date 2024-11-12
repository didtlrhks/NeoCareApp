import 'package:flutter/material.dart';

class SelectCareTypePage extends StatefulWidget {
  const SelectCareTypePage({super.key});

  @override
  State<SelectCareTypePage> createState() => _SelectCareTypePageState();
}

class _SelectCareTypePageState extends State<SelectCareTypePage> {
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
        title: const Text('간병 유형 선택'),
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
              '간병 유형을 선택해 주세요.',
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
                    title: '장기 간병',
                    isSelected: selectedOption == '장기 간병',
                    onTap: () => onSelectOption('장기 간병'),
                  ),
                  const SizedBox(height: 16),
                  CareOptionCard(
                    imagePath: 'assets/images/guardian_img.png',
                    title: '단기 간병',
                    isSelected: selectedOption == '단기 간병',
                    onTap: () => onSelectOption('단기 간병'),
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
                        // 다음 페이지로 이동 또는 다른 동작
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
          color: isSelected ? Colors.grey[200] : Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
