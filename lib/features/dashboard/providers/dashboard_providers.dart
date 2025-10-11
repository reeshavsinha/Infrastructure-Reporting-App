import 'package:flutter_riverpod/flutter_riverpod.dart';
// This line makes the variable visible to this file
import 'package:flutter_application_1/core/data/mock_database.dart';

// A simple model to represent a success story
class SuccessStory {
  final String title;
  final String subtitle;
  SuccessStory({required this.title, required this.subtitle});
}

// A provider that reads the mock data and converts it into a list of SuccessStory objects
final successStoriesProvider = Provider<List<SuccessStory>>((ref) {
  // In a real app, this would be a repository that calls an API
  // FIX: Changed 'mockSuccessstories' to 'mockSuccessStories' to match the variable name
  return mockSuccessStories
      .map((s) => SuccessStory(title: s['title']!, subtitle: s['subtitle']!))
      .toList();
});
