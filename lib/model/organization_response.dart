// To parse this JSON data, do
//
//     final organizationResponse = organizationResponseFromJson(jsonString);

import 'dart:convert';

OrganizationResponse organizationResponseFromJson(String str) => OrganizationResponse.fromJson(json.decode(str));

String organizationResponseToJson(OrganizationResponse data) => json.encode(data.toJson());

class OrganizationResponse {
  String login;
  dynamic id;
  String nodeId;
  String url;
  String reposUrl;
  String eventsUrl;
  String hooksUrl;
  String issuesUrl;
  String membersUrl;
  String publicMembersUrl;
  String avatarUrl;
  String description;

  OrganizationResponse({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.url,
    required this.reposUrl,
    required this.eventsUrl,
    required this.hooksUrl,
    required this.issuesUrl,
    required this.membersUrl,
    required this.publicMembersUrl,
    required this.avatarUrl,
    required this.description,
  });

  factory OrganizationResponse.fromJson(Map<String, dynamic> json) => OrganizationResponse(
    login: json["login"]??"",
    id: json["id"],
    nodeId: json["node_id"]??"",
    url: json["url"]??"",
    reposUrl: json["repos_url"]??"",
    eventsUrl: json["events_url"]??"",
    hooksUrl: json["hooks_url"]??"",
    issuesUrl: json["issues_url"]??"",
    membersUrl: json["members_url"]??"",
    publicMembersUrl: json["public_members_url"]??"",
    avatarUrl: json["avatar_url"],
    description: json["description"]??"",
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "url": url,
    "repos_url": reposUrl,
    "events_url": eventsUrl,
    "hooks_url": hooksUrl,
    "issues_url": issuesUrl,
    "members_url": membersUrl,
    "public_members_url": publicMembersUrl,
    "avatar_url": avatarUrl,
    "description": description,
  };
}
