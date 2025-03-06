import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/newBankAccountCubit/new_bank_account_cubit.dart';
import '../../../../business_logic/newBankAccountCubit/new_bank_account_states.dart';
import '../../../../helpers/color_manager.dart';
import '../../../../helpers/text_styles.dart';
import '../../../../router/routes.dart';

class NewCustomerScreenBlocBuilder extends StatelessWidget {
  const NewCustomerScreenBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewBankAccountCubit, NewBankAccountStates>(
      listener: (context, state) {
        if (state is PostBankAccountSuccessState) {
          Navigator.pushReplacementNamed(context, Routes.homeScreen);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Account created successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is PostBankAccountErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to create account. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = NewBankAccountCubit.get(context);

        if (state is TextDetectionLoadingState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: ColorManager.blueDark,
                ),
                SizedBox(height: 10),
                Text(
                  "Processing text, please wait...",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                if (cubit.selectedCardFile != null) ...[
                  Image.file(
                    cubit.selectedCardFile!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                ],
                if (state is TextDetectionSuccessState) ...[
                  TextFormField(
                    controller: cubit.textController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: "Extracted Text",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Fill your data here',
                          style: TextStyles.font16LightBlackRegular,
                        ),
                        Icon(Icons.arrow_circle_down),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: cubit.nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: cubit.idController,
                    decoration: const InputDecoration(
                      labelText: "ID Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: cubit.dobController,
                    decoration: const InputDecoration(
                      labelText: "Date of Birth",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: cubit.bankController,
                    decoration: const InputDecoration(
                      labelText: "Bank Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint("FormKey current state: ${cubit.formKey.currentState}");
                        if (cubit.formKey.currentState?.validate() ?? false) {
                          cubit.postNewBankAccount();
                        }

                      },
                      style: ButtonStyle(
                        backgroundColor:
                        WidgetStatePropertyAll(ColorManager.blueDark),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyles.font16WhiteRegular,
                      ),
                    ),
                  ),
                ],
                if (state is TextDetectionErrorState) ...[
                  const Text(
                    "Failed to extract text.",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
