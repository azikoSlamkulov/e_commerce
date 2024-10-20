import 'package:equatable/equatable.dart';

class TestEntity extends Equatable {
  final String? id;

  const TestEntity({
    this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
      ];
}
