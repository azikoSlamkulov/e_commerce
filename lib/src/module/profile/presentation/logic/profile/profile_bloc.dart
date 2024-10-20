import 'package:bloc/bloc.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserInfo getUserInfo;
  final UpdateUserInfo updateUserInfo;
  final GetAllShippingAddress getAllShippingAddress;
  final AddShippingAddress addShippingAddress;
  final UpdateShippingAddress updateShippingAddress;
  final SelectDefaultShippingAddress selectDefaultAddress;
  ProfileBloc({
    required this.getUserInfo,
    required this.updateUserInfo,
    required this.getAllShippingAddress,
    required this.addShippingAddress,
    required this.updateShippingAddress,
    required this.selectDefaultAddress,
  }) : super(LoadingProfileState()) {
    on<GetUserInfoEvent>(_getUserInfo);
    on<UpdateUserEvent>(_updateUser);
    on<GetAllShippingAddressEvent>(_getAllShippingAddress);
    on<AddShippingAddressEvent>(_addShippingAddress);
    on<UpdateShippingAddressEvent>(_updateShippingAddress);
    on<SelectShippingAddressEvent>(_selectDefaultShippingAddress);
    on<InitialUserInfoEvent>(_initialUserInfo);
  }

  void _initialUserInfo(
      InitialUserInfoEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileInitial());
  }

  void _getUserInfo(GetUserInfoEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());
    final userInfo = await getUserInfo(
      GetUserInfoParams(
        userId: event.userId,
      ),
    );
    userInfo.fold(
      (error) => emit(ProfileFailureState(error)),
      (user) => emit(LoadedUserProfileState(user)),
    );
  }

  void _updateUser(UpdateUserEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());
    final isUpdated = await updateUserInfo(
      UpdateUserInfoParams(
        user: event.user,
      ),
    );
    isUpdated.fold(
      (error) => emit(ProfileFailureState(error)),
      (isUpdated) => emit(UpdatedUserProfileState(isUpdated)),
    );
  }

  void _getAllShippingAddress(
      GetAllShippingAddressEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());
    final allAddresses = await getAllShippingAddress(
      GetAllShippingAddressParams(
        userId: event.userId,
      ),
    );
    allAddresses.fold(
      (error) => emit(ProfileFailureState(error)),
      (addresses) => emit(LoadedAllShippingAddressState(addresses)),
    );
  }

  void _addShippingAddress(
      AddShippingAddressEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());
    final isAdded = await addShippingAddress(
      AddShippingAddressParams(
        address: event.address,
      ),
    );
    isAdded.fold(
      (error) => emit(ProfileFailureState(error)),
      (isAdded) => emit(AddedShippingAddressState(isAdded)),
    );
  }

  void _updateShippingAddress(
      UpdateShippingAddressEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());
    final isUpdated = await updateShippingAddress(
      UpdateShippngAddressParams(
        address: event.address,
      ),
    );
    isUpdated.fold(
      (error) => emit(ProfileFailureState(error)),
      (isUpdated) => emit(UpdatedShippingAddressState(isUpdated)),
    );
  }

  void _selectDefaultShippingAddress(
      SelectShippingAddressEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());
    final isSelected = await selectDefaultAddress(SelectDefaultAddressParams(
      userId: event.userId,
      addressId: event.addressId,
    ));
    isSelected.fold(
      (error) => emit(ProfileFailureState(error)),
      (isSelected) => emit(UpdatedShippingAddressState(isSelected)),
    );
  }
}
