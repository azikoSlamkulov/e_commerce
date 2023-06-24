import 'package:e_commerce/lib.dart';

class AddressEntity extends Equatable {
  final String? id;
  final String? name;
  final String? address;
  final String? city;
  final String? region;
  final String? country;
  final bool? isCheked;

  AddressEntity({
    this.id,
    this.name,
    this.address,
    this.city,
    this.region,
    this.country,
    this.isCheked,
  });

  @override
  List<Object?> get props => [
        id,
        address,
        city,
        region,
        country,
        isCheked,
      ];
}
