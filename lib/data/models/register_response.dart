/*
 * Created by andii on 12/11/21 22.48
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 12/11/21 22.48
 */

import 'package:equatable/equatable.dart';
import 'package:laporhoax/data/models/user_model.dart';
import 'package:laporhoax/domain/entities/register_data.dart';

class RegisterResponse extends Equatable {
  RegisterResponse({
    required this.user,
    required this.token,
  });

  final UserModel user;
  final String token;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    user: UserModel.fromJson(json["user"]),
    token: json["token"],
  );

  RegisterData toEntity() => RegisterData(user: user.toEntity(), token: token);

  @override
  List<Object?> get props => [user, token];
}

