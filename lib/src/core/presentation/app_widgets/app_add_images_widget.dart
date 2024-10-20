import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppAddImagesWidget extends StatelessWidget {
  const AppAddImagesWidget({
    required this.callback,
    super.key,
  });

  final ValueSetter<String>? callback;

  @override
  Widget build(BuildContext context) {
    TextEditingController imageController = TextEditingController();
    TextEditingController smallImageController = TextEditingController();
    return Container(
      height: 100.h,
      //width: double.infinity,
      // color: bgColor ?? Colors.green,
      color: AppColors.bgColorMain,
      child: BlocProvider(
        create: (context) => sl<ImageCubit>(),
        child: BlocBuilder<ImageCubit, ImageState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedImageUrlState) {
              callback!(state.imageUrl);
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.imageList.length,
                separatorBuilder: (context, index) => SizedBox(width: 8.h),
                itemBuilder: (context, index) {
                  final image = state.imageList[index];
                  return image == ''
                      ? InkWell(
                          onTap: () {
                            AppBottomSheet.showBottomSheet(
                              context: context,
                              title: 'Add images',
                              content: buildImagesBottomSheet(
                                imageController: imageController,
                                onPressed: () {
                                  BlocProvider.of<ImageCubit>(context)
                                      .getImages(
                                    imageController.text,
                                  );
                                  Navigator.pop(context);
                                  imageController.clear;
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 100,
                            padding: REdgeInsets.symmetric(vertical: 10),
                            color: AppColors.bgColorMain,
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    height: 55,
                                    width: 55,
                                    child: const Center(
                                      child: Icon(
                                        Icons.camera_alt_rounded,
                                        size: 30,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    'Add your photos',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // child: Container(
                          //   margin: REdgeInsets.only(right: 8),
                          //   color: Colors.red,
                          //   // decoration: BoxDecoration(
                          //   //   color: Colors.red,
                          //   // ),
                          //   width: 100,
                          //   child: const Icon(
                          //     Icons.add_a_photo,
                          //     size: 60,
                          //     color: AppColors.grey,
                          //   ),
                          // ),
                        )
                      : InkWell(
                          onTap: () {},
                          child: Container(
                            //margin: REdgeInsets.only(right: 8),
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                },
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  //           CustomBottomSheet().showBottomSheet(
                  //              context: context,
                  // title: 'Image',
                  // content: ,
                  //           ),
                  AppBottomSheet.showBottomSheet(
                    context: context,
                    title: 'Add images',
                    content: buildImagesBottomSheet(
                      imageController: imageController,
                      onPressed: () {
                        BlocProvider.of<ImageCubit>(context).getImages(
                          imageController.text,
                        );
                        Navigator.pop(context);
                        imageController.clear;
                      },
                    ),
                  );
                  // showCustomBottomSheet(
                  //   context: context,
                  //   title: 'Image',
                  //   imageController: imageController,
                  //   smallImageController: smallImageController,
                  //   onPressed: () {
                  //     BlocProvider.of<ImageCubit>(context).getImages(
                  //       imageController.text,
                  //     );
                  //     Navigator.pop(context);
                  //     imageController.clear;
                  //     smallImageController.clear;
                  //   },
                  // );
                },
                child: Container(
                  width: 100,
                  padding: REdgeInsets.symmetric(vertical: 10),
                  color: AppColors.bgColorMain,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          height: 55,
                          width: 55,
                          child: const Center(
                            child: Icon(
                              Icons.camera_alt_rounded,
                              size: 30,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          'Add your photos',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                // child: Container(
                //   margin: REdgeInsets.only(right: 8),
                //   padding: REdgeInsets.all(16),
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.red,
                //   ),
                //   width: 150,
                //   child: Center(
                //     child: const Icon(
                //       Icons.add_a_photo,
                //       size: 30,
                //       color: AppColors.white,
                //     ),
                //   ),
                // ),
              ),
            );
          },
        ),
      ),
    );
  }
}

getImage() {}

buildImagesBottomSheet({
  required TextEditingController imageController,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: REdgeInsets.only(bottom: 30.0),
    child: Column(
      children: [
        CustomTextFormField(
          controller: imageController,
          keyboardType: TextInputType.text,
          sizedBoxHeight: 40.h,
          sizedBoxWidth: double.infinity,
          //sizedBoxWidth: 50,
          labelText: 'Enter image',
        ),
        30.verticalSpace,
        Padding(
          padding: REdgeInsets.all(16),
          child: CustomElevatedButton(
            sizedBoxHeight: 48.h,
            sizedBoxWidth: double.infinity,
            borderRadius: 30,
            bgColor: AppColors.mainColor,
            text: Text(
              'Ok',
              style: AppTextStyles.white14,
            ),
            onPressed: onPressed,
          ),
        ),
        15.verticalSpace,
      ],
    ),
    // child: Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Column(
    //       //mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         InkWell(
    //           onTap: () {},
    //           child: const Icon(
    //             Icons.folder_open_outlined,
    //             size: 55,
    //             color: AppColors.black,
    //           ),
    //         ),
    //         Text(
    //           'Gallery',
    //           style: TextStyle(
    //             color: AppColors.black,
    //             fontSize: 18.h,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ],
    //     ),
    //     50.horizontalSpace,
    //     Column(
    //       //mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         InkWell(
    //           onTap: () {},
    //           child: const Icon(
    //             Icons.camera_alt_outlined,
    //             size: 53,
    //             color: AppColors.black,
    //           ),
    //         ),
    //         Text(
    //           'Camera',
    //           style: TextStyle(
    //             color: AppColors.black,
    //             fontSize: 18.h,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  );
}

showCustomBottomSheet({
  required BuildContext context,
  required String title,
  required VoidCallback onPressed,
  required TextEditingController imageController,
  required TextEditingController smallImageController,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: 600.h, // 352
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: REdgeInsets.only(top: 36),
                  child: Text(
                    title,
                    style: AppTextStyles.black18Bold,
                  ),
                ),
              ),
              33.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.folder,
                          size: 70,
                          color: AppColors.red,
                        ),
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.camera_alt_rounded,
                          size: 70,
                          color: AppColors.red,
                        ),
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Padding(
              //   padding: REdgeInsets.symmetric(horizontal: 16),
              //   child: CustomTextFormField(
              //     controller: imageController,
              //     keyboardType: TextInputType.text,
              //     sizedBoxHeight: 40.h,
              //     sizedBoxWidth: MediaQuery.of(context).size.width,
              //     //sizedBoxWidth: 50,
              //     labelText: 'Enter image',
              //   ),
              // ),
              // 20.verticalSpace,
              // Padding(
              //   padding: REdgeInsets.symmetric(horizontal: 16),
              //   child: CustomTextFormField(
              //     controller: smallImageController,
              //     keyboardType: TextInputType.text,
              //     sizedBoxHeight: 40.h,
              //     sizedBoxWidth: MediaQuery.of(context).size.width,
              //     //sizedBoxWidth: 50,
              //     labelText: 'Enter small image',
              //   ),
              // ),
              30.verticalSpace,
              Padding(
                padding: REdgeInsets.all(16),
                child: CustomElevatedButton(
                  sizedBoxHeight: 48.h,
                  sizedBoxWidth: MediaQuery.of(context).size.width,
                  borderRadius: 30,
                  bgColor: AppColors.mainColor,
                  text: Text(
                    'Ok',
                    style: AppTextStyles.white14,
                  ),
                  onPressed: onPressed,
                ),
              ),
              15.verticalSpace,
            ],
          ),
        ),
      );
    },
  );
}
