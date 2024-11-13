// models/care_request_model.dart

class CareRequest {
  final String careCategory; // 간병 분류
  final String careType; // 간병 유형
  final DateTime startDate; // 간병 시작 날짜
  final DateTime endDate; // 간병 종료 날짜
  final String careLocation; // 간병 장소
  final int age; // 나이
  final String gender; // 성별
  final String careLevel; // 장기요양 등급
  final bool isMobile; // 거동 가능 여부
  final String disease; // 질환 및 질병
  final String notes; // 기타 특이사항

  CareRequest({
    required this.careCategory,
    required this.careType,
    required this.startDate,
    required this.endDate,
    required this.careLocation,
    required this.age,
    required this.gender,
    required this.careLevel,
    required this.isMobile,
    required this.disease,
    required this.notes,
  });
}
