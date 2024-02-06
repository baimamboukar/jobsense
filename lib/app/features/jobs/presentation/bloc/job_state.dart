part of 'job_bloc.dart';

abstract class JobState extends Equatable {
  const JobState();

  @override
  List<Object?> get props => [];
}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobSuccess extends JobState {
  final String message;

  JobSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class JobListLoaded extends JobState {
  final List<JobModel> jobs;

  JobListLoaded({required this.jobs});

  @override
  List<Object?> get props => [jobs];
}

class CVListLoaded extends JobState {
  final List<String> cvs;

  CVListLoaded({required this.cvs});

  @override
  List<Object?> get props => [cvs];
}

class JobError extends JobState {
  final String error;

  JobError({required this.error});

  @override
  List<Object?> get props => [error];
}
