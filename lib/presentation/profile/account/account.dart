import 'package:flutter/material.dart';
import 'package:trek_trak/infrastructure/repository/Auth_repos/forgot_repo.dart';
import 'package:trek_trak/presentation/profile/account/inner_screens/fieldss.dart';
import 'package:trek_trak/utils/divider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  ResetPassRespo pass = ResetPassRespo();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const rating(),
              // Dividers.lineOne(),
              changePaswword(pass: pass),
              // const postalAddress(),
              Dividers.lineOne(),
              const TermsAndConditions(),
              const DataProtection(),
              // const moreInfo(),
              Dividers.lineOne(),
              const LogOutButton(),
              Dividers.lineOne(),
              const CloseAccount(),
            ],
          ),
        ),
      ),
    ));
  }
}
