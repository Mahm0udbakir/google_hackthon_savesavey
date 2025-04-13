import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_hackthon_savesavey/business_logic/cardCubit/card_cubit.dart';
import 'package:google_hackthon_savesavey/business_logic/cardCubit/card_states.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CardCubit>(context); // Access CardCubit using BlocProvider.of
    return BlocConsumer<CardCubit, CardStates>(
      listener: (context, state) {
        if (state is CardAddedLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is CardAddedSuccessState) {
          Navigator.of(context, rootNavigator: true).pop(); // Close loading
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('✅ Card saved successfully!')),
          );
        } else if (state is CardAddedErrorState) {
          Navigator.of(context, rootNavigator: true).pop(); // Close loading
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('❌ Failed to save card: ${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.gray80,
          appBar: AppBar(
            backgroundColor: ColorManager.gray80,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Add Credit Card',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    CreditCardWidget(
                      cardNumber: cubit.cardNumber,
                      expiryDate: cubit.expiryDate,
                      cardHolderName: cubit.cardHolderName,
                      cvvCode: cubit.cvvCode,
                      showBackView: cubit.isCvvFocused,
                      onCreditCardWidgetChange: (_) {},
                      bankName: cubit.selectedBank ?? '',
                      cardBgColor: Colors.black,
                      glassmorphismConfig: Glassmorphism(
                        blurX: 15,
                        blurY: 15,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            ColorManager.primary.withValues(alpha: 0.3),
                            ColorManager.secondaryGreen.withValues(alpha: 0.6),
                          ],
                        ),
                      ),
                      isHolderNameVisible: true,
                      obscureCardCvv: true,
                      obscureCardNumber: false,
                      cardType: CardType.mastercard,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            CreditCardForm(
                              formKey: cubit.formKey,
                              cardNumber: cubit.cardNumber,
                              expiryDate: cubit.expiryDate,
                              cardHolderName: cubit.cardHolderName,
                              cvvCode: cubit.cvvCode,
                              obscureCvv: true,
                              obscureNumber: false,
                              onCreditCardModelChange: cubit.onCreditCardModelChange,
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<String>(
                              value: cubit.selectedBank,
                              items: cubit.egyptianBanks.map((String bank) {
                                return DropdownMenuItem<String>(
                                  value: bank,
                                  child: Text(bank),
                                );
                              }).toList(),
                              onChanged: cubit.onChangeBankName,
                              decoration: InputDecoration(
                                labelText: 'Select Bank',
                                filled: true,
                                fillColor: Colors.transparent,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              validator: (value) =>
                              value == null ? 'Please select a bank' : null,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  right: 16,
                  child: ElevatedButton(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate() &&
                          cubit.selectedBank != null) {
                        cubit.saveCard();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Save Card",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}