import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobsense/app/features/posts/data/models/post_model.dart';

class PostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPost(PostModel post) async {
    await _firestore.collection('posts').add(post.toMap());
  }

  Future<List<PostModel>> getPosts() async {
    final querySnapshot = await _firestore.collection('posts').get();

    return querySnapshot.docs
        .map((doc) => PostModel.fromMap(doc.data()))
        .toList();
  }
}
