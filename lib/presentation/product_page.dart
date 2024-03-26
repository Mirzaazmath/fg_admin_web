import 'package:flutter/material.dart';
import '../components/widgets/bottons/create_btn.dart';
import '../components/widgets/bottons/setting_btn.dart';
import '../components/widgets/chip_filter.dart';
import '../components/widgets/chip_filter_with_search.dart';
import '../components/widgets/global_custom_dailog.dart';
import '../components/widgets/pagination_widget.dart';
import '../depricated/secondary_btn.dart';
import '../models/menu_model.dart';
import '../utils/filter_chip_with_drop_down.dart';
import '../utils/text_utils.dart';
import 'dashboard_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<MenuModel> actionList = <MenuModel>[
    MenuModel(icon: Icons.edit, title: "Edit product"),
    MenuModel(icon: Icons.drafts_outlined, title: "Draft product"),
    MenuModel(icon: Icons.archive_outlined, title: "Archive product"),
    MenuModel(icon: Icons.delete_outline, title: "Delete product"),
  ];
  List<String> filterList = <String>[

    'In Draft',
    'Published',
    'Un published',
    'Archive',
  ];
  List<String> searchList = <String>[
    'Petrol',
    'White oil',
    'Diesel',
  ];
  String selectedAction = "View details";
  String selectedFilter = "";
  String searchFilter = "All";
  bool newestSelect = true;
  bool isLoad = false;
  void updateFilter() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isLoad = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: appColors.whiteColor,
          centerTitle: false,
          title: const TextUtil(
            text: "Products",
            size: 28,
          ),
          actions: [
            DownloadBtn(onTap: () {}),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            CreateBtn(
                onTap: () {
                  showCustomDialog(context, "Add New Product");
                },
                title: "Add New Product"),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  TextUtil(
                    text: "Home",
                    size: 16,
                    color: appColors.greyColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextUtil(
                    text: "Products",
                    size: 16,
                    color: appColors.blueColor,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
                height: 48,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [CustomFilterChipWithDropDown(
                    filterList: filterList,
                    selectedFilter: selectedFilter,
                    onSelect: (String value) {
                      setState(() {
                        selectedFilter=value;
                      });
                    },
                    onDelete: () {
                      setState(() {
                        selectedFilter="";
                      });
                    },
                    title: 'Status',
                  ),

                    // ChipFilterBtn(
                    //   selectedFilter: selectedFilter,
                    //   filterList: filterList,
                    //   onChange: (val) {
                    //     setState(() {
                    //       selectedFilter = val!;
                    //       isLoad = true;
                    //     });
                    //     updateFilter();
                    //   },
                    //   constantValue: "Status",
                    // ),
                    ChipFilterBtnWithSearch(
                      selectedFilter: searchFilter,
                      filterList: searchList,
                      onChange: (val) {
                        setState(() {
                          searchFilter = val!;
                        });
                      },
                      constantValue: "All",
                      hintText: "Search by name/phone number",
                    ),
                    TextButton(onPressed: (){
                      setState(() {
                        selectedFilter="";
                      });
                    }, child:const  TextUtil(text: "Clear Filter",size: 14,), ),
                    const Expanded(child: SizedBox()),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: VerticalDivider(
                        width: 32,
                      ),
                    ),
                    FilterChip(
                        selected: newestSelect,
                        selectedColor: appColors.secondaryColor,
                        label: const Text("Newest first"),
                        onSelected: (value) {
                          setState(() {
                            newestSelect = value;
                          });
                        })
                  ],
                )),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      height: 58,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: appColors.lightGreyColor))),
                      child: const Row(
                        children: [
                          Expanded(
                              child: HeadingText(
                            text: "Product ID",
                          )),
                          Expanded(
                              child: HeadingText(
                            text: "Name",
                          )),
                          Expanded(
                            child: HeadingText(
                              text: "Inventory",
                            ),
                          ),
                          Expanded(
                            child: HeadingText(
                              text: "Variants",
                            ),
                          ),
                          Expanded(
                              child: HeadingText(
                            text: "Price",
                          )),
                          Expanded(
                              child: HeadingText(
                            text: "Status",
                          )),
                          Expanded(
                              child: HeadingText(
                            text: "Actions",
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                        child: isLoad
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: 100,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 58,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    appColors.lightGreyColor))),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                            child: DescriptionText(
                                          text: "#635363",
                                        )),
                                        const Expanded(
                                          child: DescriptionText(
                                            text: "Petrol",
                                          ),
                                        ),
                                        const Expanded(
                                          child: DescriptionText(
                                            text: "13",
                                          ),
                                        ),
                                        const Expanded(
                                          child: DescriptionText(
                                            text: "4",
                                          ),
                                        ),
                                        const Expanded(
                                          child: DescriptionText(
                                            text: "1983.00",
                                          ),
                                        ),
                                        Expanded(
                                            child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 90,
                                            height: 20,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: selectedFilter == "Draft"
                                                    ? appColors.redColor
                                                    : index.isEven &&
                                                            selectedFilter ==
                                                                ""
                                                        ? appColors.redColor
                                                        : appColors.blueColor,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: TextUtil(
                                              text: selectedFilter==""?"All":selectedFilter,
                                              color: appColors.whiteColor,
                                              size: 11,
                                            ),
                                          ),
                                        )),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      //_showCreateCustomerDialog(false);
                                                      //View details
                                                    },
                                                    icon: const Icon(Icons
                                                        .visibility_outlined)),
                                                PopupMenuButton(
                                                  itemBuilder:
                                                      (BuildContext context) =>
                                                          [
                                                    PopupMenuItem(
                                                      enabled: false,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8),
                                                        child: Column(
                                                          children: [
                                                            for (int i = 0;
                                                                i <
                                                                    actionList
                                                                        .length;
                                                                i++) ...[
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                  // if(i==0){
                                                                  //   _showCreateCustomerDialog(true);
                                                                  // }else if (i==actionList.length-1){
                                                                  //   showSnackBar(context,"Driver Deactivated");
                                                                  //
                                                                  // }else{
                                                                  //   showCustomDialog(context,actionList[i].title);
                                                                  // }
                                                                  // showCustomDialog(context,actionList[i].title);
                                                                },
                                                                child: SizedBox(
                                                                  height: 56,
                                                                  width: 200,
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(
                                                                        actionList[i]
                                                                            .icon,
                                                                        color: appColors
                                                                            .blackColor,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            12,
                                                                      ),
                                                                      TextUtil(
                                                                        text: actionList[i]
                                                                            .title,
                                                                        size:
                                                                            16,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ]
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                })),
                    const PaginationWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
