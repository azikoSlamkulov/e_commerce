import 'package:e_commerce/src/util/app_widgets/inputs/my%20search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomAppBar extends StatelessWidget {
  const AppCustomAppBar({
    super.key,
    required this.title,
    this.showSearchBtn = true,
  });

  final String title;
  final bool showSearchBtn;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 88.h,
      color: Colors.white,
      child: Padding(
        padding: REdgeInsets.only(top: 45, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.chevron_left_sharp,
                color: Colors.black,
                size: 35.h,
              ),
              onPressed: () {},
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            showSearchBtn
                ? IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 27.h,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: MySearchDelegate(),
                      );
                    },
                  )
                : SizedBox(
                    width: 50.h,
                  ),
          ],
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Brazil',
    'China',
    'USA',
  ];
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null); // colse searchbar
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null); // colse searchbar
          } else {
            query = ''; // clear searchbar
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}

// class AppBArWidget extends StatelessWidget {
//   const AppBArWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: IconButton(
//         icon: FaIcon(
//           FontAwesomeIcons.chevronLeft,
//           color: AppColors.white,
//           size: 20,
//         ),
//         onPressed: () => Navigator.of(context).pop(),
//       ),
//       elevation: 0,
//       backgroundColor: AppColors.bgColorBlue,
//       title: Text(
//         'Добавить водителя',
//         style: TextStyle(color: AppColors.white),
//         //style: AppTextStyles.mulishBlack18w600,
//       ),
//       centerTitle: true,
//       actions: [],
//     );
//   }
// }
