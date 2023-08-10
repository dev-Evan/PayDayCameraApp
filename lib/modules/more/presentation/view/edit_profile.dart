import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/input_note.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/widget/warning_message.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/edit_profile_drop_dawon_cnt.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/defult_date_of_birth_field.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/widget/loading_indicator.dart';
import '../../../auth/presentation/view/sign_in.dart';
import '../controller/common_controller/date_of_birth_controller.dart';
import '../controller/user_profile_controller.dart';
import '../widget/address_details_widget.dart';

class EditProfile extends GetView<ProfileDataController> {
  EditProfile({Key? key}) : super(key: key);

  final List<String> _locations = [AppString.text_male, AppString.text_female];
  String? dropdownValue;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: const CustomAppbar(),
        body: controller.obx(
            (state) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customMoreAppbar(titleText: AppString.text_edit_profile),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //user info layout here
                            _userInfoFieldLayout(),
                            textFieldTitleText(titleText: AppString.text_email),
                            //user email layout here
                            _userEmailLayout(),
                            textFieldTitleText(
                                titleText: AppString.text_gender_text),
                            //user gender layout here
                            _userGenderLayout(context),
                            textFieldTitleText(titleText: AppString.text_phone),
                            //user contact info layout here
                            _userContactLayout(),
                            textFieldTitleText(
                                titleText: AppString.text_address_details),
                            //user address layout here
                            _userAddressLayout(),
                            textFieldTitleText(
                                titleText: AppString.text_date_of_birth),
                            //user date of birth layout here
                            _dateOfBirthLayout(context),
                            textFieldTitleText(
                                titleText: AppString.text_about_me),
                            _aboutMeLayout()
                          ],
                        ),
                      ),
                      _saveButtonLayout(context)

                    ],
                  ),
                ),
            onLoading: const LoadingIndicator()),
      ),
    );
  }

  _firstNameLayout() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFieldTitleText(
              titleText: "${AppString.text_first} ${AppString.text_name}"),
          CustomTextField(
            hintText: AppString.text_enter_first_name,
            controller:
                Get.find<InputTextFieldController>().firstNameController,
            validator: (value) {
              if (value!.isEmpty) {
                showWarningMessage(
                    message: AppString.the_first_name_field_is_required);
                return AppString.fieldIsRequired;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  _lastNameLayout() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFieldTitleText(
              titleText: "${AppString.text_last} ${AppString.text_name}"),
          CustomTextField(
            hintText: AppString.text_enter_last_name,
            controller: Get.find<InputTextFieldController>().lastNameController,
          ),
        ],
      ),
    );
  }

  _userInfoFieldLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _firstNameLayout(),
        customSpacerWidth(width: 12),
        _lastNameLayout()
      ],
    );
  }

  _userEmailLayout() {
    return CustomTextField(
      hintText: AppString.text_enter_email,
      controller: Get.find<InputTextFieldController>().emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return AppString.the_email_field_is_required;
        } else if (value.isEmpty || !RegExp(emailExp()).hasMatch(value)) {
          return AppString.please_insert_a_valid_email_address;
        } else {
          return null;
        }
      },
    );
  }

  _userGenderLayout(context) {
    return Obx(() => dropDownField(context: context, locations: _locations));
  }

  _userContactLayout() {
    return phoneAndCountyField(
      controller: Get.find<InputTextFieldController>().contactController,
    );
  }

  _userAddressLayout() {
    return InputNote(
      hintText: AppString.text_enter_your_address,
      controller: Get.find<InputTextFieldController>().addressController,
    );
  }

  _dateOfBirthLayout(context) {
    return Obx(() => dateOfBirthField(context: context));
  }

  _aboutMeLayout() {
    return InputNote(
      hintText: AppString.text_add_about_me_here,
      controller: Get.find<InputTextFieldController>().aboutMeController,
    );
  }

  _saveButtonLayout(context) {
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: CustomButton(AppString.text_save, () {
        if (_formKey.currentState!.validate()) {
          Get.find<ProfileDataController>()
              .editProfileData(
              context: context,
              firstName:
              Get.find<InputTextFieldController>()
                  .firstNameController
                  .text,
              lastName:
              Get.find<InputTextFieldController>()
                  .lastNameController
                  .text,
              email: Get.find<InputTextFieldController>()
                  .emailController
                  .text,
              contact:
              Get.find<InputTextFieldController>()
                  .contactController
                  .text,
              dob: Get.find<DatePickerController>()
                  .dobDateController
                  .value
                  .text,
              dropDown: Get.find<DropdownBtnController>()
                  .value
                  .toString(),
              aboutMe:
              Get.find<InputTextFieldController>()
                  .aboutMeController
                  .text,
              address:
              Get.find<InputTextFieldController>()
                  .addressController
                  .text)
              .then((value) {
            if (value == true) {
              Get.back(canPop: false);
              controller.getProfileData();
            }
          });
        }
      }),
    );
  }
}
