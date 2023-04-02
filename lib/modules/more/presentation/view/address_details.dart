import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_address.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/edit_address.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customMoreAppbar(titleText: AppString.text_address_details),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.text_permanent + AppString.text_address,
                        style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => customButtomSheet(
                                context: context,
                                height: 0.9,
                                child: const EditAddress()),
                            child: const Icon(
                              Icons.edit_square,
                              color: AppColor.hintColor,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(14),
                          ),
                          const Icon(
                            CupertinoIcons.delete,
                            color: AppColor.hintColor,
                            size: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                  ),
                  Text(
                    AppString.text_details,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor.withOpacity(0.7),
                        fontSize: Dimensions.fontSizeDefault - 2,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(8),
                  ),
                  Text(
                    AppString.text_address_dec,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor.withOpacity(0.7),
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(12),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: AppLayout.getHeight(12),
                              ),
                              _textTitle(titleText: AppString.text_area),
                              _textSubTitle(subTitleText: AppString.text_ca),
                              SizedBox(
                                height: AppLayout.getHeight(16),
                              ),
                              _textTitle(titleText: AppString.text_state),
                              _textSubTitle(subTitleText: AppString.text_texas),
                              SizedBox(
                                height: AppLayout.getHeight(16),
                              ),
                              _textTitle(titleText: AppString.text_county),
                              _textSubTitle(subTitleText: AppString.text_usa),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: AppLayout.getHeight(12),
                              ),
                              _textTitle(titleText: AppString.text_city),
                              _textSubTitle(
                                  subTitleText: AppString.text_prosaccobury),
                              SizedBox(
                                height: AppLayout.getHeight(16),
                              ),
                              _textTitle(titleText: AppString.text_zip_code),
                              _textSubTitle(subTitleText: AppString.text_768),
                              SizedBox(
                                height: AppLayout.getHeight(16),
                              ),
                              _textTitle(titleText: AppString.text_phone),
                              _textSubTitle(
                                  subTitleText: AppString.text_phone_number)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.text_current_address,
                            style: AppStyle.mid_large_text.copyWith(
                                color: AppColor.normalTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () => customButtomSheet(
                                      context: context,
                                      height: 0.9,
                                      child: AddAddress()),
                                  child: Text(
                                    AppString.text_add,
                                    style: AppStyle.mid_large_text.copyWith(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.fontSizeDefault),
                                  )),
                              Icon(
                                Icons.add,
                                color: AppColor.primaryColor,
                                size: Dimensions.fontSizeDefault + 8,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _textTitle({titleText}) {
  return Text(
    titleText,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.hintColor.withOpacity(0.7),
        fontSize: Dimensions.fontSizeDefault,
        fontWeight: FontWeight.w500),
  );
}

Widget _textSubTitle({subTitleText}) {
  return Text(
    subTitleText,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.normalTextColor.withOpacity(0.7),
        fontSize: Dimensions.fontSizeDefault + 2,
        fontWeight: FontWeight.w700),
  );
}
