import 'package:flutter/material.dart';
import 'package:flutter_application_neocare/models/care_request_model.dart';
import '../screen/carerequestdetail_page.dart';

class CareRequestCard extends StatelessWidget {
  final CareRequest request;

  const CareRequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CareRequestDetailPage(request: request),
          ),
        );
      },
      child: Card(
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
                    child: Text(
                      request.careCategory,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
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
      ),
    );
  }
}
