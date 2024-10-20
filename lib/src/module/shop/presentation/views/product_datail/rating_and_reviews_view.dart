import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingAndReviewsView extends StatelessWidget {
  const RatingAndReviewsView({
    required this.currentUserId,
    required this.currentProductId,
    required this.currentProductRating,
    required this.currentProductReviews,
    Key? key,
  }) : super(key: key);

  final String currentUserId;
  final String currentProductId;
  final ProductRatingEntity currentProductRating;
  final List<ProductReviewEntity> currentProductReviews;

  //TODO Переделать BlocProvider.value. Без запуска на bootstrap

  @override
  Widget build(BuildContext context) {
    return BlocListener<RatingAndReviewsBloc, RatingAndReviewsState>(
      listener: (context, state) {
        if (state is AddedReviewState) {
          AppSnackbar.showSnackbar(context: context, title: 'Добавлен.');
          BlocProvider.of<RatingAndReviewsBloc>(context).add(
            GetRatingAndReviewsEvent(
              productID: currentProductId,
            ),
          );
          //Navigator.pop(context);
        }
      },
      child: BlocBuilder<RatingAndReviewsBloc, RatingAndReviewsState>(
        builder: (context, state) {
          if (state is LoadingRatingAndReviewsState) {
            return const LoadingWidget();
          } else if (state is LoadedRatingAndReviewsState) {
            return NestedRatingAndReviewsView(
              userId: currentUserId,
              productId: state.ratingAndReviews.productId!,
              productRating: state.ratingAndReviews.rating!,
              productReviews: state.ratingAndReviews.reviews!,
              // user: user,
              //allNewProducts: allNewProducts,
            );
          } else if (state is InitialRatingAndReviewsState) {
            return NestedRatingAndReviewsView(
              userId: currentUserId,
              productId: currentProductId,
              productRating: currentProductRating,
              productReviews: currentProductReviews,
            );
          }
          return const Center(child: Text('Some Error'));
        },
      ),
      // child: BlocProvider<RatingAndReviewsBloc>(
      //   create: (context) => sl<RatingAndReviewsBloc>(),
      //   // ..add(
      //   //   GetRatingAndReviewsEvent(
      //   //     productID: productId,
      //   //     //userID: user.userID!,
      //   //   ),
      //   // ),
      //   child: BlocBuilder<RatingAndReviewsBloc, RatingAndReviewsState>(
      //     builder: (context, state) {
      //       if (state is LoadingRatingAndReviewsState) {
      //         return const LoadingWidget();
      //       } else if (state is LoadedRatingAndReviewsState) {
      //         return NestedRatingAndReviewsView(
      //           userId: currentUserId,
      //           productId: state.ratingAndReviews.productId!,
      //           productRating: state.ratingAndReviews.rating!,
      //           productReviews: state.ratingAndReviews.reviews!,
      //           // user: user,
      //           //allNewProducts: allNewProducts,
      //         );
      //       } else if (state is InitialRatingAndReviewsState) {
      //         return NestedRatingAndReviewsView(
      //           userId: currentUserId,
      //           productId: currentProductId,
      //           productRating: currentProductRating,
      //           productReviews: currentProductReviews,
      //         );
      //       }
      //       return const Center(child: Text('Some Error'));
      //     },
      //   ),
      // ),
    );
  }
}

class NestedRatingAndReviewsView extends StatefulWidget {
  const NestedRatingAndReviewsView({
    required this.productId,
    // required this.ratingAndReviews,
    required this.userId,
    required this.productRating,
    required this.productReviews,
    super.key,
  });

  final String productId;
  // final ProductRatingAndReviewsEntity ratingAndReviews;
  final String userId;
  final ProductRatingEntity productRating;
  final List<ProductReviewEntity> productReviews;

  @override
  State<NestedRatingAndReviewsView> createState() =>
      _NestedRatingAndReviewsViewState();
}

