import 'package:flutter/material.dart';
import 'package:jobsense/app/extensions/numx.dart';
import 'package:jobsense/app/extensions/widgetx.dart';

class Socialize extends StatefulWidget {
  const Socialize({super.key});

  @override
  State<Socialize> createState() => _SocializeState();
}

class _SocializeState extends State<Socialize> {
  @override
  Widget build(BuildContext context) {
    final friendSuggestions = <String>[
      'Alice Aminatou',
      'Warem Anderson',
      'Charles Eke',
      'David Mepele',
      'Eva Gilbert',
      'Franklin Atangana',
      'Dina Amina',
      // Add more friend suggestions as needed
    ];

    return Column(
      children: [
        const Center(
          child: Text('Socialize'),
        ),
        34.vGap,
        for (final friend in friendSuggestions)
          ListTile(
            leading: CircleAvatar(
              // You can customize the avatar with profile pictures
              child: Text(friend[0]),
            ),
            title: Text(friend),
            subtitle: const Text(
              'Mutual friends: 5',
            ), // You can customize this part
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Add Friend'),
            ),
          ),
      ],
    ).hPadding;
  }
}
