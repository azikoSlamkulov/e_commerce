import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  Future<XFile> getImage(ImageSource imageSource) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? _image = await _picker.pickImage(source: imageSource);
    return _image!;
  }
}