class _NestedRatingAndReviewsViewState
    extends State<NestedRatingAndReviewsView> {
  bool isCheked = false;
  //bool isWithPhoto = false;
  List<ProductReviewEntity> reviewsList = [];
  TextEditingController textController = TextEditingController();

  // void getReviewsWithPhoto() {
  //   if (isCheked) {
  //     reviewsImgUrlList = widget.ratingAndReviews.reviews!
  //         .where((e) => e.imgUrlList!.first != '')
  //         .toList();
  //   } else {
  //     reviewsImgUrlList = widget.ratingAndReviews.reviews!
  //         .where((e) => e.imgUrlList!.first == '')
  //         .toList();
  //   }
  // }

  // void getReviewsWithPhoto() {
  //   if (isCheked) {
  //     reviewsList = widget.ratingAndReviews.reviews!
  //         .where((e) => e.imgUrlList!.isNotEmpty)
  //         .toList();
  //   } else {
  //     reviewsList = widget.ratingAndReviews.reviews!
  //         .where((e) => e.imgUrlList!.isEmpty)
  //         .toList();
  //   }
  // }
  void getReviewsWithPhoto() {
    if (isCheked) {
      reviewsList =
          widget.productReviews.where((e) => e.imgUrlList!.isNotEmpty).toList();
    } else {
      reviewsList =
          widget.productReviews.where((e) => e.imgUrlList!.isEmpty).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    log('totalUser ===>>>>>  ${widget.productRating.totalUser}');
    getReviewsWithPhoto();

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: isCheked
          ? CustomAppBar(
              title: 'Rating And Reviews',
              showSearchBtn: false,
            )
          : CustomAppBar(
              title: '',
              bgColor: AppColors.bgColorMain,
              showSearchBtn: false,
            ),
      body: Stack(
        children: [
          Padding(
            padding: REdgeInsets.only(left: 16, right: 31),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //41.verticalSpace,
                  !isCheked
                      ? ratingContainer(widget.productRating)
                      : const SizedBox(),
                  25.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${reviewsList.length} reviews',
                        style: AppTextStyles.black24Bold,
                      ),
                      //130.horizontalSpace,
                      Row(
                        children: [
                          Checkbox(
                            value: isCheked,
                            onChanged: (value) {
                              isCheked = !isCheked;
                              setState(() {});
                            },
                            activeColor: Colors.black,
                          ),
                          Text(
                            'With photo',
                            style: AppTextStyles.black14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: reviewsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final review = reviewsList[index];
                      return buildReviewCard(
                        isCheked,
                        review,
                        //widget.productId,
                      );
                    },
                  ),
                  100.verticalSpace,
                ],
              ),
            ),
          ),
          bottomToggyEffect(context, textController)
        ],
      ),
      floatingActionButton: myFloatingActionButton(
        context,
        textController,
        widget.productId,
        widget.userId,
      ),
    );
  }
}

bottomToggyEffect(
  BuildContext context,
  textController,
  //String id,
) {
  return Positioned(
    bottom: 0,
    top: MediaQuery.of(context).size.height / 1.4,
    width: MediaQuery.of(context).size.width,
    child: Container(
      padding: REdgeInsets.all(16),
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.white.withAlpha(0),
            Colors.white12,
            Colors.white70,
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      //child: myFloatingActionButton(context, textController, id),
    ),
  );
}

myFloatingActionButton(
  BuildContext context,
  textController,
  String productId,
  String user,
) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      // padding: EdgeInsets.symmetric(
      //     horizontal: paddingHorizontal, vertical: paddingVertical),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      //primary: bgColor,
      backgroundColor: AppColors.mainColor,
    ),
    onPressed: () {
      AppBottomSheet.showBottomSheet(
        context: context,
        title: 'What is you rate?',
        content: ratingAndReviewContent(
          context,
          textController,
          productId,
          user,
        ),
      );
      //showCustomBottomSheet(context, textController, productId);
    },
    icon: Icon(
      Icons.edit,
      size: 15.h,
      color: Colors.white,
    ),
    label: Text(
      'Write a review',
      style: AppTextStyles.white11,
    ),
  );
}

