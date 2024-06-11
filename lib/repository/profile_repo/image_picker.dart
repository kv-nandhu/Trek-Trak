import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class ImageService {
    final picker = ImagePicker();
  Future<XFile?> pickImageFromGallery() async {
    XFile? image =  await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<XFile?> pickImageFromCamera() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }
   Future<List<XFile>?> getMultiImage() async {
    List<XFile> file = await picker.pickMultiImage();
    return file;
  }
    Future<String?> uploadImageToFirebase(XFile file) async {
    try {
final File files = File(file.path);
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref('${DateTime.now().millisecondsSinceEpoch.toString()}');
        firebase_storage.UploadTask uploadTask = ref.putFile(files);
        await uploadTask;
        String imageUrl = await ref.getDownloadURL();
    
      return imageUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return null;
    }
  }
}