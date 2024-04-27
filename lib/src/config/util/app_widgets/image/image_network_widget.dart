import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageNetworkWidget extends StatelessWidget {
  const ImageNetworkWidget({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  // File? file;
  // String? profileImageFile;

  // Future<File> getImage(ImageSource imageSource) async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: imageSource);
  //   profileImageFile = image!.path;
  //   File file = File(image.path);
  //   return file;
  // }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: 100.h,
      width: 100.h,
      //frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
    );
  }
}
