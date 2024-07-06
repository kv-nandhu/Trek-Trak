import 'dart:io';
import 'package:flutter/material.dart';
import 'package:document_scanner/document_scanner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';



class Scanner extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Scanner> {
  File? scannedImage;

  void onDocumentScanned(ScannedImage scannedImage) async {
    setState(() {
      // this.scannedImage = scannedImage.getFile();
    });

    // Upload scanned image to Firebase Storage and save metadata in Firestore
    // await uploadImageToFirebase(scannedImage.getFile());
  }

  Future<void> uploadImageToFirebase(File file) async {
    try {
      // Create a reference to the Firebase Storage location
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);

      // Upload file to Firebase Storage
      await ref.putFile(file);

      // Get download URL of the uploaded file
      String downloadURL = await ref.getDownloadURL();

      // Save metadata (download URL) to Cloud Firestore
      await saveImageMetadataToFirestore(fileName, downloadURL);
    } catch (e) {
      print('Error uploading image to Firebase: $e');
    }
  }

  Future<void> saveImageMetadataToFirestore(
      String fileName, String downloadURL) async {
    try {
      // Reference to the Firestore collection 'users'
      CollectionReference usersRef =
          FirebaseFirestore.instance.collection('users');

      // Add document with image metadata
      await usersRef.add({
        'fileName': fileName,
        'downloadURL': downloadURL,
        'timestamp': DateTime.now(),
      });

      print('Image metadata saved to Firestore');
    } catch (e) {
      print('Error saving image metadata to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Scanner Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (scannedImage != null)
              Image.file(
                scannedImage!,
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentScanner(
                      onDocumentScanned: onDocumentScanned,
                      noGrayScale: true,
                    ),
                  ),
                );
              },
              child: Text('Scan Document'),
            ),
          ],
        ),
      ),
    );
  }
}
