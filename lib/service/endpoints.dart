class Endpoint {
  static const String _baseUrl = "https://api.github.com/"; //DEV
  static const String _user = "user";
  static const String _organization = "orgs";
  static const String _repo = "repos/";
  static const String _branches = "/branches";
  static const String _commits = "commits";

  static String get getOrganization => "$_baseUrl$_user/$_organization";

  static String get getUser => "$_baseUrl$_user";

  static String get getRepo => "$_baseUrl$_organization/";

  static String getBranches(String path) => "$_baseUrl$_repo$path$_branches";

  static String  getCommits(String path) => "$_baseUrl$_repo$path/$_commits";
}
