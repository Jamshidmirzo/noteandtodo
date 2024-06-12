import 'package:flutter/material.dart';
import 'package:bottom/models/course.dart';

class SearchViewDelegate extends SearchDelegate<String> {
  final Future<List<Course>> data;
  SearchViewDelegate(this.data);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(); // Implementation of results if needed
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error fetching data'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No courses available'));
        } else {
          final newdata = snapshot.data!;
          final suggestionList = query.isEmpty
              ? newdata
              : newdata.where((value) {
                  return value.title.toLowerCase().contains(query.toLowerCase());
                }).toList();

          return ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  close(context, suggestionList[index].title);
                },
                title: Text(suggestionList[index].title),
                subtitle: Text(suggestionList[index].price.toString()),
              );
            },
          );
        }
      },
    );
  }
}
