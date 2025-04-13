abstract class CardStates {}

class CardInitialStates extends CardStates {}

class OnChangeBankNameState extends CardStates {}

class CardAddedLoadingState extends CardStates {}

class CardAddedSuccessState extends CardStates {}

class CardAddedErrorState extends CardStates {
  final String error;

  CardAddedErrorState({required this.error});
}

class CardUpdatedState extends CardStates {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;

  CardUpdatedState({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isCvvFocused,
  });
}

class CardFetchLoadingState extends CardStates {}

class CardFetchSuccessState extends CardStates {}

class CardFetchEmptyState extends CardStates {}

class CardFetchErrorState extends CardStates {
  final String error;
  CardFetchErrorState({required this.error});
}