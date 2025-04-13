

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../business_logic/cardCubit/card_cubit.dart';
import '../../business_logic/cardCubit/card_states.dart';
import '../../helpers/color_manager.dart';
import '../../router/routes.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => CardCubit.get(context).getUserCard());
  }


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CardCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Credit Card',
              style: TextStyle(
                color: ColorManager.gray30,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),

        /// BlocBuilder to listen to state changes
        BlocBuilder<CardCubit, CardStates>(
          builder: (context, state) {
            if (state is CardFetchLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CardFetchSuccessState) {
              return CreditCardWidget(
                cardNumber: cubit.cardNumber,
                expiryDate: cubit.expiryDate,
                cardHolderName: cubit.cardHolderName,
                cvvCode: cubit.cvvCode,
                showBackView: cubit.isCvvFocused,
                onCreditCardWidgetChange: (_) {},
                bankName: cubit.selectedBank ?? '',
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
              );
            } else if (state is CardFetchEmptyState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No card saved yet.',
                  style: TextStyle(color: ColorManager.gray30),
                ),
              );
            } else if (state is CardFetchErrorState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Something went wrong:\n${state.error}',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return const SizedBox();
          },
        ),

        const Spacer(),

        /// Add new card dotted button
        Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorManager.gray70.withAlpha(50),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.addCardScreen);
                },
                child: DottedBorder(
                  dashPattern: const [3, 4],
                  borderType: BorderType.RRect,
                  // borderType: BorderType.RRect,
                  radius: const Radius.circular(16),
                  color: ColorManager.gray60,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add new card',
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorManager.gray30,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.add_circle_outline,
                          size: 19,
                          color: ColorManager.gray30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
