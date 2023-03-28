import 'package:gfghackathon_app/data/mock/mock_data.dart';
import 'package:gfghackathon_app/data/models/review_model.dart';

Future<List<ReviewModel>> getReviews(doctorID) async {
  // mock data
  List<ReviewModel> reviews = reviewsData
      .where((element) => element["id"] == doctorID)
      .toList()
      .map((e) => ReviewModel.fromMap(e))
      .toList();
  return reviews;
}
