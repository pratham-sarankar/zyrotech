import 'package:flutter/material.dart';

enum KYCStatus { notFound, pending, inProgress, completed, rejected }

extension KYCStatusExtension on KYCStatus {
  String get displayText {
    switch (this) {
      case KYCStatus.notFound:
        return "Not Started";
      case KYCStatus.pending:
        return "Pending";
      case KYCStatus.inProgress:
        return "In Progress";
      case KYCStatus.rejected:
        return "Rejected";
      case KYCStatus.completed:
        return "Completed";
    }
  }

  Color get color {
    switch (this) {
      case KYCStatus.notFound:
      case KYCStatus.pending:
        return Colors.grey;
      case KYCStatus.inProgress:
        return Colors.orange;
      case KYCStatus.rejected:
        return Colors.red;
      case KYCStatus.completed:
        return Colors.green;
    }
  }

  IconData get icon {
    switch (this) {
      case KYCStatus.notFound:
      case KYCStatus.pending:
        return Icons.pending;
      case KYCStatus.inProgress:
        return Icons.hourglass_empty;
      case KYCStatus.rejected:
        return Icons.cancel;
      case KYCStatus.completed:
        return Icons.verified_user;
    }
  }
} 