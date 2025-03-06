import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/business_logic/newBankAccountCubit/new_bank_account_states.dart';
import 'package:google_hackthon_savesavey/data/models/bank_account_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/api_services/google_vision_service.dart';

class NewBankAccountCubit extends Cubit<NewBankAccountStates> {
  NewBankAccountCubit() : super(NewBankAccountInitialState());

  static NewBankAccountCubit get(context) => BlocProvider.of(context);

  final ImagePicker _imagePicker = ImagePicker();
  final GoogleVisionService _visionService = GoogleVisionService();
  final formKey = GlobalKey<FormState>();
   var bankCollectionReference = FirebaseFirestore.instance.collection('BankAccounts');

  File? selectedCardFile;
  File? imageSelfieFile;
  TextEditingController textController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController bankController = TextEditingController();

  Future<void> pickImageFromGallery() async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedCardFile = File(pickedFile.path);
        emit(ImagePickedFromGalleryState());

        // Call Google Vision API
        await _processImage();
      }
    } catch (e) {
      debugPrint("Error picking image from gallery: $e");
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        selectedCardFile = File(pickedFile.path);
        emit(ImagePickedFromCameraState());

        // Call Google Vision API
        await _processImage();
      }
    } catch (e) {
      debugPrint("Error picking image from camera: $e");
    }
  }

  Future<void> _processImage() async {
    if (selectedCardFile == null) return;

    textController.text = "Processing...";
    emit(TextDetectionLoadingState());

    final text = await _visionService.detectTextFromImage(selectedCardFile!);

    if (text != null) {
      textController.text = text;
      emit(TextDetectionSuccessState(text));
    } else {
      textController.text = "Text detection failed.";
      emit(TextDetectionErrorState());
    }
  }

  void clearSelectedImage() {
    selectedCardFile = null;
    textController.clear();
    emit(NewBankAccountInitialState());
  }

  Future<void> captureSelfie() async {
    emit(CaptureSelfieLoadingState());
    final imageFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      imageSelfieFile = File(imageFile.path);
      emit(CaptureSelfieSuccessState());
    } else {
      emit(CaptureSelfieErrorState());
    }
  }

  Future<void> postNewBankAccount() async {
    if (nameController.text.isEmpty ||
        idController.text.isEmpty ||
        dobController.text.isEmpty ||
        bankController.text.isEmpty ||
        imageSelfieFile == null) {
      emit(PostBankAccountErrorState( error: "Please fill in all fields and take a selfie."));
      return;
    }

    emit(PostBankAccountLoadingState());

    try {
      BankAccountModel bankAccountModel = BankAccountModel(
        name: nameController.text,
        idNumber: idController.text,
        dateOfBirth: dobController.text,
        bankName: bankController.text,
        profilePhotoPath: imageSelfieFile!.path,
      );

      await bankCollectionReference.add(bankAccountModel.toJson());

      emit(PostBankAccountSuccessState());
    } catch (e) {
      debugPrint("Error submitting bank account: $e");
      emit(PostBankAccountErrorState(error: "Failed to submit bank account: "));
    }
  }

}