buildReviewCard(
  bool isCheked,
  ProductReviewEntity review,
  //String id,
) {
  return Stack(
    children: [
      Card(
        color: Colors.white,
        margin: REdgeInsets.only(top: 35, left: 15),
        child: Padding(
          padding: REdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${review.userName}',
                style: AppTextStyles.black14Bold,
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBarIndicator(
                    rating: review.rate!,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    unratedColor: Colors.black12,
                    itemCount: 5,
                    itemSize: 16.0.h,
                    direction: Axis.horizontal,
                  ),
                  Text(
                    DateTimeFormatter.dateTimeFormater(review.createdDate!),
                    style: AppTextStyles.grey11,
                  ),
                ],
              ),
              10.verticalSpace,
              Text(
                review.reviewText!,
                style: AppTextStyles.black14,
              ),
              20.verticalSpace,
              isCheked
                  ? SizedBox(
                      height: 100.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: review.imgUrlList!.length,
                        itemBuilder: (context, index) {
                          final imgUrl = review.imgUrlList![index];
                          return CachedNetworkImageWidget(
                            imageUrl: imgUrl,
                            borderRadius: BorderRadius.circular(1),
                            //height: 100,
                            width: 100,
                          );
                          // return Container(
                          //   margin: REdgeInsets.only(right: 8),
                          //   width: 100,
                          //   color: Colors.greenAccent,
                          // );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 13.h),
                      ),
                    )
                  : SizedBox(),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Helpful',
                    style: AppTextStyles.grey11,
                  ),
                  10.horizontalSpace,
                  Icon(
                    Icons.thumb_up,
                    size: 15.h,
                    color: AppColors.grey,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      Positioned(
        top: 15.h,
        //left: -5.h,
        child: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(review.userPhotoUrl!),
          // backgroundColor: Colors.red,
          // foregroundColor: Colors.green,
        ),
      ),
      // Positioned(
      //   //left: -10,
      //   top: 15.h,
      //   child: CircleProfileWidget(
      //     // imageUrl: user.photoURL ?? profileImageFile,
      //     imageUrl: '',
      //     //icon: FontAwesomeIcons.user,
      //     size: 16.h,
      //     isUpdate: false,
      //     onTap: () async {
      //       //await showBottomSheet(context);
      //     },
      //   ),
      // ),
    ],
  );
}

