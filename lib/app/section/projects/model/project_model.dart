import 'package:portfolio/core/constants/assets.dart';

class ProjectModel {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> stackUrls;

  ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.stackUrls,
  });
}

List<ProjectModel> projects = [
  ProjectModel(
    title: 'E Commerce App',
    description:
        'This is a Flutter shopping app with a Node.js backend, MongoDB database, including features for both users and administrators.',
    imageUrl: '',
    stackUrls: [
      Assets.flutter,
    ],
  ),
  ProjectModel(
    title: 'Social Media Application',
    description:
        'soical media application using flutter integrated with firebase.This app enables users to create posts, follow others, and engage with content through likes and comments. Integrated with Firebase for authentication, storage, and real-time updates.',
    imageUrl: '',
    stackUrls: [
      Assets.flutter,
      Assets.firebase,
    ],
  ),
  ProjectModel(
    title: 'Todo Application',
    description:
        'This Flutter application is a versatile TODO list manager with robust state management using the Provider package and persistent data storage using SQLite via the Sqflite package. The app allows users to effortlessly create, update, read, and delete tasks, providing a seamless experience for organizing their daily activities.',
    imageUrl: '',
    stackUrls: [
      Assets.flutter,
      Assets.firebase,
    ],
  ),
  ProjectModel(
    title: 'Porfolio Website',
    description: 'build responsive portfolio website using flutter',
    imageUrl: '',
    stackUrls: [
      Assets.flutter,
      Assets.firebase,
    ],
  ),
];
