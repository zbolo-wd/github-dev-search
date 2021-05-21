import 'dart:convert';

import 'package:http/http.dart';

import 'models/github_user.dart';

/// GitHub API url.
const kGitHubApiUrl = 'https://api.github.com';

class GitHubApi {
  static Future<List<GitHubUser>> searchUsers(String keyword) async {
    final users = <GitHubUser>[];
    final client = Client();
    final url =
        '$kGitHubApiUrl/search/users?q=location:${Uri.encodeComponent(keyword)}';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw response.body;
    }

    final data = json.decode(response.body);
    for (Map<String, dynamic> map in data['items']) {
      users.add(GitHubUser.fromMap(map));
    }

    return users;
  }
}
