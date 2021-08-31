import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

const Color kPrimaryColor = Color(0xffC0392B);
const kSocialIcons = [
  "https://img.icons8.com/ios/50/000000/linkedin.png",
  "https://img.icons8.com/windows/32/000000/hackerrank.png",
  "https://img.icons8.com/ios/50/000000/github--v1.png"
];
const kSocialLinks = [
  "https://www.linkedin.com/in/prashantbharaj",
  "https://www.hackerrank.com/prashant_bharaj",
  "https://github.com/Prashant-Bharaj",
];

// URL Launcher
void launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

final kTools = [
  "Dart",
  "Flutter",
  "Java",
  "C/C++",
  "Python",
  "Machine Learning",
  "FirebaseAuth",
  "Cloud-Firestore"
];
final kProjectsTitles = [
  "Flash Chat",
  "Dog Breed Classifier",
  "Indian Social Media",
  "ABVGIET old question papers",
];
final kProjectsIcons = [
  "assets/projects/flashchat.png",
  "assets/projects/dog.png",
  "assets/projects/ins.png",
  "assets/projects/abvgiet.webp",
];

final kProjectsDescriptions = [
  "It is a real-time chatting application. Use Cloud-Firestore for storing messages and Firebase-Authentication for login and registration.",
  "It is a ML based project. It tells about the breed of dog with the help of image or video.",
  "It is working clone of instagram. features: user can upload post, do comments, follow others, see their posts, notification.",
  "This app is for the student of my college. It has the old question papers of stream ECE and CSE. ",
];
final kProjectsLinks = [
  "https://github.com/Prashant-Bharaj/flashchat",
  "https://github.com/Prashant-Bharaj/dog_breed_classifier",
  "https://github.com/Prashant-Bharaj/Indian-Social-Media",
  "https://play.google.com/store/apps/details?id=com.psb.abvgietoldquestionpapers",
];

final kContactIcons = [
  Icons.code,
  Icons.work,
  Icons.messenger_outline_outlined,
  Icons.mail,
];

final kContactTitles = [
  "GitHub",
  "LinkedIn",
  "Telegram",
  "Email",
];
