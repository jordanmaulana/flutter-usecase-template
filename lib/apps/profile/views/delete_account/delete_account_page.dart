import 'package:flutter_usecase_template/apps/profile/controllers/delete_account_controller.dart';
import 'package:flutter_usecase_template/base/export_view.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    DeleteAccountController controller = Get.put(DeleteAccountController());
    return Padding(
      padding: EdgeInsets.all(context.mdPadding),
      child: Column(
        spacing: context.mdPadding,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: context.smPadding,
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedAlert01,
                color: VColor.error,
              ),
              VText(
                'Delete Account',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          VText(
              'This action cannot be undone. Once you delete your account, all of your data will be permanently removed.'),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(context.mdPadding),
            decoration: BoxDecoration(
              color: VColor.errorAccent,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: VColor.error),
            ),
            child: Column(
              spacing: context.mdPadding,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'To confirm, please type ',
                    style: TextStyle(color: VColor.error),
                    children: [
                      TextSpan(
                        text: 'DELETE',
                        style: TextStyle(
                          color: VColor.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' in the field below:',
                        style: TextStyle(color: VColor.error),
                      ),
                    ],
                  ),
                ),
                VFormInput(
                  hint: 'Type DELETE here',
                  fillColor: VColor.white,
                  textCapitalization: TextCapitalization.characters,
                  onChanged: controller.onChange,
                ),
              ],
            ),
          ),
          Row(
            spacing: context.mdPadding,
            children: [
              Expanded(
                child: SecondaryButton(
                  'Cancel',
                  onTap: () => Get.back(),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (controller.isInputValid.isTrue) controller.submit();
                  },
                  child: Obx(
                    () => Opacity(
                      opacity: controller.isInputValid.isTrue ? 1.0 : 0.5,
                      child: Container(
                        width: double.infinity,
                        height: 44.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: VColor.error,
                        ),
                        child: VText(
                          'Delete Account',
                          color: VColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
