class ChatModel {
  ChatModel({
    required this.name,
    required this.lastMessage,
    required this.unreadCount,
    required this.date,
  });
  final String name;
  final String lastMessage;
  final int unreadCount;
  final String date;
}

List<ChatModel> chatsList = [
  ChatModel(
    name: 'Dave Mpele',
    lastMessage: 'Hey there! Where are you',
    unreadCount: 2,
    date: 'Feb 05',
  ),
  ChatModel(
    name: 'Gods Time',
    lastMessage: 'How are you? We have Large systems today',
    unreadCount: 0,
    date: 'Feb 04',
  ),
  ChatModel(
    name: 'Xaveria',
    lastMessage: "Let's meet up! We have work",
    unreadCount: 1,
    date: 'Feb 03',
  ),
  ChatModel(
    name: 'Eng. Tanwi',
    lastMessage: 'Sure, You guys will have A grade!',
    unreadCount: 1,
    date: 'Feb 07',
  ),
  ChatModel(
    name: 'Xerxes Miang',
    lastMessage: 'You did a wonderful work kiddo!',
    unreadCount: 3,
    date: 'Jan 20',
  ),
  ChatModel(
    name: 'Damir Karz',
    lastMessage: 'You got it!',
    unreadCount: 3,
    date: 'Jan 20',
  ),
];
