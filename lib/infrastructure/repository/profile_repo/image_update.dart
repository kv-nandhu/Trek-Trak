import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as _firebaseStorage;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImageRepo {
  final picker = ImagePicker();

  // Pick an image from the gallery
  Future<XFile?> getImageFromGallery() async {
    final file = await picker.pickImage(source: ImageSource.gallery);
    return file;
  }

  // Pick an image from the camera
  Future<XFile?> getImageFromCamera() async {
    final file = await picker.pickImage(source: ImageSource.camera);
    return file;
  }

  // Pick multiple images from the gallery
  Future<List<XFile>?> getMultiImage() async {
    List<XFile> files = await picker.pickMultiImage();
    return files;
  }

  // Upload a single image to Firebase Storage and update Firestore
  Future<String?> uploadImageToFirebase(XFile file, String uid) async {
    try {
      final File imageFile = File(file.path);
      _firebaseStorage.Reference ref = _firebaseStorage.FirebaseStorage.instance
          .ref()
          .child('${DateTime.now().microsecondsSinceEpoch.toString()}_${file.name}');

      // Set metadata if needed
      final metadata = _firebaseStorage.SettableMetadata(
        contentType: 'image/jpeg', // Adjust based on file type
      );

      _firebaseStorage.UploadTask uploadTask = ref.putFile(imageFile, metadata);

      // Listen to upload progress
      uploadTask.snapshotEvents.listen((event) {
        print('Upload progress: ${(event.bytesTransferred / event.totalBytes) * 100}%');
      }, onError: (error) {
        print('Upload error: $error');
      });

      await uploadTask;

      // Get the download URL
      String imageUrl = await ref.getDownloadURL();

      // Update Firestore with the image URL
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .update({'image': imageUrl});

      return imageUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return null;
    }
  }
}

// Example Flutter widget using the ImageRepo class
class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  final ImageRepo _imageRepo = ImageRepo();
  String _status = '';

  Future<void> _uploadImage() async {
    // Assume user is authenticated and uid is available
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // Pick an image from the gallery
    XFile? imageFile = await _imageRepo.getImageFromGallery();

    if (imageFile != null) {
      String? imageUrl = await _imageRepo.uploadImageToFirebase(imageFile, uid);

      if (imageUrl != null) {
        setState(() {
          _status = 'Image uploaded successfully: $imageUrl';
        });
      } else {
        setState(() {
          _status = 'Failed to upload image';
        });
      }
    } else {
      setState(() {
        _status = 'No image selected';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
            if (_status.isNotEmpty) Text(_status),
          ],
        ),
      ),
    );
  }
}