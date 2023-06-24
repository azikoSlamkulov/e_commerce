import 'package:e_commerce/lib.dart';

class CustomBottomSheetWidget {
  customModalBottomSheet({
    required BuildContext context,
    required Widget content,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      builder: (BuildContext context) {
        return content;
      },
    );
  }
}

CustomBottomSheetWidget customBottomSheet = CustomBottomSheetWidget();
