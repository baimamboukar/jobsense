// ignore_for_file: public_member_api_docs, sort_constructors_first
class Job {
  Job({
    required this.isSaved,
    required this.machesProfile,
    required this.title,
    required this.type,
    required this.company,
    required this.location,
    required this.description,
    required this.url,
    required this.companyLogo,
    required this.postedAt,
    required this.renumeration,
    required this.id,
    required this.applicantsCount,
  });

  final bool isSaved;
  final bool machesProfile;
  final String title;
  final String type;
  final String company;
  final Location location;
  final String description;
  final String url;
  final String companyLogo;
  final DateTime postedAt;
  final int renumeration;
  final int id;
  final int applicantsCount;
}

class JobDescription {
  final String about;
  final String responsibilities;
  final String qualifications;
  final String skills;
  final String benefits;
  JobDescription({
    required this.about,
    required this.responsibilities,
    required this.qualifications,
    required this.skills,
    required this.benefits,
  });
}

class Location {
  Location({required this.city, required this.state, required this.country});

  final String city;
  final String state;
  final String country;
}

final List<Job> jobs = [
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Software Engineer',
    type: 'Full-time',
    company: 'Tech Solutions Inc.',
    location: Location(city: 'San Francisco', state: 'CA', country: 'USA'),
    description:
        'Join our dynamic team and contribute to cutting-edge software projects.',
    url: 'https://example.com/job1',
    companyLogo: 'https://example.com/logo1.png',
    postedAt: DateTime.now().subtract(const Duration(days: 5)),
    renumeration: 90000,
    id: 1,
    applicantsCount: 120,
  ),
  Job(
    isSaved: true,
    machesProfile: true,
    title: 'Data Scientist',
    type: 'Remote',
    company: 'Data Insights Co.',
    location: Location(city: 'New York', state: 'NY', country: 'USA'),
    description:
        'Utilize your data analysis skills to extract meaningful insights from complex datasets.',
    url: 'https://example.com/job2',
    companyLogo: 'https://example.com/logo2.png',
    postedAt: DateTime.now().subtract(const Duration(days: 10)),
    renumeration: 95000,
    id: 2,
    applicantsCount: 80,
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Load Balance Engineer',
    type: 'Full-time',
    company: 'MTN Cameroon',
    location: Location(city: 'Yaounde', state: '', country: 'Cameroon'),
    description:
        'Exciting opportunity to manage and optimize network traffic through effective load balancing.',
    url: 'https://example.com/load-balance-engineer-job',
    companyLogo: 'https://example.com/mtn-logo.png',
    postedAt: DateTime.now(),
    renumeration: 120000,
    id: 3,
    applicantsCount: 30,
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Systems Administrator',
    type: 'Full-time',
    company: 'ST Digital',
    location: Location(city: 'Douala', state: 'Littoral', country: 'Cameroon'),
    description:
        'Join our IT team to ensure the stability and efficiency of our systems and networks.',
    url: 'https://example.com/systems-admin-job',
    companyLogo: 'https://example.com/stdigital-logo.png',
    postedAt: DateTime.now().subtract(const Duration(days: 7)),
    renumeration: 95000,
    id: 4,
    applicantsCount: 50,
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Backend Engineer',
    type: 'Full-time',
    company: 'Tech Innovators Nigeria',
    location: Location(city: 'Lagos', state: '', country: 'Nigeria'),
    description:
        'Contribute to the development of scalable and efficient backend systems for innovative projects.',
    url: 'https://example.com/backend-engineer-job',
    companyLogo: 'https://example.com/tech-innovators-logo.png',
    postedAt: DateTime.now().subtract(const Duration(days: 3)),
    renumeration: 110000,
    id: 5,
    applicantsCount: 40,
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'AWS Solutions Architect',
    type: 'Full-time',
    company: 'Cloud Dynamics South Africa',
    location:
        Location(city: 'Johannesburg', state: '', country: 'South Africa'),
    description:
        'Design and implement scalable and secure solutions on the AWS platform.',
    url: 'https://example.com/aws-solutions-architect-job',
    companyLogo: 'https://example.com/clouddynamics-logo.png',
    postedAt: DateTime.now().subtract(const Duration(days: 10)),
    renumeration: 130000,
    id: 6,
    applicantsCount: 25,
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Web Developer',
    type: 'Full-time',
    company: 'WebTech Kenya',
    location: Location(city: 'Nairobi', state: '', country: 'Kenya'),
    description:
        'Build modern and responsive web applications to enhance the online presence of our clients.',
    url: 'https://example.com/web-developer-job',
    companyLogo: 'https://example.com/webtech-logo.png',
    postedAt: DateTime.now().subtract(const Duration(days: 5)),
    renumeration: 100000,
    id: 7,
    applicantsCount: 35,
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Marketing Strategist',
    type: 'Full-time',
    company: 'Digital Dynamics Ghana',
    location: Location(city: 'Accra', state: '', country: 'Ghana'),
    description:
        'Develop and implement effective marketing strategies to promote our digital products and services.',
    url: 'https://example.com/marketing-strategist-job',
    companyLogo: 'https://example.com/digitaldynamics-logo.png',
    postedAt: DateTime.now().subtract(const Duration(days: 8)),
    renumeration: 90000,
    id: 8,
    applicantsCount: 20,
  ),
  Job(
    isSaved: false,
    machesProfile: true,
    title: 'Bitcoin Engineer',
    type: 'Full-time',
    company: 'Crypto Innovations Ethiopia',
    location: Location(city: 'Addis Ababa', state: '', country: 'Ethiopia'),
    description:
        'Contribute to the development of innovative solutions in the blockchain and cryptocurrency space.',
    url: 'https://example.com/bitcoin-engineer-job',
    companyLogo: 'https://example.com/cryptoinnovations-logo.png',
    postedAt: DateTime.now().subtract(const Duration(days: 12)),
    renumeration: 120000,
    id: 9,
    applicantsCount: 15,
  ),
];
