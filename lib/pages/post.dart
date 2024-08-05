import 'package:flutter/material.dart';
import 'package:mt_pyxel/components/common_bottombar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'dart:convert';
// components
import 'package:mt_pyxel/components/page_title.dart';
import 'package:mt_pyxel/components/category_selector.dart';
import 'package:mt_pyxel/components/singleline_textfield.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  List<String> categories = [
    "Games",
    "Tech",
    "Tools",
    "Paints",
    "Musics",
    "Users"
  ];

  int categoryIndex = 0;

  // Data
  String projectName = "";
  String executionLink = "";
  String description = "";
  Uint8List? _imageData;
  String? _imageName;

  String _generateHash(Uint8List data) {
    var bytes = utf8.encode(
        base64Encode(data)); // Convert image data to base64 and then to bytes
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> pickImage() async {
    Uint8List? imageFromPicker = await ImagePickerWeb.getImageAsBytes();

    if (imageFromPicker != null) {
      setState(() {
        _imageData = imageFromPicker;
        _imageName = _generateHash(imageFromPicker);
      });
    } else {
      debugPrint('No image selected.');
    }
  }

  Future<String?> uploadFile() async {
    if (_imageData == null || _imageName == null) return null;

    try {
      final destination = 'thumbnails/$_imageName';
      final ref = FirebaseStorage.instance.ref(destination);
      // Upload file
      final uploadTask = ref.putData(_imageData!);
      // Wait for upload to complete
      final snapshot = await uploadTask.whenComplete(() => {});
      // Get the download URL
      final downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      debugPrint('Error uploading file: $e');
      return null;
    }
  }

  Future postData() async {
    try {
      String? imageUrl = await uploadFile();

      if (description.isNotEmpty &&
          executionLink.isNotEmpty &&
          projectName.isNotEmpty) {
        CollectionReference posts =
            FirebaseFirestore.instance.collection('posts');
        await posts.add({
          'author': 'anonymous',
          'desc': description,
          'executeLink': executionLink,
          'image': imageUrl ?? "",
          'kind': categories[categoryIndex],
          'likes': 0,
          'title': projectName,
        });
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Post successful!", style: TextStyle(fontSize: 32)),
            duration: Duration(seconds: 10),
          ));
          Navigator.of(context).pop();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('There are some items that are not filled in!!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to post: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(
      children: [
        const SizedBox(height: 64),
        const PageTitle(title: "Post Your Project"),
        const SizedBox(height: 84),

        // Thumbnail
        const Text("Thumbnail", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        InkWell(
            splashColor: Colors.transparent,
            onTap: pickImage,
            child: Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.secondary, width: 2.5),
                borderRadius: BorderRadius.circular(0),
              ),
              child: _imageData == null
                  ? Image.asset("images/upload.png", height: 32)
                  : Image.memory(_imageData!, fit: BoxFit.cover),
            )),
        const SizedBox(height: 32),

        // Project Name
        const Text("Project Name", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SinglelineTextField(
            onChanged: (v) => setState(() {
                  projectName = v;
                })),
        const SizedBox(height: 32),

        // Execution Link
        const Text("Execution Link", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SinglelineTextField(
            onChanged: (v) => setState(() {
                  executionLink = v;
                })),
        const SizedBox(height: 32),

        // Description
        const Text("Description", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        SizedBox(
            width: 600,
            child: TextField(
                style: const TextStyle(fontSize: 22),
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                maxLength: 3000,
                onChanged: (v) => setState(() {
                      description = v;
                    }),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(0))))),
        const SizedBox(height: 32),

        // Category
        const Text("Category", style: TextStyle(fontSize: 36)),
        const SizedBox(height: 8),
        CategorySelector(
            onPressed: (v) => setState(() {
                  categoryIndex = v;
                }),
            categories: categories,
            categoryIndex: categoryIndex),
        const SizedBox(height: 32),

        const SizedBox(height: 32),
        ElevatedButton(
            onPressed: postData,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
            ),
            child: Text("  POST  ",
                style: TextStyle(
                    fontSize: 48,
                    color: Theme.of(context).colorScheme.onPrimary))),
        const SizedBox(height: 32),
        const CommonBottomBar()
      ],
    ))));
  }
}
