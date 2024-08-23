import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final bool active;
  String imageUrl;

  /// TODO : Remove The value later
  final String targetScreen;

  BannerModel(
      {required this.active,
      required this.imageUrl,
      required this.targetScreen});

  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
        active: data['Active'] ?? false,
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '');
  }
}
