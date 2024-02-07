# Jobsense


![Built with Flutter](https://img.shields.io/badge/Built%20with-Flutter-blue)
![Built with Flutter](https://img.shields.io/badge/Built%20with-Firebase-gold)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![GitHub forks](https://img.shields.io/github/forks/baimamboukar/elite?style=social)
![GitHub stars](https://img.shields.io/github/stars/baimamboukar/elite?style=social)

# IMPLEMENTATION DETAILS: HOW TO RUN ?

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Jobsense works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```


# RUNNING
To run Jobsense in your local machine, follow these steps
- Fork and clone this respository into your local machine
- Get dependencies by running ```flutter pub get```
- Select your preferred device on which you want to run the app
- Run the app by executing ```flutter run```

# ARCHITECTURE AND STACK
BLoC(Business Logic Component) architecture, which allows to easily and efficiently separate data, domain and presentation layers, for better testability and maintenance.

- Frontend Mobile: **Flutter**
- Authentication: **Google Federated Indentify Platform**
- Analytics and BI: **Firebase Analytics**
- Storage: **Firebase Storage**
- Databse: **Google Cloud Firestore**

---
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
## Contributors
- Baimam Boukar
- Mpele David
- Kuwo Xaviera
- God's Time Chidiebere

---


---
