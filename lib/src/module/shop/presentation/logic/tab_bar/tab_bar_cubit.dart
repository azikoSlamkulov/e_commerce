import 'package:e_commerce/lib.dart';

part 'tab_bar_state.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(const TabBarState(selectedTabIndex: 0));

  void getSelectedTabIndex(int newSelectedTabIndex) =>
      emit(TabBarState(selectedTabIndex: newSelectedTabIndex));
}
