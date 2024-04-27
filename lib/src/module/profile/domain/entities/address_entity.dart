import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String? id;
  final String? userId;
  final String? name;
  final String? address;
  final String? city;
  // final String? region;
  // final String? country;
  final bool? isCheked;

  AddressEntity({
    this.id,
    this.userId,
    this.name,
    this.address,
    this.city,
    // this.region,
    // this.country,
    this.isCheked,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        address,
        city,
        // region,
        // country,
        isCheked,
      ];
}
