part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

class PostInitial extends PostsState {}

class PostLoading extends PostsState {}

class PostSuccess extends PostsState {
  final String message;

  PostSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class PostListLoaded extends PostsState {
  final List<PostModel> posts;

  PostListLoaded({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class PostError extends PostsState {
  final String error;

  PostError({required this.error});

  @override
  List<Object?> get props => [error];
}
