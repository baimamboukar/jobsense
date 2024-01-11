// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:jobsense/src/app/assets.dart';

class Job {
  Job({
    required this.isSaved,
    required this.machesProfile,
    required this.title,
    required this.type,
    required this.company,
    required this.location,
    required this.summary,
    required this.companyLogo,
    required this.postedAt,
    required this.renumeration,
    required this.id,
    required this.applicantsCount,
    required this.tags,
    required this.description,
  });

  final bool isSaved;
  final bool machesProfile;
  final String title;
  final String type;
  final String company;
  final Location location;
  final String summary;
  final String companyLogo;
  final DateTime postedAt;
  final int renumeration;
  final int id;
  final int applicantsCount;
  final List<String> tags;
  final JobDescription description;
}

class JobDescription {
  final String about;
  final String overview;
  final List<String> responsibilities;
  final List<String> qualifications;
  final List<String> benefits;
  JobDescription({
    required this.overview,
    required this.about,
    required this.responsibilities,
    required this.qualifications,
    required this.benefits,
  });
}

class Location {
  Location({required this.city, required this.state, required this.country});

  final String city;
  final String state;
  final String country;
}

const about =
    '''Enchirch Technologies is a cutting-edge technology company dedicated to transforming the landscape of DevOps and UX Engineering. We are passionate about creating innovative solutions that empower businesses to thrive in the digital era. Our team is composed of talented individuals who are committed to excellence and pushing the boundaries of technology.''';
const summary =
    '''We are seeking a talented and motivated Software Engineer to join our growing team at Enchirch Technologies. As a Software Engineer, you will play a crucial role in designing, developing, and maintaining software applications that align with our DevOps and UX Engineering focus. This is an excellent opportunity to work on exciting projects, collaborate with cross-functional teams, and contribute to the success of our company.''';

final benefits = [
  'Competitive salary',
  'Health, dental, and vision insurance',
  '401(k) retirement plan',
  'Flexible work schedule',
  'Professional development opportunities',
  'Company events and team-building activities',
];

final qualifs = [
  "Bachelor's degree in Computer Science, Software Engineering, or a related field.",
  'Proven experience as a Software Engineer with a focus on DevOps and UX Engineering.',
  'Strong proficiency in relevant programming languages, frameworks, and tools.',
  'Solid understanding of software development principles and best practices.',
  'Experience with DevOps processes, including CI/CD pipelines and automation tools.',
  'Knowledge of UX design principles and tools.',
  'Excellent problem-solving and analytical skills.',
  'Effective communication and collaboration abilities.',
];

final responsibilities = [
  'Design, develop, and maintain high-quality software solutions.',
  'Collaborate with cross-functional teams to understand project requirements and specifications.',
  'Write clean, efficient, and well-documented code using established coding standards.',
  'Debug and resolve software defects and issues in a timely manner.',
  'Participate in Agile or Scrum development processes, including sprint planning, stand-ups, and retrospectives.',
  'Contribute to the development and maintenance of technical documentation.',
];

