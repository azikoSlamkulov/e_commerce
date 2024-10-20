import 'dart:developer';

import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({required this.searchList});

  final List<String> searchList;

  // Фиктивный список
  // final List<String> searchList = [
  //   "Apple",
  //   "Banana",
  //   "Cherry",
  //   "Date",
  //   "Fig",
  //   "Grapes",
  //   "Kiwi",
  //   "Lemon",
  //   "Mango",
  //   "Orange",
  //   "Papaya",
  //   "Raspberry",
  //   "Strawberry",
  //   "Tomato",
  //   "Watermelon",
  // ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Создаем кнопку очистки.
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          // При нажатии здесь запрос будет удален из строки поиска.
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Создаем ведущий значок.
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Выход из экрана поиска.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Создаем результаты поиска.
    //throw UnimplementedError();
    final List<String> searchResults = searchList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            // Обрабатываем выбранный результат поиска.
            log('query ===>>> 1');
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Создаем поисковые предложения.
    //throw UnimplementedError();
    final List<String> suggestionList = query.isEmpty
        ? []
        : searchList
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            log('query ===>>> 2');
            // Показать результаты поиска на основе выбранного предложения.
          },
        );
      },
    );
  }
}
