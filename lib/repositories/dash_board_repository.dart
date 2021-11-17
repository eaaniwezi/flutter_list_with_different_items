import 'dart:convert';

import 'package:flutter_list_with_different_items/model/bonus_model_class.dart';
import 'package:flutter_list_with_different_items/model/grade_model_class.dart';
import 'package:flutter_list_with_different_items/model/profit_model_class.dart';
import 'package:flutter_list_with_different_items/model/refill_model_class.dart';
import 'package:flutter_list_with_different_items/repositories/api_endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class DashBoardRepository {
  var log = Logger();
  final storage = new FlutterSecureStorage();

  //*fetching all grades
  Future<GradeModelClass> fetchingGrade() async {
    var savedToken = await storage.read(key: 'token');
    final response = await http.get(Uri.parse(ApiEndpoints.grade),
        headers: {"Authorization": "Bearer" + savedToken!});
    var data = jsonDecode(response.body);
    return GradeModelClass.fromJson(data);
  }

  //*fetching all refill
  Future<RefillModelClass> fetchingRefill() async {
    var savedToken = await storage.read(key: 'token');
    final response = await http.get(Uri.parse(ApiEndpoints.refill),
        headers: {"Authorization": "Bearer" + savedToken!});
    var data = jsonDecode(response.body);
    return RefillModelClass.fromJson(data);
  }

  //*fetching all profit
  Future<ProfitModelClass> fetchingProfit() async {
    var savedToken = await storage.read(key: 'token');
    final response = await http.get(Uri.parse(ApiEndpoints.profit),
        headers: {"Authorization": "Bearer" + savedToken!});
    var data = jsonDecode(response.body);
    return ProfitModelClass.fromJson(data);
  }

  //*fetching all grades
  Future<BonusModelClass> fetchingBonus() async {
    var savedToken = await storage.read(key: 'token');
    final response = await http.get(Uri.parse(ApiEndpoints.bonus),
        headers: {"Authorization": "Bearer" + savedToken!});
    var data = jsonDecode(response.body);
    return BonusModelClass.fromJson(data);
  }
}
