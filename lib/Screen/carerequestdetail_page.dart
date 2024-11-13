import 'package:flutter/material.dart';
import 'package:flutter_application_neocare/models/care_request_model.dart';

class CareRequestDetailPage extends StatelessWidget {
  final CareRequest request;

  const CareRequestDetailPage({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간병 요청'),
        actions: [
          TextButton(
            onPressed: () {
              // 삭제 기능 구현
            },
            child: const Text(
              '삭제',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '간병정보',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            buildInfoRow('간병분류', request.careCategory),
            buildInfoRow('간병유형', '기간제'), // 예시 데이터
            buildInfoRow(
              '간병기간',
              '${request.startDate.toLocal().toString().split(' ')[0]} ~ ${request.endDate.toLocal().toString().split(' ')[0]}',
            ),
            buildInfoRow('돌봄시간', '00:00 ~ 05:00'), // 예시 데이터
            buildInfoRow('간병장소', request.careLocation),
            const SizedBox(height: 16),
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(
                child: Text('KAKAO MAP API\n426 x 287'),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '환자정보',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            buildInfoRow('나이', '${request.age}년생'),
            buildInfoRow('성별', request.gender),
            buildInfoRow('장기요양등급', request.careLevel),
            buildInfoRow('거동가능여부', request.isMobile ? '가능' : '불가능'),
            buildInfoRow('기타 질환 및 질병', request.disease ?? '없음'),
            buildInfoRow('기타 특이사항', request.notes ?? '없음'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 견적보기 버튼 동작
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  '견적보기',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(value),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
