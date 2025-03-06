import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_hackthon_savesavey/business_logic/newBankAccountCubit/new_bank_account_cubit.dart';
import 'package:google_hackthon_savesavey/business_logic/newBankAccountCubit/new_bank_account_states.dart';

class CaptureSelfieImage extends StatelessWidget {
  const CaptureSelfieImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<NewBankAccountCubit, NewBankAccountStates, File?>(
      selector: (state) {
        return NewBankAccountCubit.get(context).imageSelfieFile;
      },
      builder: (context, selfieFile) {
        var cubit = NewBankAccountCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              cubit.captureSelfie();
            },
            child: Stack(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: selfieFile != null
                        ? Image.file(
                      selfieFile,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                        : Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.add_a_photo,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
