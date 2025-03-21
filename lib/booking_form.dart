import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class BookingFormPage extends StatefulWidget {
  final String serviceTitle;

  const BookingFormPage({required this.serviceTitle, Key? key}) : super(key: key);

  @override
  _BookingFormPageState createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  //List<File> _mobileSelectedImages = [];
  //List<XFile> _webSelectedImages = [];
  List<dynamic> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  /// Request permissions for storage access
  Future<void> _requestPermissions() async {
    if (Platform.isWindows) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.photos,
        Permission.storage,
      ].request();

      if (statuses[Permission.photos]!.isDenied ||
          statuses[Permission.storage]!.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Storage permission is required!")),
        );
      }
    }
  }


  Future<void> _pickImages() async {
    try {
      // If running on web, do not request permissions
      if (!kIsWeb) {
        if (!(await Permission.photos.request().isGranted ||
            await Permission.storage.request().isGranted)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Storage permission denied!")),
          );
          return;
        }
      }

      final List<XFile>? images = await _picker.pickMultiImage(
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (images != null && images.isNotEmpty) {
        setState(() {
          if (kIsWeb) {
            _selectedImages = images; // Keep XFile format for web (use .readAsBytes() later)
          } else {
            _selectedImages = images.map((xfile) => File(xfile.path)).toList(); // Convert to File on mobile
          }
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error selecting images: ${e.toString()}')),
      );
    }
  }


  void _submitForm() async {
    String serviceTitle = widget.serviceTitle;
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();



    if (_formKey.currentState!.validate()) {
      try {
        // Get the user ID
        String uid = FirebaseAuth.instance.currentUser!.uid;

        // Firestore instance
        final postRef = await FirebaseFirestore.instance.collection("posts").add({
          'title': title,
          'description': description,
          'serviceTitle': serviceTitle, // Store the service title
          'userId' : uid,
          'timestamp': FieldValue.serverTimestamp(), // Store time of post
        });
        print('Completed1');
        String postId = postRef.id;
        // Upload images to Firebase Storage and get URLs
        List<String> imageUrls = await _uploadImagesToStorage(postId);

        // Update the Firestore document with image URLs
        await postRef.update({'imageUrls': imageUrls});
        print('Completed2');

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Booking submitted successfully!")),
        );

        // Navigate back after submission
        Navigator.pop(context);
      } catch (e) {
        // Handle Firestore errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error submitting booking: ${e.toString()}")),
        );
      }
    }
  }

  /// Upload selected images to Firebase Storage
  Future<List<String>> _uploadImagesToStorage(String postId) async {
    List<String> downloadUrls = [];

    if (kIsWeb) {
      for (int i = 0; i < _selectedImages.length; i++) {
        String fileName = "$postId-$i.jpg"; // Unique file name

        try {
          // Reference to Firebase Storage
          final imagesRef = FirebaseStorage.instance.ref('post_images').child(fileName);


          // Convert File to Uint8List for web uploads
          Uint8List fileBytes = await _selectedImages[i].readAsBytes();
          final uploadTask = imagesRef.putData(fileBytes);


          final taskSnapshot = await uploadTask;
          String downloadUrl = await taskSnapshot.ref.getDownloadURL();
          downloadUrls.add(downloadUrl);
        } catch (e) {
          print("Error uploading image: $e");
        }
      }
    } else {
      for (int i = 0; i < _selectedImages.length; i++) {
        String fileName = "$postId-$i.jpg"; // Unique file name

        try {
          // Reference to Firebase Storage
          final imagesRef = FirebaseStorage.instance.ref('post_images').child(fileName);

          // Mobile: Upload File
          File imageFile = _selectedImages[i];
          final uploadTask = imagesRef.putFile(imageFile);

          final taskSnapshot = await uploadTask;
          String downloadUrl = await taskSnapshot.ref.getDownloadURL();
          downloadUrls.add(downloadUrl);
        } catch (e) {
          print("Error uploading image: $e");
        }
      }
    }

    return downloadUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book ${widget.serviceTitle}")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Problem Title Input
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: "Problem Title"),
                      validator: (value) => value!.isEmpty ? "Title is required" : null,
                    ),
                    const SizedBox(height: 16),

                    // Description Input (Square Box)
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: "Description...",
                        border: OutlineInputBorder(), // Square box
                      ),
                      maxLines: 5,
                      validator: (value) => value!.isEmpty ? "Description is required" : null,
                    ),
                    const SizedBox(height: 16),

                    // Image Picker Button
                    ElevatedButton(onPressed: _pickImages, child: const Text("Pick Images")),
                    const SizedBox(height: 16),

                    // Display Selected Images
                    if (_selectedImages.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _selectedImages.map((file) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: kIsWeb
                                ? Image.network(
                                  file.path, // Web uses a URL
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.image_not_supported, size: 80, color: Colors.grey);
                                  },
                                )
                                : Image.file(
                                  File(file.path), // Mobile uses File
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.image_not_supported, size: 80, color: Colors.grey);
                                  },
                                ),
                          );
                        }).toList(),
                      )
                    else
                      const Text("No images selected", style: TextStyle(color: Colors.grey)),

                    const SizedBox(height: 24),
                  ],
                ),
              ),

              // Confirm Booking Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: _submitForm, child: const Text("Confirm Booking")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
