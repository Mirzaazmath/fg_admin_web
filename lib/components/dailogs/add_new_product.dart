import 'package:admin_panel/components/widgets/bottons/color_btn.dart';
import 'package:flutter/material.dart';
import '../../presentation/dashboard_page.dart';
import '../../utils/drop_down_utils.dart';
import '../../utils/text_feild_utils.dart';
import '../../utils/text_utils.dart';
import '../widgets/bottons/border_btn.dart';
import '../widgets/bottons/text_btn.dart';
import 'add_category.dart';
import 'add_variant_dailog.dart';

class AddProductDialogBox extends StatefulWidget {
  const AddProductDialogBox({super.key});

  @override
  State<AddProductDialogBox> createState() => _AddProductDialogBoxState();
}

class _AddProductDialogBoxState extends State<AddProductDialogBox> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController productCategory = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController salesPriceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController skuController = TextEditingController();
  List<VariantModel> variantDataList = [];
  List<String> statusList = <String>[
    'Active',
    'Inactive',
  ];
  String selectedStatus = "Active";
  List<String> categoryList = [];
  bool showAddVariantSection = false;
  VariantModel? selectedVariant;
  int selectedIndex = 0;
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 622,
        height: double.infinity,
        padding: const EdgeInsets.all(36),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextUtil(
                  text: 'Add Products',
                  size: 24,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 16,
            ),
            const TitleText(text: "Product name"),
            const SizedBox(
              height: 24,
            ),
            Field(
              controller: productNameController,
              hintText: 'Product name',
            ),
            const SizedBox(
              height: 16,
            ),
            Field(
              controller: descriptionController,
              hintText: 'Description',
              maxLine: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            const TitleText(text: "Product organisation"),
            const SizedBox(
              height: 16,
            ),
            Field(
              controller: productCategory,
              hintText: 'Product Category',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextUtil(
                text: "Determines US tax rates",
                size: 12,
              ),
            ),
            const Divider(),
            TextBtn(
                width: 160,
                title: "+ Add Category",
                onTap: () {
                  _showOrderDetailDialog();
                  // showCustomDialog(context,"Add Category");
                  //Add Category
                }),
            const SizedBox(
              height: 24,
            ),
            const TitleText(text: "Pricing"),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: Field(
                  controller: priceController,
                  hintText: 'Price/Unit',
                  isNumberType: true,
                )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Field(
                  controller: salesPriceController,
                  hintText: 'Sales price',
                  isNumberType: true,
                )),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const TitleText(text: "Inventory"),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: Field(
                  controller: quantityController,
                  hintText: 'Quantity',
                  isNumberType: true,
                )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Field(
                  controller: unitPriceController,
                  hintText: 'Unit',
                  isNumberType: true,
                )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Field(
              controller: skuController,
              hintText: 'SKU (Stock Keeping Unit)',
            ),
            const SizedBox(
              height: 24,
            ),
            const TitleText(text: "Media(Multiple)"),
            const SizedBox(
              height: 16,
            ),
            BorderBtn(width: 160, title: "Upload", onTap: () {}),
            const SizedBox(
              height: 24,
            ),
            const TitleText(text: "Variants"),
            const SizedBox(
              height: 16,
            ),
            variantDataList.isEmpty
                ? const SizedBox()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: variantDataList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DescriptionText(
                                    text: variantDataList[index].title),
                                TextBtn(
                                    width: 100,
                                    title: "Edit",
                                    onTap: () {
                                      setState(() {
                                        showAddVariantSection = true;
                                        selectedIndex = index;
                                        isEdit = true;
                                        selectedVariant =
                                            variantDataList[index];
                                      });
                                    }),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Wrap(
                              runSpacing: 10,
                              children: [
                                for (int i = 0;
                                    i < variantDataList[index].values!.length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Chip(
                                        backgroundColor: appColors.chipColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        label: Text(variantDataList[index]
                                            .values![i]
                                            .subtitle)),
                                  )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
            const Divider(),
            showAddVariantSection
                ? const SizedBox()
                : Column(
                    children: [
                      TextBtn(
                          width: 160,
                          title: "+ Add option",
                          onTap: () {
                            setState(() {
                              showAddVariantSection = true;
                            });
                          }),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
            showAddVariantSection
                ? AddVariantDialogBox(
                    variantData: selectedVariant,
                    isEdit: isEdit,
                    index: selectedIndex,
                    onCancel: (){
                     setState(() {
                       showAddVariantSection = false;
                       selectedIndex = 0;
                       isEdit = false;
                       selectedVariant = null;
                     });
                    },
                    onSave: (VariantModel data) {
                      setState(() {
                        if (isEdit == true) {
                          variantDataList[selectedIndex] = data;
                        } else {
                          variantDataList.add(data);
                        }
                        showAddVariantSection = false;
                        selectedIndex = 0;
                        isEdit = false;
                        selectedVariant = null;
                      });
                    },
                  )
                : const SizedBox(),
            variantDataList.isEmpty
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleText(text: "Variant List"),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: DescriptionText(
                                text: "Variant",
                                color: appColors.blackColor,
                              )),
                          Expanded(
                              flex: 1,
                              child: DescriptionText(
                                  text: "Price", color: appColors.blackColor)),
                          Expanded(
                              flex: 1,
                              child: DescriptionText(
                                  text: "Available",
                                  color: appColors.blackColor)),
                        ],
                      ),
                      const Divider(
                        height: 32,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: variantDataList[0].values!.length,
                          itemBuilder: (context, index) {
                            final controller1 = TextEditingController();
                            final controller2 = TextEditingController();

                            return Theme(
                              data: ThemeData(dividerColor: Colors.transparent),
                              child: IgnorePointer(
                                ignoring:
                                    variantDataList.length > 1 ? false : true,
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.zero,

                                  trailing: const SizedBox(),

                                  title: Container(
                                    height: 88,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    appColors.lightGreyColor))),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              leading: Container(
                                                height: 56,
                                                width: 56,
                                                color: appColors.lightGreyColor,
                                              ),
                                              title: DescriptionText(
                                                  text: variantDataList[0]
                                                      .values![index]
                                                      .subtitle,
                                                  color: appColors.blackColor),
                                              subtitle: DescriptionText(
                                                  text:
                                                      variantDataList.length > 1
                                                          ? "Variant"
                                                          : "",
                                                  color: appColors.blueColor)),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 10,
                                              ),
                                              child: Field(
                                                controller: controller1,
                                                hintText: '00.00',
                                                isNumberType: true,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                              ),
                                              child: Field(
                                                controller: controller2,
                                                hintText: '0',
                                                isNumberType: true,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  ///// children for Variant
                                  children: [
                                    variantDataList.length > 1
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: variantDataList[1]
                                                    .values!
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  final controller1 =
                                                      TextEditingController();
                                                  final controller2 =
                                                      TextEditingController();

                                                  return Container(
                                                    height: 88,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: appColors
                                                                    .lightGreyColor))),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: ListTile(
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            leading: Container(
                                                              height: 56,
                                                              width: 56,
                                                              color: appColors
                                                                  .lightGreyColor,
                                                            ),
                                                            title: DescriptionText(
                                                                text: variantDataList[
                                                                        1]
                                                                    .values![
                                                                        index]
                                                                    .subtitle,
                                                                color: appColors
                                                                    .blackColor),
                                                            // subtitle: DescriptionText(
                                                            //     text: variantDataList
                                                            //                 .length >
                                                            //             1
                                                            //         ? "Variant"
                                                            //         : "",
                                                            //     color: appColors
                                                            //         .blueColor)
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 10,
                                                              ),
                                                              child: Field(
                                                                controller:
                                                                    controller1,
                                                                hintText:
                                                                    '00.00',
                                                                isNumberType:
                                                                    true,
                                                              )),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 10,
                                                              ),
                                                              child: Field(
                                                                controller:
                                                                    controller2,
                                                                hintText: '0',
                                                                isNumberType:
                                                                    true,
                                                              )),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
            Row(
              children: [
                SizedBox(
                  width: 240,
                  child: DropField(
                    selectValue: selectedStatus,
                    valueList: statusList,
                    onChange: (String value) {
                      setState(() {
                        selectedStatus = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BorderBtn(
                        width: 100,
                        title: "Close",
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    const SizedBox(
                      width: 20,
                    ),
                    ColorBtn(width: 100, title: "Save", onTap: () {})
                  ],
                ))
              ],
            ),
          ]),
        ));
  }

  _showOrderDetailDialog() async {
    final dynamic category = await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const AddCategoryDialogBox();
        });

    if (category == null) {
    } else {
      if (categoryList.contains(category)) {
      } else {
        categoryList.add(category);
      }

      setState(() {});
      print(variantDataList);
    }
  }
}
