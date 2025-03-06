abstract class NewBankAccountStates {}

class NewBankAccountInitialState extends NewBankAccountStates {}

class ImagePickedFromGalleryState extends NewBankAccountStates {}

class ImagePickedFromCameraState extends NewBankAccountStates {}

class TextDetectionLoadingState extends NewBankAccountStates {}


class TextDetectionSuccessState extends NewBankAccountStates {
  final String detectedText;
  TextDetectionSuccessState(this.detectedText);
}

class TextDetectionErrorState extends NewBankAccountStates {}


class CaptureSelfieSuccessState extends NewBankAccountStates {}

class CaptureSelfieErrorState extends NewBankAccountStates {}

class CaptureSelfieLoadingState extends NewBankAccountStates {}

class PostBankAccountErrorState extends NewBankAccountStates {
  final String error;

  PostBankAccountErrorState({required this.error});
}
class PostBankAccountLoadingState extends NewBankAccountStates {}
class PostBankAccountSuccessState extends NewBankAccountStates {}
