import 'dart:io';

import 'package:image_picker/image_picker.dart';

class FilesUpload {
  static File? file;
  static List fileList = [];
  static XFile? imageGallery;
  static getFile() async {
    final ImagePicker picker = ImagePicker();

    imageGallery = await picker.pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      file = File(imageGallery!.path);

      fileList.add(file);
    }
    // return fileList;
  }
}
