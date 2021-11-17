import 'package:flutter_list_with_different_items/model/grade_model_class.dart';
import 'package:flutter_list_with_different_items/repositories/api_endpoints.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class DashBoardRepository {
  var token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwZTBhNzU2NTBlZmYwM2M4NGU3ZTA1YiIsInJvbGUiOiJzdXBlcmFkbWluIiwib3duZXIiOiJzdXBlcmFkbWluIiwiaWF0IjoxNjI1NDA1NDA1LCJleHAiOjE2MjYwMTAyMDV9.B6Y2JXfF28g62QdQCf577L3sLMcAOY95RSKhcCGWrXU";
  //*fetching all grades
  Future<List<GradeModelClass>> fetchingGrade() async {
    final response = await http.get(Uri.parse(ApiEndpoints.grade),
        headers: {"Authorization": "Bearer" + token});

    if (response.statusCode == 201 || response.statusCode == 200) {
      
    }
  }
}
