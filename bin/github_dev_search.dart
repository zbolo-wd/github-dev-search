import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

import 'github_api.dart';
import 'models/exit_codes.dart';
import 'models/github_user.dart';

void main(List<String> arguments) async {
  exitCode = 0; // Presume success.

  final parser = ArgParser()..addFlag('location', negatable: false, abbr: 'l');

  final argResults = parser.parse(arguments);
  final location = (argResults.rest.isNotEmpty) ? argResults.rest[0] : '';

  if (!argResults['location'] || location.isEmpty) {
    _handleError(1);
    exit(exitCode);
  }

  try {
    final users = await GitHubApi.searchUsers(location);
    stdout.writeln('\nSearch results for location: $location');
    _printUsers(users);
  } catch (ex, stackTrace) {
    _handleError(2);
    stderr.write('$ex \n $stackTrace');
  }

  exit(exitCode);
}

void _printUsers(List<GitHubUser> users) {
  for (final user in users) {
    stdout.writeln('');
    stdout.writeln(user.toString());
  }
}

void _handleError(int errorCode) {
  exitCode = errorCode;
  stderr.writeln(ExitCodes.messages[errorCode] ?? ExitCodes.unknown);
}
