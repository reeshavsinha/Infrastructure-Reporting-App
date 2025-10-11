import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/core/theme/app_theme.dart';

class NewAssessmentScreen extends ConsumerStatefulWidget {
  const NewAssessmentScreen({super.key});

  @override
  ConsumerState<NewAssessmentScreen> createState() =>
      _NewAssessmentScreenState();
}

class _NewAssessmentScreenState extends ConsumerState<NewAssessmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _villageController = TextEditingController();
  final _assessmentTypeController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedState = '';
  String _selectedDistrict = '';
  String _selectedAssessmentType = '';
  DateTime _selectedDate = DateTime.now();

  final List<String> _assessmentTypes = [
    'Infrastructure Gap Analysis',
    'Education Assessment',
    'Healthcare Assessment',
    'Water & Sanitation Assessment',
    'Road Connectivity Assessment',
    'Electricity Assessment',
    'Digital Connectivity Assessment',
  ];

  @override
  void dispose() {
    _villageController.dispose();
    _assessmentTypeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start New Assessment'),
        actions: [
          TextButton(
            onPressed: _saveAssessment,
            child: const Text('Save Draft'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assessment Details',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),

                    // Assessment Type
                    DropdownButtonFormField<String>(
                      value: _selectedAssessmentType.isEmpty
                          ? null
                          : _selectedAssessmentType,
                      decoration: const InputDecoration(
                        labelText: 'Assessment Type *',
                        border: OutlineInputBorder(),
                      ),
                      items: _assessmentTypes.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedAssessmentType = value ?? '';
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an assessment type';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Assessment Date
                    InkWell(
                      onTap: _selectDate,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Assessment Date *',
                          border: OutlineInputBorder(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                            ),
                            const Icon(Icons.calendar_today),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Description
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Assessment Description',
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide a description';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location Details',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),

                    // State Selection
                    DropdownButtonFormField<String>(
                      value: _selectedState.isEmpty ? null : _selectedState,
                      decoration: const InputDecoration(
                        labelText: 'State *',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: 'Uttarakhand', child: Text('Uttarakhand')),
                        DropdownMenuItem(
                            value: 'Uttar Pradesh',
                            child: Text('Uttar Pradesh')),
                        DropdownMenuItem(
                            value: 'Rajasthan', child: Text('Rajasthan')),
                        DropdownMenuItem(value: 'Bihar', child: Text('Bihar')),
                        DropdownMenuItem(
                            value: 'Karnataka', child: Text('Karnataka')),
                        DropdownMenuItem(
                            value: 'Maharashtra', child: Text('Maharashtra')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedState = value ?? '';
                          _selectedDistrict =
                              ''; // Reset district when state changes
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a state';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // District Selection
                    DropdownButtonFormField<String>(
                      value:
                          _selectedDistrict.isEmpty ? null : _selectedDistrict,
                      decoration: const InputDecoration(
                        labelText: 'District *',
                        border: OutlineInputBorder(),
                      ),
                      items: _getDistrictsForState().map((district) {
                        return DropdownMenuItem(
                          value: district,
                          child: Text(district),
                        );
                      }).toList(),
                      onChanged: _selectedState.isEmpty
                          ? null
                          : (value) {
                              setState(() {
                                _selectedDistrict = value ?? '';
                              });
                            },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a district';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Village
                    TextFormField(
                      controller: _villageController,
                      decoration: const InputDecoration(
                        labelText: 'Village *',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter village name';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _submitAssessment,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Start Assessment'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getDistrictsForState() {
    switch (_selectedState) {
      case 'Uttarakhand':
        return ['Udham Singh Nagar'];
      case 'Uttar Pradesh':
        return ['Lucknow', 'Varanasi'];
      case 'Rajasthan':
        return ['Jaipur', 'Udaipur', 'Bikaner'];
      case 'Bihar':
        return ['Patna', 'Jamui'];
      case 'Karnataka':
        return ['Bengaluru Urban', 'Mysuru', 'Bengaluru Rural'];
      case 'Maharashtra':
        return ['Pune', 'Aurangabad'];
      default:
        return [];
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveAssessment() {
    // TODO: Implement save as draft functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Assessment saved as draft')),
    );
  }

  void _submitAssessment() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement actual assessment submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Assessment started successfully!'),
          backgroundColor: AppTheme.successColor,
        ),
      );
      context.pop();
    }
  }
}
