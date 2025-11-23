import 'package:flutter/material.dart';
import 'package:qlinic/core/models/doctor_model.dart';

class FavoritesController extends ChangeNotifier {
  static final FavoritesController _instance = FavoritesController._internal();

  factory FavoritesController() {
    return _instance;
  }

  FavoritesController._internal();

  final List<DoctorModel> _favorites = [];

  List<DoctorModel> get favorites => List.unmodifiable(_favorites);

  void toggleFavorite(DoctorModel doctor) {
    if (isFavorite(doctor)) {
      _favorites.removeWhere((element) => element.id == doctor.id);
    } else {
      _favorites.add(doctor);
    }
    notifyListeners();
  }

  bool isFavorite(DoctorModel doctor) {
    return _favorites.any((element) => element.id == doctor.id);
  }
}
