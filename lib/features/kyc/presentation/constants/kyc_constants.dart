import 'package:flutter/material.dart';

class KYCConstants {
  static const Color primaryColor = Color(0xff6B39F4);
  
  static const Map<String, Map<String, dynamic>> verificationSteps = {
    'basicDetails': {
      'title': 'Basic Details',
      'description': 'Personal information and ID verification',
      'icon': Icons.person_outline,
    },
    'riskProfiling': {
      'title': 'Risk Profiling',
      'description': 'Investment preferences and risk assessment',
      'icon': Icons.assessment_outlined,
    },
    'capitalManagement': {
      'title': 'Capital Management',
      'description': 'Investment capacity and risk limits',
      'icon': Icons.account_balance_wallet_outlined,
    },
    'experience': {
      'title': 'Experience',
      'description': 'Trading experience and preferences',
      'icon': Icons.trending_up_outlined,
    },
  };

  static const Map<String, Map<String, dynamic>> requiredDocuments = {
    'governmentId': {
      'title': 'Government ID',
      'description': 'Valid government-issued ID (Passport, Driver\'s License, or National ID)',
      'subDescription': 'Must be clear and not expired',
      'icon': Icons.badge,
    },
    'selfie': {
      'title': 'Selfie Verification',
      'description': 'Clear selfie in good lighting',
      'subDescription': 'Face must match your ID',
      'icon': Icons.face,
    },
    'addressProof': {
      'title': 'Address Proof',
      'description': 'Recent utility bill or bank statement',
      'subDescription': 'Less than 3 months old',
      'icon': Icons.location_on,
    },
  };
} 