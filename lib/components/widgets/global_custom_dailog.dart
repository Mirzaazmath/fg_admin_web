import 'package:admin_panel/components/dailogs/allocate_bowser_dailog.dart';
import 'package:admin_panel/components/dailogs/cancel_order_dailog.dart';
import 'package:admin_panel/components/dailogs/confirm_order_dialog.dart';
import 'package:admin_panel/provider/dialog_provider.dart';
import 'package:flutter/material.dart';
import '../dailogs/refund_initiate_dailog.dart';
import 'package:provider/provider.dart';

showCustomDialog(context,selectedOption){
  Provider.of<DialogProvider>(context,listen: false).updateOption(selectedOption);
  showDialog(context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return  const GlobalCustomDialogBox();
  }
  );
}

class GlobalCustomDialogBox extends StatelessWidget {
  const GlobalCustomDialogBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Consumer<DialogProvider>(
     builder: (BuildContext context, provider, Widget? child) {
      return dialogWidget(provider.selectOption);
    }
      )
    );
  }
  Widget dialogWidget(String option){

    switch(option) {

      case "Confirm order":
      {
      return const  ConfirmOrderDialogBox();
      }

      case "Allocate bowser":
        {
          return const  AllocateBowserDialogBox();
        }
      case "Cancel order":
        {
          return const  CancelOrderDialogBox();
        }
      case "Initiate refund":
        {
          return const  RefundInitiateDialogBox();
        }

        default: {
        return Container();
      }

    }

  }
}
