import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../admin_products.dart';
import 'list_tile_btn_widget.dart';

class BuildBrandWidget extends StatelessWidget {
  const BuildBrandWidget({
    required this.callbackSelectedBrand,
    super.key,
  });
  final ValueSetter<String> callbackSelectedBrand;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsBloc, BrandsState>(
      builder: (context, state) {
        if (state is TypedBrandState) {
          callbackSelectedBrand(state.typedBrandName);
          return ListTileBtnWidget(
            text: 'Brand',
            subtitle: state.typedBrandName,
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                // return BlocProvider.value(
                //   value: BlocProvider.of<BrandsBloc>(context),
                //   child: const MobileBrandListView(),
                // );
                return const MobileBrandListView();
              },
            )),
          );
        }
        return ListTileBtnWidget(
          text: 'Brand',
          subtitle: 'Бренд не выбран',
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const MobileBrandListView();
            },
          )),
        );
      },
    );
  }
}
