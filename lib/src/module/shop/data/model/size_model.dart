import 'dart:convert';
import 'package:e_commerce/lib.dart';

SizeModel sizeFromJson(Map docMap) =>
    SizeModel.fromJson(docMap as Map<String, dynamic>);

String sizeToJson(SizeModel data) => json.encode(data.toJson());

int totalSizes({
  required int xs,
  required int s,
  required int l,
  required int m,
  required int xl,
}) {
  return xs + s + l + m + xl;
}

class SizeModel extends SizeEntity {
  const SizeModel({
    final int? xs,
    final int? s,
    final int? l,
    final int? m,
    final int? xl,
    final int? totalSizes,
  }) : super(
          xs: xs,
          s: s,
          l: l,
          m: m,
          xl: xl,
          totalSizes: totalSizes,
        );

  factory SizeModel.fromJson(Map<String, dynamic> json) => SizeModel(
        xs: json['xs'] as int,
        s: json['s'] as int,
        l: json['l'] as int,
        m: json['m'] as int,
        xl: json['xl'] as int,
        totalSizes: json['totalSizes'] as int,
      );

  Map<String, dynamic> toJson() => {
        "xs": xs ?? 0,
        "s": s ?? 0,
        "l": l ?? 0,
        "m": m ?? 0,
        "xl": xl ?? 0,
        "totalSizes": totalSizes(
          xs: xs ?? 0,
          s: s ?? 0,
          l: l ?? 0,
          m: m ?? 0,
          xl: xl ?? 0,
        ),
      };
}
