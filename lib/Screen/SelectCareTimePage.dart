import 'package:flutter/material.dart';

class SelectCareTimePage extends StatefulWidget {
  const SelectCareTimePage({super.key});

  @override
  State<SelectCareTimePage> createState() => _SelectCareTimePageState();
}

class _SelectCareTimePageState extends State<SelectCareTimePage> {
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
          // 시작 시간 이후에만 종료 시간 선택 가능
          if (endTime != null && endTime!.hour < startTime!.hour) {
            endTime = null;
          } else if (endTime != null &&
              endTime!.hour == startTime!.hour &&
              endTime!.minute < startTime!.minute) {
            endTime = null;
          }
        } else {
          endTime = picked;
        }
      });
    }
  }

  String formatTimeOfDay(TimeOfDay? time) {
    if (time == null) return '';
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
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
              '돌봄 시간을 선택해 주세요.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TimeInputField(
              label: '시작 시간',
              time: startTime,
              onTap: () => selectTime(context, true),
            ),
            const SizedBox(height: 16),
            TimeInputField(
              label: '종료 시간',
              time: endTime,
              onTap: () => selectTime(context, false),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: startTime != null && endTime != null
                    ? () {
                        // 다음 페이지로 이동 또는 다른 동작
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: startTime != null && endTime != null
                      ? Colors.black
                      : Colors.grey[200],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                ),
                child: Text(
                  '다음',
                  style: TextStyle(
                    color: startTime != null && endTime != null
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

class TimeInputField extends StatelessWidget {
  final String label;
  final TimeOfDay? time;
  final VoidCallback onTap;

  const TimeInputField({
    super.key,
    required this.label,
    required this.time,
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
                  time != null ? formatTimeOfDay(time) : '',
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.access_time,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatTimeOfDay(TimeOfDay? time) {
    if (time == null) return '';
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
