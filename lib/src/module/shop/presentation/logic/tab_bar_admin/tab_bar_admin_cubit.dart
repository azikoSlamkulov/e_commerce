import 'package:bloc/bloc.dart';

part 'tab_bar_admin_state.dart';

class TabBarAdminCubit extends Cubit<TabBarAdminState> {
  TabBarAdminCubit() : super(const TabBarAdminState(selectedTabValue: 'Women'));

  void getSelectedTabIndex(int newSelectedTabIndex) {
    String selectedTabValue = 'Women';
    switch (newSelectedTabIndex) {
      case 0:
        selectedTabValue = 'Women';
        break;
      case 1:
        selectedTabValue = 'Men';
        break;
      case 2:
        selectedTabValue = 'Kids';
        break;
    }

    emit(TabBarAdminState(selectedTabValue: selectedTabValue));
  }
}
