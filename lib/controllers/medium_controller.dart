import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:viridis_web/widgets/blog_item.dart';

import '../utilities/constants.dart';

class MediumController extends GetxController {
  var blogsList = <BlogItem>[].obs;

  final String mediumBlogsUrl =
      'https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@refiprotocol';

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(mediumBlogsUrl));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var fetchedBlogs = data['items'] as List;

        blogsList.value = fetchedBlogs
            .map((item) => BlogItem(
                onTap: () => launchCustomURL(item['link']),
                path: extractSrc(item['description']),
                date: item['pubDate'],
                title: item['title'],
                data: extractFirstText(item['description'])))
            .toList();
        print('Data fetched successfully');
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  String extractSrc(String input) {
    final RegExp regExp = RegExp(r'src="(.*?)"');
    final match = regExp.firstMatch(input);
    if (match != null) {
      return match.group(1)!;
    }
    return '';
  }

  String extractFirstText(String input) {
    final RegExp regExp = RegExp(r'<p>(.*?)<\/p>');
    final match = regExp.firstMatch(input);
    if (match != null) {
      return match.group(1)!;
    }
    return '';
  }
}
