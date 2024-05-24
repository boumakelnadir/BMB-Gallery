import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:notes2/firebase/firestore/add_image-files.dart';
import 'package:notes2/firebase/get_files.dart';
import 'package:notes2/widget/login_button.dart';
import 'package:notes2/widget/views/info_image_view.dart';

class BuilderImages extends StatefulWidget {
  const BuilderImages({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<BuilderImages> createState() => _BuilderImagesState();
}

class _BuilderImagesState extends State<BuilderImages> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        controller: widget.controller,
        physics: const BouncingScrollPhysics(),
        itemCount: FilesUpload.fileList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                FadeRoute(
                  InfoImageView(
                    file: FilesUpload.fileList[index],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
