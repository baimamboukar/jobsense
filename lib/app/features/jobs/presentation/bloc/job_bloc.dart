import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsense/app/features/jobs/domain/job_model.dart';
import 'package:jobsense/app/features/jobs/domain/job_repository.dart';

part 'job_state.dart';
part 'job_event.dart';

class JobCubit extends Cubit<JobState> {
  final JobService _jobService = JobService();

  JobCubit() : super(JobInitial());

  Future<void> createJob(JobModel job) async {
    try {
      emit(JobLoading());
      await _jobService.createJob(job);
      emit(JobSuccess(message: 'Job created successfully!'));
    } catch (e) {
      emit(JobError(error: 'Error creating job: $e'));
    }
  }

  Future<void> getJobs() async {
    try {
      emit(JobLoading());
      final jobs = await _jobService.getJobs();
      emit(JobListLoaded(jobs: jobs));
    } catch (e) {
      emit(JobError(error: 'Error fetching jobs: $e'));
    }
  }

  Future<void> applyForJob(String userId, String jobId, String cvFilePath) async {
    try {
      emit(JobLoading());
      await _jobService.applyForJob(userId, jobId, cvFilePath);
      emit(JobSuccess(message: 'Application submitted successfully!'));
    } catch (e) {
      emit(JobError(error: 'Error applying for job: $e'));
    }
  }

  Future<void> getCVs(String userId) async {
    try {
      emit(JobLoading());
      final cvs = await _jobService.getCVs(userId);
      emit(CVListLoaded(cvs: cvs));
    } catch (e) {
      emit(JobError(error: 'Error fetching CVs: $e'));
    }
  }
}
