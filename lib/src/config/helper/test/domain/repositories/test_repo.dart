import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../../test.dart';

abstract class TestRepo {
  Future<Either<Failure, List<TestEntity>>> getTest();
}
