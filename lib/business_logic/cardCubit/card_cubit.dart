import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_hackthon_savesavey/business_logic/cardCubit/card_states.dart';

class CardCubit extends Cubit<CardStates> {
  CardCubit() : super(CardInitialStates());

  static CardCubit get(context) => BlocProvider.of(context);

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();

  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  String? selectedBank;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<String> egyptianBanks = [
    'NBE',
    'Banque Misr',
    'CIB',
    'QNB',
    'Banque du Caire',
    'HSBC Egypt',
    'AlexBank',
    'Faisal Islamic Bank',
    'Abu Dhabi Islamic Bank',
    'AAIB',
    'EG Bank',
  ];

  void onChangeBankName(String? value) {
    selectedBank = value;
    emit(OnChangeBankNameState());
  }

  void onCreditCardModelChange(CreditCardModel? model) {
    cardNumber = model?.cardNumber ?? '';
    expiryDate = model?.expiryDate ?? '';
    cardHolderName = model?.cardHolderName ?? '';
    cvvCode = model?.cvvCode ?? '';
    isCvvFocused = model?.isCvvFocused ?? false;
    cardNumberController.text = cardNumber;
    expiryDateController.text = expiryDate;
    cardHolderController.text = cardHolderName;
    cvvController.text = cvvCode;
    emit(CardUpdatedState(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      isCvvFocused: isCvvFocused,
    ));
  }

  Future<void> saveCard() async {
    if (formKey.currentState!.validate() && selectedBank != null) {
      final cardData = {
        'cardNumber': cardNumberController.text,
        'expiryDate': expiryDateController.text,
        'cardHolderName': cardHolderController.text,
        'cvvCode': cvvController.text,
        'bankName': selectedBank,
      };
      try {
        emit(CardAddedLoadingState());
        await FirebaseFirestore.instance.collection('cards').add(cardData);
        emit(CardAddedSuccessState());
      } catch (e) {
        emit(CardAddedErrorState(error: e.toString()));
        debugPrint(e.toString());
      }
    }
  }

  Future<void> getUserCard() async {
    emit(CardFetchLoadingState());
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('cards')
          .limit(4)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();
        cardNumber = data['cardNumber'];
        expiryDate = data['expiryDate'];
        cardHolderName = data['cardHolderName'];
        cvvCode = data['cvvCode'];
        selectedBank = data['bankName'];
        emit(CardFetchSuccessState());
      } else {
        emit(CardFetchEmptyState());
      }
    } catch (e) {
      emit(CardFetchErrorState(error: e.toString()));
    }
  }
}