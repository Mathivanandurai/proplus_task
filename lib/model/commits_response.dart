// To parse this JSON data, do
//
//     final commitsResponse = commitsResponseFromJson(jsonString);

import 'dart:convert';

List<CommitsResponse> commitsResponseFromJson(String str) =>
    List<CommitsResponse>.from(
        json.decode(str).map((x) => CommitsResponse.fromJson(x)));

String commitsResponseToJson(List<CommitsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommitsResponse {
  String url;
  String sha;
  Commit commit;
  CommitsResponseAuthor? author;
  CommitsResponseAuthor? committer;

  CommitsResponse({
    required this.url,
    required this.sha,
    required this.commit,
    required this.author,
    required this.committer,
  });

  factory CommitsResponse.fromJson(Map<String, dynamic> json) =>
      CommitsResponse(
        url: json["url"],
        sha: json["sha"],
        commit: Commit.fromJson(json["commit"]),
        author: json["author"] == null
            ? null
            : CommitsResponseAuthor.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : CommitsResponseAuthor.fromJson(json["committer"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "sha": sha,
        "commit": commit.toJson(),

      };
}

class CommitsResponseAuthor {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  CommitsResponseAuthor({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory CommitsResponseAuthor.fromJson(Map<String, dynamic> json) =>
      CommitsResponseAuthor(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}

class Commit {
  String url;
  CommitAuthor author;
  CommitAuthor committer;
  String message;
  Tree tree;
  int commentCount;
  Verification verification;

  Commit({
    required this.url,
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.commentCount,
    required this.verification,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        url: json["url"],
        author: CommitAuthor.fromJson(json["author"]),
        committer: CommitAuthor.fromJson(json["committer"]),
        message: json["message"],
        tree: Tree.fromJson(json["tree"]),
        commentCount: json["comment_count"],
        verification: Verification.fromJson(json["verification"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "author": author.toJson(),
        "committer": committer.toJson(),
        "message": message,
        "tree": tree.toJson(),
        "comment_count": commentCount,
        "verification": verification.toJson(),
      };
}

class CommitAuthor {
  String name;
  String email;
  DateTime date;

  CommitAuthor({
    required this.name,
    required this.email,
    required this.date,
  });

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "date": date.toIso8601String(),
      };
}

class Tree {
  String url;
  String sha;

  Tree({
    required this.url,
    required this.sha,
  });

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        url: json["url"],
        sha: json["sha"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "sha": sha,
      };
}

class Verification {
  bool verified;
  String reason;
  dynamic signature;
  dynamic payload;

  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json["verified"],
        reason: json["reason"],
        signature: json["signature"],
        payload: json["payload"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "reason": reason,
        "signature": signature,
        "payload": payload,
      };
}
