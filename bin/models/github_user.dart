class GitHubUser {
  late final int id;
  late final String username;
  late final String avatarUrl;
  late final String profileUrl;

  GitHubUser();

  GitHubUser.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    username = map['login'];
    avatarUrl = map['avatar_url'];
    profileUrl = map['html_url'];
  }

  @override
  String toString() {
    return '''
      \t---------------------------
      \t| id: $id
      \t| username: $username
      \t| avatarUrl: $avatarUrl
      \t| profileUrl: $profileUrl
      \t---------------------------
    ''';
  }
}
