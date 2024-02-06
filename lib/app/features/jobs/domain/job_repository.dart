import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jobsense/app/features/jobs/domain/job_model.dart';

class JobService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> createJob(JobModel job) async {
    await _firestore.collection('jobs').add(job.toMap());
  }

  Future<List<JobModel>> getJobs() async {
    final querySnapshot = await _firestore.collection('jobs').get();

    return querySnapshot.docs
        .map((doc) => JobModel.fromMap(doc.data()))
        .toList();
  }

  Future<void> applyForJob(
      String userId, String jobId, String cvFilePath) async {
    final storageReference = _storage.ref().child('cvs/$userId/$jobId.pdf');
    final cvFile = File(cvFilePath);

    await storageReference.putFile(cvFile);

    final cvDownloadUrl = await storageReference.getDownloadURL();

    await _firestore.collection('applications').doc('$userId-$jobId').set({
      'userId': userId,
      'jobId': jobId,
      'cvUrl': cvDownloadUrl,
      'timestamp': Timestamp.now(),
    });
  }

  Future<List<String>> getCVs(String userId) async {
    final querySnapshot = await _firestore
        .collection('applications')
        .where('userId', isEqualTo: userId)
        .get();

    return querySnapshot.docs.map((doc) => doc['cvUrl'] as String).toList();
  }
}
