// To parse this JSON data, do
//
//     final repositoryResponse = repositoryResponseFromJson(jsonString);

import 'dart:convert';

List<RepositoryResponse> repositoryResponseFromJson(String str) =>
    List<RepositoryResponse>.from(
        json.decode(str).map((x) => RepositoryResponse.fromJson(x)));

class RepositoryResponse {
  int id;
  String name;
  String fullName;
  Owner owner;
  DateTime updatedAt;

  RepositoryResponse(
      {required this.id,
      required this.name,
      required this.fullName,
      required this.owner,
      required this.updatedAt});

  factory RepositoryResponse.fromJson(Map<String, dynamic> json) =>
      RepositoryResponse(
        id: json["id"]??"",
        name: json["name"]??"",
        fullName: json["full_name"]??"",
        owner: Owner.fromJson(json["owner"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

enum DefaultBranch { MAIN, MASTER, RAILS_32 }

final defaultBranchValues = EnumValues({
  "main": DefaultBranch.MAIN,
  "master": DefaultBranch.MASTER,
  "rails-3.2": DefaultBranch.RAILS_32
});

enum Language { JAVA_SCRIPT, RUBY }

final languageValues =
    EnumValues({"JavaScript": Language.JAVA_SCRIPT, "Ruby": Language.RUBY});

class License {
  Key key;
  Name name;
  SpdxId spdxId;
  String? url;
  LicenseNodeId nodeId;

  License({
    required this.key,
    required this.name,
    required this.spdxId,
    required this.url,
    required this.nodeId,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
        key: keyValues.map[json["key"]]!,
        name: nameValues.map[json["name"]]!,
        spdxId: spdxIdValues.map[json["spdx_id"]]!,
        url: json["url"],
        nodeId: licenseNodeIdValues.map[json["node_id"]]!,
      );

  Map<String, dynamic> toJson() => {
        "key": keyValues.reverse[key],
        "name": nameValues.reverse[name],
        "spdx_id": spdxIdValues.reverse[spdxId],
        "url": url,
        "node_id": licenseNodeIdValues.reverse[nodeId],
      };
}

enum Key { MIT, OTHER }

final keyValues = EnumValues({"mit": Key.MIT, "other": Key.OTHER});

enum Name { MIT_LICENSE, OTHER }

final nameValues =
    EnumValues({"MIT License": Name.MIT_LICENSE, "Other": Name.OTHER});

enum LicenseNodeId { M_DC6_T_GLJ_ZW5_Z_ZTA, M_DC6_T_GLJ_ZW5_Z_ZT_EZ }

final licenseNodeIdValues = EnumValues({
  "MDc6TGljZW5zZTA=": LicenseNodeId.M_DC6_T_GLJ_ZW5_Z_ZTA,
  "MDc6TGljZW5zZTEz": LicenseNodeId.M_DC6_T_GLJ_ZW5_Z_ZT_EZ
});

enum SpdxId { MIT, NOASSERTION }

final spdxIdValues =
    EnumValues({"MIT": SpdxId.MIT, "NOASSERTION": SpdxId.NOASSERTION});

class Owner {
  String login;
  int id;
  String avatarUrl;

  Owner({
    required this.login,
    required this.id,
    required this.avatarUrl,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"] ?? "",
        id: json["id"] ?? "",
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar_url": avatarUrl,
      };
}

enum EventsUrl { HTTPS_API_GITHUB_COM_USERS_COLLECTIVEIDEA_EVENTS_PRIVACY }

final eventsUrlValues = EnumValues({
  "https://api.github.com/users/collectiveidea/events{/privacy}":
      EventsUrl.HTTPS_API_GITHUB_COM_USERS_COLLECTIVEIDEA_EVENTS_PRIVACY
});

enum GistsUrl { HTTPS_API_GITHUB_COM_USERS_COLLECTIVEIDEA_GISTS_GIST_ID }

class Permissions {
  bool admin;
  bool maintain;
  bool push;
  bool triage;
  bool pull;

  Permissions({
    required this.admin,
    required this.maintain,
    required this.push,
    required this.triage,
    required this.pull,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        admin: json["admin"],
        maintain: json["maintain"],
        push: json["push"],
        triage: json["triage"],
        pull: json["pull"],
      );

  Map<String, dynamic> toJson() => {
        "admin": admin,
        "maintain": maintain,
        "push": push,
        "triage": triage,
        "pull": pull,
      };
}

enum Visibility { PUBLIC }

final visibilityValues = EnumValues({"public": Visibility.PUBLIC});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
