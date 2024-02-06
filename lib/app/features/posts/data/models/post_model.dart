// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class LikeModel {
  final String userId;
  final Timestamp timestamp;

  LikeModel({
    required this.userId,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'timestamp': timestamp,
    };
  }

  factory LikeModel.fromMap(Map<String, dynamic> map) {
    return LikeModel(
      userId: map['userId'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory LikeModel.fromJson(String source) =>
      LikeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CommentModel {
  final String userId;
  final String text;
  final Timestamp timestamp;

  CommentModel({
    required this.userId,
    required this.text,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'text': text,
      'timestamp': timestamp,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      userId: map['userId'] as String,
      text: map['text'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PostModel {
  final String postId; // Unique identifier for each post
  final String content;
  final String userId;
  final Timestamp timestamp;
  final List<LikeModel> likes;
  final List<CommentModel> comments;

  PostModel({
    required this.postId,
    required this.content,
    required this.userId,
    required this.timestamp,
    required this.likes,
    required this.comments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'content': content,
      'userId': userId,
      'timestamp': timestamp,
      'likes': likes.map((x) => x.toMap()).toList(),
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postId: map['postId'] as String,
      content: map['content'] as String,
      userId: map['userId'] as String,
      timestamp: map['timestamp'] as Timestamp,
      likes: List<LikeModel>.from(
        (map['likes'] as List<int>).map<LikeModel>(
          (x) => LikeModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      comments: List<CommentModel>.from(
        (map['comments'] as List<int>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
