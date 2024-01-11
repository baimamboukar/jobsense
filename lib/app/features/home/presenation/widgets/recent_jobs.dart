import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/extensions/numx.dart';
import 'package:jobsense/app/features/home/data/models/job.dart';

class RecentJobs extends StatelessWidget {
  const RecentJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Jobs',
              style: context.typography.bodyLarge,
            ),
            Row(
              children: [
                Text(
                  'See all',
                  style: context.typography.bodyMedium,
                ),
                HeroIcon(
                  HeroIcons.chevronRight,
                  color: context.colorScheme.onBackground,
                  size: 14,
                ),
              ],
            ),
          ],
        ),
        8.vGap,
        Container(
          width: context.width,
          decoration: BoxDecoration(
            color: context.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: ListTile.divideTiles(
                context: context,

                //  color: context.colorScheme.onBackground,
                tiles: [
                  ...jobs.take(8).map(
                        (job) => _JobTile(job: job),
                      ),
                ],
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _JobTile extends StatelessWidget {
  const _JobTile({required this.job});
  final Job job;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          job.companyLogo,
          height: 38,
          width: 38,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(job.title, style: context.typography.labelLarge),
      subtitle: Text(
        '${job.location.city}• ${job.location.country}',
        style: context.typography.labelSmall,
      ),
      trailing: Text(
        job.renumeration.currencyFormat,
        style: context.typography.labelSmall,
      ),
    );
  }
}
