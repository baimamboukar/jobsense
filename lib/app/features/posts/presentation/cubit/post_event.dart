part of 'posts_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class CreatePostEvent extends PostEvent {
  final PostModel post;

  CreatePostEvent({required this.post});

  @override
  List<Object?> get props => [post];
}

class GetPostsEvent extends PostEvent {}
