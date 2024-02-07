import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/features/auth/domain/models/chat_model.dart';

@RoutePage()
class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final chat in chatsList) _Chatile(chat: chat),
          ],
        ),
      ),
    );
  }
}

class _Chatile extends StatelessWidget {
  const _Chatile({
    required this.chat,
    super.key,
  });
  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: context.colorScheme.primary,
            child: Builder(
              builder: (context) {
                final initials = chat.name
                    .split(' ')
                    .map((word) => word.isNotEmpty ? word[0].toUpperCase() : '')
                    .join();
                return Text(initials);
              },
            ),
          ),
          title: Text(
            chat.name,
            style: context.bodyMd.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            chat.lastMessage,
            style: context.bodySm.copyWith(fontSize: 11),
          ),
          onTap: () {
            context.router.pushNamed('/message');
          },
          // trailing date and time
          trailing: Column(
            children: [
              Text(chat.date),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.colorScheme.error,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${chat.unreadCount}',
                  style: context.bodySm.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: .5,
        ),
      ],
    );
  }
}
