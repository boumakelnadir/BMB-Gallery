import 'package:flutter/material.dart';
import 'package:notes2/controller/custom_drawer.dart';
import 'package:notes2/firebase/firestore/add_image-files.dart';
import 'package:notes2/widget/builder_images.dart';
import 'package:notes2/widget/login_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Fab(
          controller: controller,
        ),
        drawer: CustomDrawer(drawerHeader: drawerHeader),
        appBar: AppBar(),
        body: SingleChildScrollView(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: BuilderImages(
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}

class Fab extends StatefulWidget {
  const Fab({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<Fab> createState() => _FabState();
}

class _FabState extends State<Fab> {
  bool showOption = false;
  bool icon = true;
  void toggleOptions() {
    setState(() {
      showOption = !showOption;
      icon = !icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton.extended(
          label: Icon(icon ? Icons.add : Icons.shuffle_sharp),
          onPressed: () {
            toggleOptions();
          },
        ),
        const SizedBox(height: 15),
        Visibility(
            visible: showOption,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'boutton 1',
                  onPressed: () {
                    widget.controller.animateTo(
                      0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.linear,
                    );
                  },
                  child: const Icon(Icons.arrow_upward),
                ),
                const SizedBox(height: 20),
                FloatingActionButton(
                  heroTag: 'boutton 2',
                  onPressed: () {
                    Navigator.of(context).push(
                      FadeRoute(
                        const AddImageFiles(),
                      ),
                    );
                  },
                  child: const Icon(Icons.add_a_photo_outlined),
                )
              ],
            ))
      ],
    );
  }
}
