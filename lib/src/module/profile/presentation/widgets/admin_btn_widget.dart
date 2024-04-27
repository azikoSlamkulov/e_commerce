import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';

class AdminBtnWidget extends StatelessWidget {
  const AdminBtnWidget({
    required this.user,
    required this.context,
    required this.subtitle,
    this.isTop = true,
    this.isBottom = false,
    super.key,
  });

  final AuthUserEntity user;
  final BuildContext context;
  final String subtitle;
  final bool isTop;
  final bool isBottom;

  @override
  Widget build(BuildContext context) {
    return user.role == 'admin'
        ? ExpansionTile(
            shape: Border(
              top: isTop
                  ? const BorderSide(color: Colors.black12, width: 0.5)
                  : BorderSide.none,
              bottom: isBottom
                  ? const BorderSide(color: Colors.black12, width: 0.5)
                  : BorderSide.none,
            ),
            title: Text(
              'Admin',
              style: AppTextStyles.black16,
            ),
            subtitle: Text(
              subtitle,
              style: AppTextStyles.grey11,
            ),
            children: [
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const MobileDashbordView(),
                  //   ),
                  // );
                },
                title: Text(
                  'Dashboard',
                  //style: Theme.of(context).textTheme.bodyMedium,
                  style: AppTextStyles.red16,
                ),
              ),
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const MobileAdminOrdersView(),
                  //   ),
                  // );
                },
                title: Text(
                  'Orders',
                  style: AppTextStyles.red16,
                  //style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              ExpansionTile(
                // shape: Border(
                //   top: isTop
                //       ? const BorderSide(color: Colors.black12, width: 0.5)
                //       : BorderSide.none,
                //   bottom: isBottom
                //       ? const BorderSide(color: Colors.black12, width: 0.5)
                //       : BorderSide.none,
                // ),
                title: Text(
                  'Products',
                  style: AppTextStyles.red16,
                  //style: Theme.of(context).textTheme.bodyMedium,
                ),
                children: [
                  ListTile(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const AdminProductsView(),
                      //   ),
                      // );
                    },
                    title: Text(
                      'All products',
                      //style: Theme.of(context).textTheme.bodyMedium,
                      style: AppTextStyles.blue16,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const AdminCategoriesView(),
                      //   ),
                      // );
                    },
                    title: Text(
                      'All categories',
                      style: AppTextStyles.blue16,
                      //style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const AdminProductsView(),
                      //   ),
                      // );
                    },
                    title: Text(
                      'All brands',
                      style: AppTextStyles.blue16,
                      //style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              )
            ],
          )
        : const SizedBox();
  }
}
