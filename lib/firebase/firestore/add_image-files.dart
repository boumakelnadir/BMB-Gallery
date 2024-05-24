import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:notes2/firebase/get_files.dart';
import 'package:notes2/widget/const/const.dart';
import 'package:notes2/widget/login_button.dart';
import 'package:notes2/widget/views/home_view.dart';
import 'package:path/path.dart';

String? imageUrl;
String? psdUrl;

class AddImageFiles extends StatefulWidget {
  const AddImageFiles({super.key});

  @override
  State<AddImageFiles> createState() => _AddImageFilesState();
}

class _AddImageFilesState extends State<AddImageFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (FilesUpload.file != null)
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: colorLogo, width: 2),
              ),
              child: Image.file(
                FilesUpload.file!,
                fit: BoxFit.fill,
              ),
            ),
          AddBoutton(
            isselected: imageUrl == null ? false : true,
            name: 'Upload Image',
            onTap: () async {
              await FilesUpload.getFile();
              if (FilesUpload.file != null) {
                var imageName = basename(FilesUpload.imageGallery!.path);
                var storegRef = FirebaseStorage.instance
                    .ref('files/pictures/')
                    .child('$imageName');
                storegRef.putFile(FilesUpload.file!);

                imageUrl = await storegRef.getDownloadURL();
              }

              setState(() {});
            },
          ),
          AddBoutton(
            isselected: false,
            name: 'Add',
            onTap: () async {
              Navigator.of(context).pushAndRemoveUntil(
                FadeRoute(const HomeView()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddBoutton extends StatelessWidget {
  const AddBoutton({
    super.key,
    required this.name,
    required this.onTap,
    required this.isselected,
  });
  final String name;
  final Function() onTap;

  final bool isselected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withAlpha(200),
              offset: const Offset(2, 4),
              blurRadius: 8,
              spreadRadius: 2,
            )
          ],
          color: isselected ? Colors.lightGreen[400] : backgroundColor,
        ),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            color: colorLogo,
          ),
        ),
      ),
    );
  }
}