final List<Job> jobs = [
  Job(
    isSaved: false,
    machesProfile: false,
    title: 'Software Engineer',
    type: 'Full-time',
    company: 'MTN Cameroon',
    location: Location(city: 'Yaounde', state: 'Center', country: 'Cameroon'),
    summary:
        'Exciting opportunity to contribute to cutting-edge software projects at MTN Cameroon.',
    companyLogo: Assets.assetsImagesMtn,
    postedAt: DateTime.now().subtract(const Duration(days: 3)),
    renumeration: 110000,
    id: 10,
    applicantsCount: 80,
    tags: ['Java', 'Spring', 'Agile'],
    description: JobDescription(
      about: about,
      overview: summary,
      responsibilities: responsibilities,
      qualifications: qualifs,
      benefits: benefits,
    ),
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Cloud Network Engineer',
    type: 'Full-time',
    company: 'Orange Cameroon',
    location: Location(city: 'Douala', state: 'Littoral', country: 'Cameroon'),
    summary:
        'Join Orange Cameroon and contribute to the optimization and management of our network infrastructure.',
    companyLogo: Assets.assetsImagesOrange,
    postedAt: DateTime.now().subtract(const Duration(days: 7)),
    renumeration: 95000,
    id: 11,
    applicantsCount: 50,
    tags: ['Networking', 'Cisco', 'Telecoms'],
    description: JobDescription(
      about: about,
      overview: summary,
      responsibilities: responsibilities,
      qualifications: qualifs,
      benefits: benefits,
    ),
  ),
  Job(
    isSaved: false,
    machesProfile: false,
    title: 'IT Specialist',
    type: 'Full-time',
    company: 'UBA Cameroon',
    location: Location(city: 'Yaounde', state: '', country: 'Cameroon'),
    summary:
        'Exciting opportunity to join UBA Cameroon as an IT Specialist and contribute to our technological advancements.',
    companyLogo: Assets.assetsImagesUba,
    postedAt: DateTime.now().subtract(const Duration(days: 5)),
    renumeration: 105000,
    id: 12,
    applicantsCount: 60,
    tags: ['IT Support', 'Networking', 'Security'],
    description: JobDescription(
      about: about,
      overview: summary,
      responsibilities: responsibilities,
      qualifications: qualifs,
      benefits: benefits,
    ),
  ),
  Job(
    isSaved: false,
    machesProfile: false,
    title: 'Marketing Manager',
    type: 'Full-time',
    company: 'Nexttel Cameroon',
    location: Location(city: 'Douala', state: 'Littoral', country: 'Cameroon'),
    summary:
        'Lead the marketing efforts at Nexttel Cameroon and drive our brand to new heights.',
    companyLogo: Assets.assetsImagesNexttel,
    postedAt: DateTime.now().subtract(const Duration(days: 8)),
    renumeration: 98000,
    id: 13,
    applicantsCount: 45,
    tags: ['Marketing', 'Management', 'Prospecting'],
    description: JobDescription(
      about: about,
      overview: summary,
      responsibilities: responsibilities,
      qualifications: qualifs,
      benefits: benefits,
    ),
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Mobile Engineer',
    type: 'Full-time',
    company: 'SABC Cameroon',
    location: Location(city: 'Douala', state: 'Littoral', country: 'Cameroon'),
    summary:
        'Manage financial operations at Standard Chartered Bank Cameroon and contribute to our financial success.',
    companyLogo: Assets.assetsImagesSabc,
    postedAt: DateTime.now().subtract(const Duration(days: 9)),
    renumeration: 120000,
    id: 15,
    applicantsCount: 55,
    tags: ['Flutter', 'Mobile', 'UX Design'],
    description: JobDescription(
      about: about,
      overview: summary,
      responsibilities: responsibilities,
      qualifications: qualifs,
      benefits: benefits,
    ),
  ),
  Job(
    isSaved: true,
    machesProfile: true,
    title: 'Customer Service Specialist',
    type: 'Full-time',
    company: 'Blue x CAMTEL',
    location: Location(city: 'Yaounde', state: 'Center', country: 'Cameroon'),
    summary:
        'Join CAMTEL as a Customer Service Representative and help us provide exceptional service to our clients.',
    companyLogo: Assets.assetsImagesBlue,
    postedAt: DateTime.now().subtract(const Duration(days: 6)),
    renumeration: 95000,
    id: 14,
    applicantsCount: 40,
    tags: ['Support', 'Communication', 'Engagement'],
    description: JobDescription(
      about: about,
      overview: summary,
      responsibilities: responsibilities,
      qualifications: qualifs,
      benefits: benefits,
    ),
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Finance Manager',
    type: 'Full-time',
    company: 'UBA Cameroon',
    location: Location(city: 'Douala', state: 'Littoral', country: 'Cameroon'),
    summary:
        'Manage financial operations at Standard Chartered Bank Cameroon and contribute to our financial success.',
    companyLogo: Assets.assetsImagesUba,
    postedAt: DateTime.now().subtract(const Duration(days: 9)),
    renumeration: 120000,
    id: 15,
    applicantsCount: 55,
    tags: ['Finance', 'Accounting', 'Planning'],
    description: JobDescription(
      about: about,
      overview: summary,
      responsibilities: responsibilities,
      qualifications: qualifs,
      benefits: benefits,
    ),
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Senior UX Designer',
    type: 'Full-time',
    company: 'Enchird Technologies',
    location: Location(city: 'Yaounde', state: 'Center', country: 'Cameroon'),
    summary:
        'Manage financial operations at Standard Chartered Bank Cameroon and contribute to our financial success.',
    companyLogo: Assets.assetsImagesEnchird,
    postedAt: DateTime.now().subtract(const Duration(days: 9)),
    renumeration: 120000,
    id: 15,
    applicantsCount: 55,
    tags: ['Figma', 'UX Design', 'Research'],
    description: JobDescription(
      about: about,
      overview: summary,
      responsibilities: responsibilities,
      qualifications: qualifs,
      benefits: benefits,
    ),
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Azure DevOps Engineer',
    type: 'Full-time',
    company: 'Caasitech Group LLC',
    location: Location(city: 'Yaounde', state: 'Center', country: 'Cameroon'),
    summary:
        'Manage financial operations at Standard Chartered Bank Cameroon and contribute to our financial success.',
    companyLogo: Assets.assetsImagesCaasitech,
    postedAt: DateTime.now().subtract(const Duration(days: 9)),
    renumeration: 120000,
    id: 15,
    applicantsCount: 55,
    tags: ['Azure', 'DevOps', 'CI/CD'],
    description: JobDescription(
      about: about,
      overview: summary,
      responsibilities: responsibilities,
      qualifications: qualifs,
      benefits: benefits,
    ),
  ),
];