ratingContainer(ProductRatingEntity rating) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      10.verticalSpace,
      Text(
        'Rating&Reviews',
        style: AppTextStyles.black34Bold,
      ),
      41.verticalSpace,
      Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                rating.totalRating!.toStringAsFixed(1),
                //'${rating.totalRating}',
                style: AppTextStyles.black44Bold,
              ),
              10.verticalSpace,
              Text(
                '${rating.totalUser} ratings',
                style: AppTextStyles.grey14,
              ),
            ],
          ),
          //40.horizontalSpace,
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stars(0),
                  11.horizontalSpace,
                  container1(120),
                  27.horizontalSpace,
                  Text(
                    rating.five.toString(),
                    style: AppTextStyles.black14,
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  stars(1),
                  11.horizontalSpace,
                  container1(40),
                  105.horizontalSpace,
                  Text(
                    rating.four.toString(),
                    style: AppTextStyles.black14,
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  stars(2),
                  11.horizontalSpace,
                  container1(29),
                  115.horizontalSpace,
                  Text(
                    rating.three.toString(),
                    style: AppTextStyles.black14,
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  stars(3),
                  11.horizontalSpace,
                  container1(15),
                  130.horizontalSpace,
                  Text(
                    rating.two.toString(),
                    style: AppTextStyles.black14,
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  stars(4),
                  11.horizontalSpace,
                  container1(8),
                  135.horizontalSpace,
                  Text(
                    rating.one.toString(),
                    style: AppTextStyles.black14,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

stars(double rating) {
  return RatingBarIndicator(
    rating: rating,
    itemBuilder: (context, index) => const Icon(
      Icons.star,
      color: AppColors.bgColorMain,
    ),
    unratedColor: Colors.amber,
    itemCount: 5,
    itemSize: 16.0.h,
    direction: Axis.horizontal,
  );
}

container1(double width) {
  return Container(
    height: 8,
    width: width,
    //color: AppColors.mainColor,
    decoration: BoxDecoration(
      color: AppColors.mainColor,
      borderRadius: BorderRadius.circular(30.r),
    ),
  );
}

Widget ratingAndReviewContent(
  BuildContext context,
  TextEditingController textController,
  String productId,
  String userId,
) {
  List<String> imagesUrl = [];
  double rating = 0.0;
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      if (state is AuthenticatedState) {
        final user = state.user;
        return Column(
          children: [
            /// Rating Bar Indicator
            //22.verticalSpace,
            AppRatingBarBuilder(
              //product: product,
              itemSize: 60.0.h,
              callback: (value) => rating = value,
            ),
            // RatingBarIndicator(
            //   rating: 0,
            //   itemBuilder: (context, index) => const Icon(
            //     Icons.star,
            //     color: Colors.amber,
            //   ),
            //   unratedColor: Colors.black12,
            //   itemCount: 5,
            //   itemSize: 60.0.h,
            //   direction: Axis.horizontal,
            // ),
            35.verticalSpace,
            Text(
              'Please share your opinion about the product',
              style: AppTextStyles.black18Bold,
            ),
            30.verticalSpace,
            // SizedBox(
            //   height: 154,
            //   child: TextFormField(
            //     keyboardType: TextInputType.multiline,
            //     maxLines: null,
            //     decoration: InputDecoration(
            //       fillColor: Colors.white,
            //     ),
            //   ),
            // ),
            CustomTextFormField(
              controller: textController,
              sizedBoxHeight: 154.h,
              //sizedBoxWidth: MediaQuery.of(context).size.width,
              keyboardType: TextInputType.multiline,
              labelText: 'Your review',
              fillColor: Colors.white,
              maxLines: 10,
            ),
            30.verticalSpace,

            /// Images
            AppAddImagesWidget(
              callback: (value) {
                final imageUrl = value;
                imagesUrl.add(imageUrl);
              },
            ),
            // SizedBox(
            //   height: 100.h,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 8,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         margin: REdgeInsets.only(right: 8),
            //         width: 100,
            //         color: Colors.greenAccent,
            //       );
            //     },
            //   ),
            // ),

            /// Button
            20.verticalSpace,
            Padding(
              padding: REdgeInsets.all(16),
              child: CustomButton(
                onPressed: () {
                  if (rating != 0.0) {
                    BlocProvider.of<RatingAndReviewsBloc>(context).add(
                      SetRatingAndReviewsEvent(
                        productId: productId,
                        rating: rating.toInt(),
                        review: textController.text.isNotEmpty
                            ? ProductReviewEntity(
                                rate: 4,
                                productId: productId,
                                userId: userId,
                                reviewText: textController.text,
                                userPhotoUrl: user.photoURL,
                                userName: user.name,
                                imgUrlList: imagesUrl,
                              )
                            : const ProductReviewEntity(),
                      ),
                    );
                    rating = 0.0;
                    textController.clear();
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                    AppSnackbar.showSnackbar(
                      context: context,
                      isError: true,
                      title: 'Поля рейтинга должен быть заполнен!',
                    );
                  }
                },
                text: 'SEND REVIEW',
              ),
            ),
            20.verticalSpace,
          ],
        );
      } else {
        return const Center(child: Text('Login'));
      }
    },
  );
}
