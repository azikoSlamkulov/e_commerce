import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../../auth/domain/domain.dart';
import '../domain.dart';

class UpdateUserInfo extends UseCase<bool, UpdateUserInfoParams> {
  final ProfileRepo profileRepo;
  UpdateUserInfo(this.profileRepo);

  @override
  Future<Either<Failure, bool>> call(UpdateUserInfoParams params) async {
    return await profileRepo.updateUser(user: params.user);
  }
}

class UpdateUserInfoParams extends Equatable {
  final UserEntity user;
  const UpdateUserInfoParams({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}
