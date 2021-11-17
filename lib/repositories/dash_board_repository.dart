import 'dart:convert';
import 'package:flutter_list_with_different_items/models/bonus_model_class.dart';
import 'package:flutter_list_with_different_items/models/grade_model_class.dart';
import 'package:flutter_list_with_different_items/models/profit_model_class.dart';
import 'package:flutter_list_with_different_items/models/refill_model_class.dart';
import 'package:flutter_list_with_different_items/repositories/api_endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class DashBoardRepository {
  Map<String, String>? headers = {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwZTBhNzU2NTBlZmYwM2M4NGU3ZTA1YiIsInJvbGUiOiJzdXBlcmFkbWluIiwib3duZXIiOiJzdXBlcmFkbWluIiwiaWF0IjoxNjI1NDA1NDA1LCJleHAiOjE2MjYwMTAyMDV9.B6Y2JXfF28g62QdQCf577L3sLMcAOY95RSKhcCGWrXU"
  };

  //*fetching all grades
  Future<GradeModelClass> fetchingGrade() async {
    final response =
        await http.get(Uri.parse(ApiEndpoints.grade), headers: headers);
    var data = jsonDecode(response.body);
    var log = Logger();
    log.w(data);
    return GradeModelClass.fromJson(data);
  }

  //*fetching all refill
  Future<RefillModelClass> fetchingRefill() async {
    final response =
        await http.get(Uri.parse(ApiEndpoints.refill), headers: headers);
    var data = jsonDecode(response.body);
    return RefillModelClass.fromJson(data);
  }

  //*fetching all profit
  Future<ProfitModelClass> fetchingProfit() async {
    final response =
        await http.get(Uri.parse(ApiEndpoints.profit), headers: headers);
    var data = jsonDecode(response.body);
    return ProfitModelClass.fromJson(data);
  }

  //*fetching all grades
  Future<BonusModelClass> fetchingBonus() async {
    final response =
        await http.get(Uri.parse(ApiEndpoints.bonus), headers: headers);
    var data = jsonDecode(response.body);
    return BonusModelClass.fromJson(data);
  }
}
