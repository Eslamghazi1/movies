import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Image_picker extends StatefulWidget {
   Image_picker({super.key, required this.onselectedimage,this.imagepath});
  final void Function(File image) onselectedimage;
  String? imagepath;
  @override
  State<Image_picker> createState() => _Image_pickerState();
}

class _Image_pickerState extends State<Image_picker> {
  File? image;

  _takeimage() async {
    ImagePicker imagepicker = ImagePicker();
    XFile? pickedimage;
    Get.bottomSheet(
        Container(
          color: Colors.white.withOpacity(0.8),
      height: 200,
      child: Row(
        children: [
          Expanded(
              child: InkWell(
                  onTap: () async {
                    pickedimage = await imagepicker.pickImage(
                        source: ImageSource.camera, maxWidth: 666);
                    if (pickedimage == null) {
                      return;
                    }
                    setState(() {
                      image = File(pickedimage!.path);
                    });
                    widget.onselectedimage(image!);
                  },
                  child: Icon(Icons.camera,size: 50))),
          Expanded(
              child: InkWell(
                  onTap: () async {
                    pickedimage = await imagepicker.pickImage(
                        source: ImageSource.gallery, maxWidth: 666);
                    if (pickedimage == null) {
                      return;
                    }
                    setState(() {
                      image = File(pickedimage!.path);
                    });
                    widget.onselectedimage(image!);

                    Get.closeAllSnackbars();
                  },
                  child: Icon(Icons.image,size: 50,)))
        ],
      ),
    ));


  }

  @override
  Widget build(BuildContext context) {
    print("the image is :${widget.imagepath}");
    // print((image==null && widget.imagepath == null|| widget.imagepath!.isEmpty ));
    return Column(
      children: [
        Container(
          child: CircleAvatar(
            radius: MediaQuery.of(context).orientation == Orientation.landscape
                ? MediaQuery.of(context).size.width / 4
                : MediaQuery.of(context).size.height / 3,
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            foregroundImage: (image==null && widget.imagepath == null)? null : FileImage(image!),
          ),
        ),
        TextButton.icon(
          onPressed: _takeimage,
          icon: const Icon(Icons.image),
          label: const Text("Add image"),
        )
      ],
    );
  }
}
