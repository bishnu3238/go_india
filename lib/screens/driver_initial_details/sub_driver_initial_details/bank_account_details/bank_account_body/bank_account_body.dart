import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/screens/common/common.dart';

import '../../../../../package/package/package.dart';
import '../../../../../utility/utility/utility.dart';
import '../export.dart';

class BankAccountDetailsBody extends StatelessWidget {
  const BankAccountDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = context.watch<BankAccountDetailsCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: edgeInsets10,
        child: BlocBuilder<BankAccountDetailsCubit, BankAccountState>(
            builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bank Account Details',
                style: gideonRoman(
                  weight: fw7,
                  size: getScreenWidth(kLayoutWidth * 1 / 20),
                ),
              ),
              const SizedBox(height: 20),
              const   ContainerImageShow(image: passbookImage,        imgType:  ImgType.local,
                ),
              const SizedBox(height: 20),
              CardHeadingListTile(
                tileAlign: ListTileTitleAlignment.top,
                leading:   Icon(Icons.check, color: theme.colorScheme.scrim,),
                title: Text(documentLimetText, style: gideonRoman()),
              ),
              const Divider(),
              const SizedBox(height: 15),
              Text("Upload Passbook / Cheque", style: gideonRoman(weight: fw7)),
              const SizedBox(height: 10),
              ImagePicker(
                  label: state.passbookImage.isEmpty
                      ? 'SELECT IMAGE'
                      : 'IMAGE PICKED',
                  iColor: state.passbookImage.isEmpty
                      ? theme.secondaryHeaderColor
                      : theme.colorScheme.tertiary,
                  onTap: () async => await cubit.pickImage(context)),
              const SizedBox(height: 15),
              const _BankNameInput(),
              const SizedBox(height: 15),
              const _AccountNoInput(),
              const SizedBox(height: 15),
              const _IFSCCodeInput()
            ],
          );
        }),
      ),
    );
  }
}

class _AccountNoInput extends StatelessWidget {
  const _AccountNoInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankAccountDetailsCubit, BankAccountState>(
      builder: (context, state) {
        var cubit = context.read<BankAccountDetailsCubit>();
        return TowFieldColumn(
          title: 'Account Number',
          hint: 'Bank Account Number',
          onChange: cubit.changeAccount,
          inputType: TextInputType.number,
          errorText: state.accountNo.displayError != null
              ? 'Enter valid account number'
              : null,
        );
      },
    );
  }
}

class _BankNameInput extends StatelessWidget {
  const _BankNameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankAccountDetailsCubit, BankAccountState>(
      builder: (context, state) {
        var cubit = context.read<BankAccountDetailsCubit>();
        return TowFieldColumn(
          title: 'Bank Name',
          hint: 'Bank Name',
          capitalization: TextCapitalization.words,
          onChange: cubit.changeBank,
          errorText: state.bankName.displayError != null
              ? 'Enter valid Bank Name'
              : null,
        );
      },
    );
  }
}

class _IFSCCodeInput extends StatelessWidget {
  const _IFSCCodeInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankAccountDetailsCubit, BankAccountState>(
      builder: (context, state) {
        var cubit = context.read<BankAccountDetailsCubit>();
        return TowFieldColumn(
          title: 'IFSC Code',
          hint: 'IFSC Code',
          example: 'e.g. SBIN0000000',
          capitalization: TextCapitalization.characters,
          onChange: cubit.changeIfscCode,
          errorText: state.ifscCode.displayError != null
              ? 'Enter valid ifsc code'
              : null,
        );
      },
    );
  }
}
