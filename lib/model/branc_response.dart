// To parse this JSON data, do
//
//     final branchResponse = branchResponseFromJson(jsonString);

import 'dart:convert';

List<BranchResponse> branchResponseFromJson(String str) =>
    List<BranchResponse>.from(
        json.decode(str).map((x) => BranchResponse.fromJson(x)));

String branchResponseToJson(List<BranchResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BranchResponse {
  String name;
  Commit commit;
  bool protected;

  BranchResponse({
    required this.name,
    required this.commit,
    required this.protected,
  });

  factory BranchResponse.fromJson(Map<String, dynamic> json) => BranchResponse(
        name: json["name"] ?? "",
        commit: Commit.fromJson(json["commit"]),
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "commit": commit.toJson(),
        "protected": protected,
      };
}

class Commit {
  String sha;
  String url;

  Commit({
    required this.sha,
    required this.url,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        sha: json["sha"] ?? "",
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
      };
}

class Protection {
  RequiredStatusChecks requiredStatusChecks;

  Protection({
    required this.requiredStatusChecks,
  });

  factory Protection.fromJson(Map<String, dynamic> json) => Protection(
        requiredStatusChecks:
            RequiredStatusChecks.fromJson(json["required_status_checks"]),
      );

  Map<String, dynamic> toJson() => {
        "required_status_checks": requiredStatusChecks.toJson(),
      };
}

class RequiredStatusChecks {
  String enforcementLevel;
  List<String> contexts;

  RequiredStatusChecks({
    required this.enforcementLevel,
    required this.contexts,
  });

  factory RequiredStatusChecks.fromJson(Map<String, dynamic> json) =>
      RequiredStatusChecks(
        enforcementLevel: json["enforcement_level"],
        contexts: List<String>.from(json["contexts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "enforcement_level": enforcementLevel,
        "contexts": List<dynamic>.from(contexts.map((x) => x)),
      };
}
