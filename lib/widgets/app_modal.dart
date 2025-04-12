import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';

import 'app_buttons.dart';

class AppModal {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    ModalStyle modalStyle = ModalStyle.ok,
    VoidCallback? onOk,
    VoidCallback? onYes,
    VoidCallback? onNo,
  }) {
    Dialogs.materialDialog(
      context: context,
      title: title,
      color: Theme.of(context).scaffoldBackgroundColor,
      titleStyle: const TextStyle(
        fontSize: 8 * 2,
        fontWeight: FontWeight.bold,
      ),
      msg: message,
      msgStyle: TextStyle(
          color:
              Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(.5)),
      actionsBuilder: (context) => _buildDialogActions(
        context,
        modalStyle: modalStyle,
        onOk: onOk,
        onYes: onYes,
        onNo: onNo,
      ),
    );
  }

  static List<Widget> _buildDialogActions(
    BuildContext context, {
    required ModalStyle modalStyle,
    VoidCallback? onOk,
    VoidCallback? onYes,
    VoidCallback? onNo,
  }) {
    switch (modalStyle) {
      case ModalStyle.ok:
        return [
          AppTextButton(
            onTap: onOk ?? () => Navigator.of(context).pop(),
            label: "OK",
            padding: ButtonPadding.small,
          ),
        ];
      case ModalStyle.yesNo:
        return [
          AppTextButton(
            onTap: onYes ?? () => Navigator.of(context).pop(),
            label: "Yes",
            padding: ButtonPadding.small,
          ),
          AppTextButton(
            onTap: onNo ?? () => Navigator.of(context).pop(),
            label: "No",
            padding: ButtonPadding.small,
            variant: ButtonVariant.secondary,
          ),
        ];
      default:
        return [];
    }
  }
}

enum ModalStyle { ok, yesNo }
