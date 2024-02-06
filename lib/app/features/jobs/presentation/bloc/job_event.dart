part of 'job_bloc.dart';

abstract class JobEvent extends Equatable {
  const JobEvent();

  @override
  List<Object?> get props => [];
}

class CreateJobEvent extends JobEvent {
  final JobModel job;

  CreateJobEvent({required this.job});

  @override
  List<Object?> get props => [job];
}

class GetJobsEvent extends JobEvent {}

class ApplyForJobEvent extends JobEvent {
  final String userId;
  final String jobId;
  final String cvFilePath;

  ApplyForJobEvent({required this.userId, required this.jobId, required this.cvFilePath});

  @override
  List<Object?> get props => [userId, jobId, cvFilePath];
}

class GetCVsEvent extends JobEvent {
  final String userId;

  GetCVsEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}
