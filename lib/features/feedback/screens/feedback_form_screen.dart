import 'package:flutter/material.dart';

class FeedbackFormScreen extends StatelessWidget {
  const FeedbackFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report an Issue')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Select the village and category for your feedback.'),
          const SizedBox(height: 16),
          // In a real app, these would be populated from an API
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Select Village'),
            items: const [
              DropdownMenuItem(value: 'V001', child: Text('Rampur')),
              DropdownMenuItem(value: 'V002', child: Text('Sitapur')),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Issue Category'),
            items: const [
              DropdownMenuItem(value: 'water', child: Text('Drinking Water')),
              DropdownMenuItem(
                  value: 'roads', child: Text('Roads & Connectivity')),
              DropdownMenuItem(value: 'sanitation', child: Text('Sanitation')),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Describe the issue in detail',
              alignLabelWithHint: true,
            ),
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {/* TODO: Implement image picker */},
            icon: const Icon(Icons.upload_file),
            label: const Text('Upload Photo (Optional)'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // TODO: Submit data to backend
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16)),
            child: const Text('Submit Feedback'),
          ),
        ],
      ),
    );
  }
}
