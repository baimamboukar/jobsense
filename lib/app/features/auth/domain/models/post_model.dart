class PostModel {
  PostModel({
    required this.name,
    required this.content,
    required this.time,
    required this.likesCount,
    required this.commentsCount,
    this.image,
  });
  final String name;
  final String content;
  final String time;
  final int likesCount;
  final String? image;
  final int commentsCount;
}

const url =
    'https://images.unsplash.com/photo-1508002366005-75a695ee2d17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1936&q=80';
List<PostModel> posts = [
  PostModel(
    name: 'Gods Time Emz',
    content:
        '''Hey! Iam looking for a job in the tech industry. I have 5 years of experience in web development and I am looking for a job in a startup. I am open to remote work as well. Please let me know if you have any leads. Thanks!''',
    time: 'Jan 03 at 07:20',
    likesCount: 15,
    commentsCount: 7,
  ),
  PostModel(
    name: 'Elsa Myra',
    content:
        '''Just finished reading a great book on artificial intelligence. Highly recommend it to anyone interested in the field! 📚 #AI #TechTalk''',
    time: 'Feb 07 at 07:54',
    likesCount: 30,
    image: url,
    commentsCount: 15,
  ),
  PostModel(
    name: 'Xerxes Hem',
    image: url,
    content:
        '''Hello Here! Looking for AI dev role. I have 3 years of experience in the field and I am looking for a job in a startup. I am open to remote work as well. Please let me know if you have any leads. Thanks!''',
    time: 'Jan 03 at 12:40',
    likesCount: 20,
    commentsCount: 10,
  ),
  PostModel(
    name: 'Dave Dada',
    content:
        '''Hey! Iam looking for a job in the tech industry. I have 5 years of experience in web development and I am looking for a job in a startup. I am open to remote work as well. Please let me know if you have any leads. Thanks!''',
    time: 'Jan 03 at 07:20',
    likesCount: 4,
    commentsCount: 1,
  ),
  PostModel(
    name: 'Boukar Dev Emz',
    content:
        '''Hey! Iam looking for a job in the tech industry. I have 5 years of experience in web development and I am looking for a job in a startup. I am open to remote work as well. Please let me know if you have any leads. Thanks!''',
    time: 'Jan 03 at 07:20',
    likesCount: 12,
    commentsCount: 0,
  ),
  PostModel(
    name: 'Kuwo Xaviera',
    image: url,
    content:
        '''Hey! Iam looking for a job in the tech industry. I have 5 years of experience in web development and I am looking for a job in a startup. I am open to remote work as well. Please let me know if you have any leads. Thanks!''',
    time: 'Jan 03 at 07:20',
    likesCount: 9,
    commentsCount: 2,
  ),
];
