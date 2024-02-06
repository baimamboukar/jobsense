// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  final String jobId; // Unique identifier for each job
  final String title;
  final String company;
  final String description;
  final String location;
  final Timestamp deadline;

  JobModel({
    required this.jobId,
    required this.title,
    required this.company,
    required this.description,
    required this.location,
    required this.deadline,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobId': jobId,
      'title': title,
      'company': company,
      'description': description,
      'location': location,
      'deadline': deadline,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      jobId: map['jobId'] as String,
      title: map['title'] as String,
      company: map['company'] as String,
      description: map['description'] as String,
      location: map['location'] as String,
      deadline: map['deadline'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
