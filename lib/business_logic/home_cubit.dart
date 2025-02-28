import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/api_services/api_services.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final GoogleVisionService visionService = GoogleVisionService();

  void fetchTextFromImage() async {
    final GoogleVisionService visionService = GoogleVisionService();

    final String imageUrl =
        "https://th.bing.com/th/id/R.967abe2a1d6ed9c7cef226817a0f3790?rik=lxBmAOvzZDeMjw&pid=ImgRaw&r=0";

    final response = await visionService.detectTextFromImage(imageUrl);

    if (response != null) {
      print("Extracted Text: ${response['responses'][0]['textAnnotations'][0]['description']}");
    } else {
      print("Failed to extract text.");
    }
  }

}
