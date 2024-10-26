# Nested Bottom Navigation

This Flutter project demonstrates the implementation of a **nested bottom navigation** system, where each tab maintains its own navigation stack. This approach ensures that switching between tabs preserves the state and navigation history of each tab.

## Features

- **Multiple Navigation Stacks**: Each bottom navigation tab has its own stack, allowing independent navigation for each tab.
- **State Preservation**: Navigating between different tabs does not reset their content or navigation history.
- **Flutter Best Practices**: Implements clean architecture with proper separation of concerns and reusable widget structures.

## How It Works

The app uses a `BottomNavigationBar` widget to handle navigation between tabs, each with its own navigation stack using a `Navigator`. The current state of each tab is retained as you switch between them, providing a smooth user experience.

## Getting Started

This project is built using Flutter. Follow the steps below to run the project locally:

### Prerequisites

- Flutter SDK: [Install Flutter](https://docs.flutter.dev/get-started/install)
- Dart: Included with Flutter
