import '../../../module/shop/data/model/model.dart';

class FakeProductRatingAndReviewsData {
  List<ProductRatingAndReviewsModel> allFakeRatingAndReviews = [
    const ProductRatingAndReviewsModel(
      productId: '0',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3.1,
        totalUser: 11,
      ),
      reviews: [
        ProductReviewModel(
          reviewId: '0',
          productId: '0',
          userId: 'YkPlvxEcC7QRB1EMBraToKCMykh2',
          rate: 3.0,
          reviewText:
              'The dress is great! Very classy and comfortable. It fit perfectly! I\'m 5\'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn\'t recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.',
          userPhotoUrl:
              'https://lh3.googleusercontent.com/a-/AFdZucrV69MKQhACRPRnlRFWa_dRpbzoS1ObxRLTHSHV=s96-c',
          userName: 'Azamat Slumkulov',
          imgUrlList: [
            'https://i.pinimg.com/236x/63/b2/82/63b2824753f907b2acbfdee108153654.jpg',
            'https://i.pinimg.com/236x/63/b2/82/63b2824753f907b2acbfdee108153654.jpg',
          ],
          createdDate: '2023-03-09 21:13:20.136108',
        ),
        ProductReviewModel(
          reviewId: '1',
          productId: '0',
          userId: 'YkPlvxEcC7QRB1EMBraToKCMykh2',
          rate: 4.0,
          reviewText:
              'The dress is great! Very classy and comfortable. It fit perfectly! I\'m 5\'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn\'t recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.',
          userPhotoUrl:
              'https://lh3.googleusercontent.com/a-/AFdZucrV69MKQhACRPRnlRFWa_dRpbzoS1ObxRLTHSHV=s96-c',
          userName: 'Azat Slumkulov',
          imgUrlList: [''],
          createdDate: '2023-03-09 21:13:20.136108',
        ),
      ],
    ),
  ];
}
