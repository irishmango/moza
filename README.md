# Moza – Learn Music Visually

**Moza** is a Flutter app that teaches music theory through interactive lessons, animated quizzes, and structured learning paths. It’s built with modular architecture and Firebase integration to support scalable educational content.

## Features

- Learn through interactive lessons with text and images  
- Quiz-based learning with immediate feedback and XP rewards  
- Track your learning progress and quiz scores  
- Earn badges and experience points for achievements  
- Modular navigation through topics, chapters, and lessons  
- Offline support ready with scalable Firestore-backed models  

## Built With

- **Flutter** & **Dart**  
- **Cloud Firestore** for content and quiz storage  
- **Provider-style architecture** for local state management  
- **Custom UI Components**: cards, toggle switches, lesson viewers  
- **Responsive UI** with animations, XP meters, and custom themes  

## Key Learnings

- Structured app navigation through nested data (Topics > Chapters > Lessons > Quizzes)  
- Reusable UI components for tiles, cards, buttons, and scaffold wrappers  
- Managing quiz state (progress, scoring, answers, animations)  
- Abstracting Firestore access through a repository pattern  
- Using Hero animations and images to enhance UX  

## Future Features

- Rich-text lesson content editor  
- User login with real-time progress sync  
- Multi-language support  
- Lesson creation interface for teachers  

## Screenshots

- [Login Screen](assets/screenshots/sim_1.png)
- [Home Screen](assets/screenshots/sim_2.png)
- [Category Screen](assets/screenshots/sim_3.png)
- [Quiz Screen 1](assets/screenshots/sim_4.png)
- [Quiz Screen 2](assets/screenshots/sim_5.png)