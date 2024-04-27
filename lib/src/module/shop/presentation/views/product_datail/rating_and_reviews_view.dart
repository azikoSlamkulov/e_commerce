import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingAndReviewsView extends StatelessWidget {
  const RatingAndReviewsView({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReviewsBloc>(
      create: (context) => sl<ReviewsBloc>()
        ..add(GetAllReviewsEvent(productID: product.productID)),
      child: BlocListener<ReviewsBloc, ReviewsState>(
        listener: (context, state) {
          if (state is AddedReviewState) {
            AppSnackbar.showSnackbar(context: context, title: 'Добавлен.');
            BlocProvider.of<ReviewsBloc>(context).add(
              GetAllReviewsEvent(productID: product.productID),
            );
            Navigator.pop(context);
          }
        },
        // child: BlocBuilder<ReviewsBloc, ReviewsState>(
        //   builder: (context, state) {
        //     if (state is LoadingReviewsState) {
        //       return const Scaffold(
        //         backgroundColor: AppColors.white,
        //         body: Center(
        //           child: CircularProgressIndicator(),
        //         ),
        //       );
        //     } else if (state is LoadedReviewsState) {
        //       return NestedRatingAndReviewsView(
        //         allReviews: state.allReviews,
        //         product: product,
        //         //allNewProducts: allNewProducts,
        //       );
        //     } else {
        //       return const Center(child: Text('Login'));
        //     }
        //   },
        // ),
        child: BlocBuilder<ReviewsBloc, ReviewsState>(
          builder: (context, state) {
            if (state is LoadingReviewsState) {
              return const Scaffold(
                backgroundColor: AppColors.white,
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is LoadedReviewsState) {
              return NestedRatingAndReviewsView(
                allReviews: state.allReviews,
                product: product,
                // user: user,
                //allNewProducts: allNewProducts,
              );
            } else {
              return const Center(child: Text('Login'));
            }
          },
        ),
      ),
    );
  }
}

class NestedRatingAndReviewsView extends StatefulWidget {
  const NestedRatingAndReviewsView({
    required this.product,
    required this.allReviews,
    //required this.user,
    super.key,
  });

  final ProductEntity product;
  final List<ReviewEntity> allReviews;
  //final AuthUserEntity user;

  @override
  State<NestedRatingAndReviewsView> createState() =>
      _NestedRatingAndReviewsViewState();
}

class _NestedRatingAndReviewsViewState
    extends State<NestedRatingAndReviewsView> {
  bool isCheked = false;
  bool isWithPhoto = false;
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Stack(
    //     children: <Widget>[
    //       ListView.builder(
    //         //physics: const NeverScrollableScrollPhysics(),
    //         shrinkWrap: true,
    //         itemCount: 8,
    //         itemBuilder: (BuildContext context, int index) {
    //           return reviewText(isCheked);
    //         },
    //       ),
    //       bottomToggyEffect(context),
    //     ],
    //   ),
    // );
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
                      ? ratingContainer(widget.product.rating!)
                      : SizedBox(),
                  25.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.allReviews.length} reviews',
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
                    itemCount: widget.allReviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      final review = widget.allReviews[index];
                      return buildReviewText(
                        isCheked,
                        review,
                        widget.product.productID!,
                      );
                    },
                  ),
                  100.verticalSpace,
                ],
              ),
            ),
          ),
          bottomToggyEffect(context, textController, widget.product.productID!)
        ],
      ),
      floatingActionButton: myFloatingActionButton(
        context,
        textController,
        widget.product.productID!,
      ),
    );
  }
}

bottomToggyEffect(BuildContext context, textController, String id) {
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
  String id,
  //AuthUserEntity user,
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
      showCustomBottomSheet(context, textController, id);
    },
    icon: Icon(
      Icons.edit,
      size: 15.h,
    ),
    label: Text(
      'Write a review',
      style: AppTextStyles.white11,
    ),
  );
}

buildReviewText(
  bool isCheked,
  ReviewEntity review,
  String id,
) {
  return Stack(
    children: [
      Card(
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
                    'June 5, 2019',
                    style: AppTextStyles.grey11,
                  ),
                ],
              ),
              10.verticalSpace,
              Text(
                'The dress is great! Very classy and comfortable. It fit perfectly! I\'m 5\'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn\'t recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.',
                style: AppTextStyles.black14,
              ),
              20.verticalSpace,
              isCheked
                  ? SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: REdgeInsets.only(right: 8),
                            width: 100,
                            color: Colors.greenAccent,
                          );
                        },
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
                '${rating.totalRating}',
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
                  container1(114),
                  27.horizontalSpace,
                  Text(
                    '12',
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
                    '5',
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
                    '4',
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
                    '2',
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
                    '0',
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

showCustomBottomSheet(
  BuildContext context,
  TextEditingController textController,
  //List<bool> isSelected,
  String id,
  //AuthUserEntity user,
) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    backgroundColor: AppColors.bgColorMain,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
    ),
    builder: (BuildContext context) {
      return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthenticatedState) {
            final user = state.user;
            return SingleChildScrollView(
              child: SizedBox(
                height: 640.h,
                child: Padding(
                  padding: REdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: REdgeInsets.only(top: 36),
                          child: Text(
                            'What is you rate?',
                            style: AppTextStyles.black18Bold,
                          ),
                        ),
                      ),
                      22.verticalSpace,
                      RatingBarIndicator(
                        rating: 0,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        unratedColor: Colors.black12,
                        itemCount: 5,
                        itemSize: 60.0.h,
                        direction: Axis.horizontal,
                      ),
                      30.verticalSpace,
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
                      SizedBox(
                        height: 100.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: REdgeInsets.only(right: 8),
                              width: 100,
                              color: Colors.greenAccent,
                            );
                          },
                        ),
                      ),
                      20.verticalSpace,
                      Padding(
                        padding: REdgeInsets.all(16),
                        child: CustomButton(
                          onPressed: () {
                            BlocProvider.of<ReviewsBloc>(context).add(
                              SetReviewEvent(
                                  review: ReviewEntity(
                                productID: id,
                                userID: user.userID,
                                rate: 0,
                                reviewText: '',
                                userImg: user.photoURL,
                                userName: user.name,
                                imgUrlList: [],
                                //createdDate: '',
                              )),
                            );
                            //showBottomSheet(context, isSelected);
                          },
                          text: 'SEND REVIEW',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text('Login'));
          }
        },
      );
    },
  );
}
