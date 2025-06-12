// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../domain/models/kyc_basic_details.dart';
import '../../domain/repositories/kyc_repository.dart';

class KYCProvider extends ChangeNotifier {
  final KYCRepository _repository;
  bool _isLoading = false;
  String? _error;
  Map<String, dynamic>? _lastResponse;

  KYCProvider(this._repository);

  bool get isLoading => _isLoading;
  String? get error => _error;
  Map<String, dynamic>? get lastResponse => _lastResponse;

  Future<void> submitBasicDetails({
    required String fullName,
    required DateTime dob,
    required String gender,
    required String pan,
    String? aadharNumber,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final details = KYCBasicDetails(
        fullName: fullName,
        dob: dob,
        gender: gender,
        pan: pan,
        aadharNumber: aadharNumber,
      );

      _lastResponse = await _repository.submitBasicDetails(details);
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> submitRiskProfiling({
    required String monthlyIncome,
    required String cryptoPercentage,
    required String experience,
    required String reaction,
    required String timeframe,
    required bool isAwareOfRegulation,
    required bool isAwareOfRisks,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final questionsAndAnswers = [
        {
          "question": "What is your total monthly income?",
          "answer": monthlyIncome,
        },
        {
          "question":
              "What percentage of your wealth are you investing in crypto?",
          "answer": cryptoPercentage,
        },
        {
          "question": "How would you rate your experience in crypto trading?",
          "answer": experience,
        },
        {
          "question":
              "If your portfolio dropped 30% in one week, what would you do?",
          "answer": reaction,
        },
        {
          "question":
              "How long can you stay invested without needing your capital?",
          "answer": timeframe,
        },
        {
          "question":
              "Are you aware that crypto markets are unregulated in India?",
          "answer": isAwareOfRegulation ? "Yes" : "No",
        },
        {
          "question":
              "Do you understand that automated trades may cause losses and are irreversible?",
          "answer": isAwareOfRisks ? "Yes" : "No",
        },
      ];

      _lastResponse =
          await _repository.submitRiskProfiling(questionsAndAnswers);
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> submitCapitalManagement({
    required String initialCapital,
    required String tradePreference,
    required bool wantsRiskLimit,
    String? riskLimitPercentage,
    required bool autoDisableOnStopLoss,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final questionsAndAnswers = [
        {
          "question": "How much capital do you plan to automate initially?",
          "answer": initialCapital,
        },
        {
          "question":
              "Would you prefer small, frequent trades or high-confidence trades with fewer entries?",
          "answer": tradePreference,
        },
        {
          "question":
              "Would you like to set a capital-based monthly risk limit?",
          "answer": wantsRiskLimit ? "Yes" : "No",
        },
        if (wantsRiskLimit && riskLimitPercentage != null)
          {
            "question": "What is your risk limit percentage?",
            "answer": riskLimitPercentage,
          },
        {
          "question":
              "Should the system auto-disable if 2 stop-losses hit in a row?",
          "answer": autoDisableOnStopLoss ? "Yes" : "No",
        },
      ];

      _lastResponse =
          await _repository.submitCapitalManagement(questionsAndAnswers);
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> submitExperience({
    required String experienceYears,
    required String investmentCapacity,
    required List<String> interestedCoins,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final questionsAndAnswers = [
        {
          "question": "What's your year of experience?",
          "answer": experienceYears,
        },
        {
          "question": "What is your investment capacity?",
          "answer": investmentCapacity,
        },
        {
          "question": "Which coins are you interested in?",
          "answer": interestedCoins.join(", "),
        },
      ];

      _lastResponse = await _repository.submitExperience(questionsAndAnswers);
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
