import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobsense/app/features/posts/data/models/post_model.dart';
import 'package:jobsense/app/features/posts/domain/repositories/post_repo.dart';

part 'posts_state.dart';
part 'post_event.dart';

class PostCubit extends Cubit<PostsState> {
  final PostService _postService = PostService();

  PostCubit() : super(PostInitial());

  Future<void> createPost(PostModel post) async {
    try {
      emit(PostLoading());
      await _postService.createPost(post);
      emit(PostSuccess(message: 'Post created successfully!'));
    } catch (e) {
      emit(PostError(error: 'Error creating post: $e'));
    }
  }

  Future<void> getPosts() async {
    try {
      emit(PostLoading());
      final posts = await _postService.getPosts();
      emit(PostListLoaded(posts: posts));
    } catch (e) {
      emit(PostError(error: 'Error fetching posts: $e'));
    }
  }
}
