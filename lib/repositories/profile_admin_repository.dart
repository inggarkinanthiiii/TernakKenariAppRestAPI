import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:ternakkenari/response/buyer/admin_profile_response_model.dart';
import 'package:ternakkenari/services/service_http_client.dart';
import 'package:ternakkenari/models/request/admin/admin_profil_request.dart';

class PrifileAdminRepository {
  final ServiceHttpClient _serviceHttpClient;
  final secureStorage = FlutterSecureStorage();

  PrifileAdminRepository(this._serviceHttpClient);

  Future<Either<String, AdminProfileResponseModel>> addProfile(
    AdminProfileRequestModel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.postWithToken(
        'admin/profile',
        requestModel.toMap,
      );
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 201) {
        final profileResponse = AdminProfileResponseModel.fromMap(jsonResponse);
        debugPrint("Add Admin Profile successful: ${profileResponse.message}");
        return Right(profileResponse);
      } else {
        debugPrint("Add Admin Profile failed: ${jsonResponse['message']}");
        return Left(jsonResponse['message'] ?? "Create Profile failed");
      }
    } catch (e) {
      debugPrint("Error in adding profile: $e");
      return Left("An error occurred while adding profile: $e");
    }
  }

  Future<Either<String, AdminProfileResponseModel>> getProfile() async {
    try {
      final response = await _serviceHttpClient.get("admin/profile");
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final profileResponse = AdminProfileResponseModel.fromMap(jsonResponse);
        debugPrint("Get Admin Profile successful: ${profileResponse.message}");
        return Right(profileResponse);
      } else {
        final jsonResponse = json.decode(response.body);
        debugPrint("Get Admin Profile failed: ${jsonResponse['message']}");
        return Left(jsonResponse['message'] ?? "Get Profile failed");
      }
    } catch (e) {
      debugPrint("Error in getting profile: $e");
      return Left("An error occurred while getting profile: $e");
    }
  }
}
