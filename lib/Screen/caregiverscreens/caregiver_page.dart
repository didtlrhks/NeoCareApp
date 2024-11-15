import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CaregiverProfilePage extends StatefulWidget {
  const CaregiverProfilePage({super.key});

  @override
  _CaregiverProfilePageState createState() => _CaregiverProfilePageState();
}

class _CaregiverProfilePageState extends State<CaregiverProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  XFile? _profileImage;
  final List<XFile> _certificateImages = [];
  String? _selectedGender;

  Future<void> _pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        _profileImage = selectedImage;
      });
    }
  }

  Future<void> _pickCertificateImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> selectedImages = await picker.pickMultiImage();
    if (selectedImages.length + _certificateImages.length <= 5) {
      setState(() {
        _certificateImages.addAll(selectedImages);
      });
    } else {
      // Show a message if more than 5 images are selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('최대 5장까지 선택 가능합니다.')),
      );
    }
  }

  void _setGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필 등록'),
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
              '프로필 등록',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(File(_profileImage!.path))
                        : const AssetImage('assets/images/caregiver_img.png')
                            as ImageProvider,
                    backgroundColor: Colors.grey[200],
                  ),
                  GestureDetector(
                    onTap: _pickProfileImage,
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.black,
                      child:
                          Icon(Icons.camera_alt, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('이름', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: '이름을 입력해주세요.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text('성별', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _setGender('남자'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedGender == '남자'
                          ? Colors.black
                          : Colors.grey[200],
                    ),
                    child: Text(
                      '남자',
                      style: TextStyle(
                        color: _selectedGender == '남자'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _setGender('여자'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedGender == '여자'
                          ? Colors.black
                          : Colors.grey[200],
                    ),
                    child: Text(
                      '여자',
                      style: TextStyle(
                        color: _selectedGender == '여자'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('보유 자격증', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickCertificateImages,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt,
                          size: 30, color: Colors.grey),
                      Text('사진 ${_certificateImages.length}/5',
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '서비스 가능한 지역 (최대 5개)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // Add location selection here
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Complete registration
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('완료', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
