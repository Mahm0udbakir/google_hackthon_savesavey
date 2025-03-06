import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/presentation/screens/newCustomerScreen/widgets/capture_selfie_image.dart';
import 'package:google_hackthon_savesavey/business_logic/newBankAccountCubit/new_bank_account_cubit.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';
import '../../../helpers/text_styles.dart';
import 'widgets/new_customer_screen_bloc_builder.dart';

class NewCustomerScreen extends StatelessWidget {
  const NewCustomerScreen({super.key});

  void _showImageSourceOptions(BuildContext context) {
    var cubit = NewBankAccountCubit.get(context);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Pick from Gallery'),
            onTap: () {
              cubit.pickImageFromGallery();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Capture Image'),
            onTap: () {
              cubit.pickImageFromCamera();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('New Bank Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CaptureSelfieImage(),
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: () => _showImageSourceOptions(context),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(ColorManager.blueDark),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  'Select Card Image Source',
                  style: TextStyles.font16WhiteRegular,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Expanded(
                child: NewCustomerScreenBlocBuilder(),
            ),

          ],
        ),
      ),
    );
  }
}
