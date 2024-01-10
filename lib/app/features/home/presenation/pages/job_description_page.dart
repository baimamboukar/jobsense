import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobsense/app/features/home/data/models/job.dart';

@RoutePage()
class JobDescriptionPage extends StatefulWidget {
  const JobDescriptionPage({required this.job, super.key});
  final Job job;

  @override
  State<JobDescriptionPage> createState() => _JobDescriptionPageState();
}

class _JobDescriptionPageState extends State<JobDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
