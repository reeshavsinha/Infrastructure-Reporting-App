import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_theme.dart';

// --- ENUMS ---

enum ProjectStatus {
  pending,
  planning,
  ongoing,
  completed,
  delayed,
  cancelled,
  onHold
}

enum ProjectPriority { low, medium, high, critical }

enum ProjectCategory {
  education,
  healthcare,
  infrastructure,
  waterSanitation,
  agriculture,
  technology,
  tourism,
  environment,
  housing,
  transportation
}

// --- MAIN PROJECT MODEL ---

class Project {
  final String id;
  final String name;
  final String village;
  final ProjectStatus status;
  final int completionPercent;
  final ProjectCategory category;
  final ProjectPriority priority;
  final int budget;
  final int allocatedBudget;
  final DateTime startDate;
  final DateTime expectedEndDate;
  final DateTime? actualEndDate;
  final String contractor;
  final String supervisor;
  final String description;
  final DateTime lastUpdated;
  final String notes;
  final List<String> photos;
  final List<String> documents;

  Project({
    required this.id,
    required this.name,
    required this.village,
    required this.status,
    required this.completionPercent,
    required this.category,
    required this.priority,
    required this.budget,
    required this.allocatedBudget,
    required this.startDate,
    required this.expectedEndDate,
    this.actualEndDate,
    required this.contractor,
    required this.supervisor,
    required this.description,
    required this.lastUpdated,
    required this.notes,
    required this.photos,
    required this.documents,
  });

  // FIX: Made the fromJson factory robust with default values to prevent crashes
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Untitled Project',
      village: json['village'] ?? 'N/A',
      status: ProjectStatusX.fromString(json['status']),
      completionPercent: json['completion_percent'] ?? 0,
      category: ProjectCategoryX.fromString(json['category']),
      priority: ProjectPriorityX.fromString(json['priority']),
      budget: json['budget'] ?? 0,
      allocatedBudget: json['allocated_budget'] ?? 0,
      startDate: json['start_date'] != null
          ? DateTime.tryParse(json['start_date']) ?? DateTime.now()
          : DateTime.now(),
      expectedEndDate: json['expected_end_date'] != null
          ? DateTime.tryParse(json['expected_end_date']) ?? DateTime.now()
          : DateTime.now(),
      actualEndDate: json['actual_end_date'] != null
          ? DateTime.tryParse(json['actual_end_date'])
          : null,
      contractor: json['contractor'] ?? 'N/A',
      supervisor: json['supervisor'] ?? 'N/A',
      description: json['description'] ?? '',
      lastUpdated: json['last_updated'] != null
          ? DateTime.tryParse(json['last_updated']) ?? DateTime.now()
          : DateTime.now(),
      notes: json['notes'] ?? '',
      photos: List<String>.from(json['photos'] ?? []),
      documents: List<String>.from(json['documents'] ?? []),
    );
  }

  // Calculated property to check if a project is overdue
  bool get isOverdue =>
      status != ProjectStatus.completed &&
      DateTime.now().isAfter(expectedEndDate);
}

// --- DART EXTENSIONS (IMPROVEMENT) ---
// This is the modern way to add properties like display names, colors, and icons to enums.
// This removes the need for helper methods in your UI files.

extension ProjectStatusX on ProjectStatus {
  String get displayName {
    switch (this) {
      case ProjectStatus.onHold:
        return 'On Hold';
      default:
        return name[0].toUpperCase() + name.substring(1);
    }
  }

  Color get color {
    switch (this) {
      case ProjectStatus.pending:
        return AppTheme.warningColor;
      case ProjectStatus.planning:
        return AppTheme.infoColor;
      case ProjectStatus.ongoing:
        return AppTheme.primaryColor;
      case ProjectStatus.completed:
        return AppTheme.successColor;
      case ProjectStatus.delayed:
        return AppTheme.dangerColor;
      case ProjectStatus.cancelled:
        return Colors.grey;
      case ProjectStatus.onHold:
        return Colors.purple;
    }
  }

  static ProjectStatus fromString(String? status) {
    switch (status?.toLowerCase()) {
      case 'pending':
        return ProjectStatus.pending;
      case 'planning':
        return ProjectStatus.planning;
      case 'ongoing':
        return ProjectStatus.ongoing;
      case 'completed':
        return ProjectStatus.completed;
      case 'delayed':
        return ProjectStatus.delayed;
      case 'stalled':
        return ProjectStatus.delayed; // Map 'stalled' to 'delayed'
      case 'cancelled':
        return ProjectStatus.cancelled;
      case 'onhold':
      case 'on_hold':
        return ProjectStatus.onHold;
      default:
        return ProjectStatus.pending;
    }
  }
}

extension ProjectCategoryX on ProjectCategory {
  String get displayName {
    switch (this) {
      case ProjectCategory.waterSanitation:
        return 'Water & Sanitation';
      default:
        return name[0].toUpperCase() + name.substring(1);
    }
  }

  IconData get icon {
    switch (this) {
      case ProjectCategory.education:
        return Icons.school_outlined;
      case ProjectCategory.healthcare:
        return Icons.local_hospital_outlined;
      case ProjectCategory.infrastructure:
        return Icons.construction_outlined;
      case ProjectCategory.waterSanitation:
        return Icons.water_drop_outlined;
      case ProjectCategory.agriculture:
        return Icons.agriculture_outlined;
      case ProjectCategory.technology:
        return Icons.computer_outlined;
      case ProjectCategory.tourism:
        return Icons.travel_explore_outlined;
      case ProjectCategory.environment:
        return Icons.eco_outlined;
      case ProjectCategory.housing:
        return Icons.home_outlined;
      case ProjectCategory.transportation:
        return Icons.directions_car_outlined;
    }
  }

  static ProjectCategory fromString(String? category) {
    switch (category?.toLowerCase()) {
      case 'education':
        return ProjectCategory.education;
      case 'healthcare':
        return ProjectCategory.healthcare;
      case 'infrastructure':
        return ProjectCategory.infrastructure;
      case 'water & sanitation':
      case 'water_sanitation':
        return ProjectCategory.waterSanitation;
      case 'agriculture':
        return ProjectCategory.agriculture;
      case 'technology':
        return ProjectCategory.technology;
      case 'tourism':
        return ProjectCategory.tourism;
      case 'environment':
        return ProjectCategory.environment;
      case 'housing':
        return ProjectCategory.housing;
      case 'transportation':
        return ProjectCategory.transportation;
      default:
        return ProjectCategory.infrastructure;
    }
  }
}

extension ProjectPriorityX on ProjectPriority {
  String get displayName => name[0].toUpperCase() + name.substring(1);

  Color get color {
    switch (this) {
      case ProjectPriority.low:
        return AppTheme.successColor;
      case ProjectPriority.medium:
        return AppTheme.accentColor;
      case ProjectPriority.high:
        return AppTheme.dangerColor;
      case ProjectPriority.critical:
        return Colors.red[900]!;
    }
  }

  static ProjectPriority fromString(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'low':
        return ProjectPriority.low;
      case 'medium':
        return ProjectPriority.medium;
      case 'high':
        return ProjectPriority.high;
      case 'critical':
        return ProjectPriority.critical;
      default:
        return ProjectPriority.medium;
    }
  }
}
