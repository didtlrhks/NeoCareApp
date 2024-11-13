// data/dummy_data.dart

import '../models/care_request_model.dart';

List<CareRequest> dummyCareRequests = [
  CareRequest(
    careCategory: '간병분류 A',
    careType: '간병유형 B',
    startDate: DateTime(2024, 4, 23),
    endDate: DateTime(2024, 4, 30),
    careLocation: '경기 양주시 부흥로 1907번길 182 (고읍동)',
    age: 72,
    gender: '남자',
    careLevel: '1등급',
    isMobile: false,
    disease: '고혈압, 당뇨',
    notes: '환자는 밤에 잠을 잘 못 이룬다.',
  ),
  CareRequest(
    careCategory: '간병분류 B',
    careType: '간병유형 C',
    startDate: DateTime(2024, 5, 5),
    endDate: DateTime(2024, 5, 12),
    careLocation: '서울 용산구 이태원로',
    age: 80,
    gender: '여자',
    careLevel: '2등급',
    isMobile: true,
    disease: '치매',
    notes: '낮 시간에는 산책을 좋아한다.',
  ),
  // 추가 데이터
];
