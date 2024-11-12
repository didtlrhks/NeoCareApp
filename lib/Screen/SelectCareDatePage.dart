import 'package:flutter/material.dart';
import 'package:flutter_application_neocare/Screen/SelectCareTimePage.dart';
import 'package:intl/intl.dart';

class SelectCareDatePage extends StatefulWidget {
  const SelectCareDatePage({super.key});

  @override
  State<SelectCareDatePage> createState() => _SelectCareDatePageState();
}

class _SelectCareDatePageState extends State<SelectCareDatePage> {
  DateTime? startDate;
  DateTime? endDate;

  Future<void> selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
          if (endDate != null && endDate!.isBefore(startDate!)) {
            endDate = null; // 종료일이 시작일 이전이면 초기화
          }
        } else {
          endDate = picked;
        }
      });
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('yyyy-MM-dd').format(date);
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '간병 기간을 선택해 주세요.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            DateInputField(
              label: '시작일',
              date: startDate,
              onTap: () => selectDate(context, true),
            ),
            const SizedBox(height: 16),
            DateInputField(
              label: '종료일',
              date: endDate,
              onTap: () => selectDate(context, false),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: startDate != null && endDate != null
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SelectCareTimePage()));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: startDate != null && endDate != null
                      ? Colors.black
                      : Colors.grey[200],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                ),
                child: Text(
                  '다음',
                  style: TextStyle(
                    color: startDate != null && endDate != null
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

class DateInputField extends StatelessWidget {
  final String label;
  final DateTime? date;
  final VoidCallback onTap;

  const DateInputField({
    super.key,
    required this.label,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Text(
                  date != null ? DateFormat('yyyy-MM-dd').format(date!) : '',
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
