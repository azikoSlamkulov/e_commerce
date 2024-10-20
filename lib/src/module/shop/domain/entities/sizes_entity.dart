import 'package:equatable/equatable.dart';

class SizeEntity extends Equatable {
  final int? xs;
  final int? s;
  final int? l;
  final int? m;
  final int? xl;
  final int? totalSizes;

  const SizeEntity({
    this.xs,
    this.s,
    this.l,
    this.m,
    this.xl,
    this.totalSizes,
  });

  @override
  List<Object?> get props => [
        xs,
        s,
        l,
        m,
        xl,
        totalSizes,
      ];
}
