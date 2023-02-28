import 'dart:io';
import 'package:bido/apps/main_screen.dart';
import 'package:bido/apps/sell/providers/date_provider.dart';
import 'package:bido/apps/sell/providers/seller_provider.dart';
import 'package:bido/general/utils/colors.dart';
import 'package:bido/general/utils/config.dart';
import 'package:bido/general/utils/text_style.dart';
import 'package:bido/widgets/button/custom_btn.dart';
import 'package:bido/widgets/button/icon_btn.dart';
import 'package:bido/widgets/textField/description_textfield.dart';
import 'package:bido/widgets/toast/k_toasr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../general/service/page_transition.dart';
import '../../widgets/textField/k_textField.dart';

class SellScreen extends ConsumerStatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends ConsumerState<SellScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController bidPrice = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  SellerProvider sellerProvider = SellerProvider();
  String imageUrl = '';
  XFile? pic;

  @override
  Widget build(BuildContext context) {
    final date = ref.watch(dateProvider);
    SellerProvider seller = SellerProvider();

    return Scaffold(
     appBar: AppBar(
        elevation: 0,
        backgroundColor: KColor.primary,
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _addProducts("Product Name", name, "Product Name"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product Description", style: KTextStyle.title4),
                    const SizedBox(height: 8),
                    DescriptionTextField(
                      label: "Product Description",
                      controller: description,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                _addProducts("Bid Price", bidPrice, "Bid Price"),
                InkWell(
                  onTap: () async {
                    String a = await seller.pickDate(context: context);
                    ref.read(dateProvider.notifier).dateUpdate(a);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: date.isEmpty
                            ? Text("End Date", style: KTextStyle.title4)
                            : Text(date, style: KTextStyle.title4),
                      ),
                      Icon(CupertinoIcons.calendar, color: KColor.primary),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pick a Photo", style: KTextStyle.title4),
                    const SizedBox(height: 10),
                    IconBtn(
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.camera);
                        pic = file;
                        if (file == null) return;
                        String uniqueFileName =
                            DateTime.now().millisecondsSinceEpoch.toString();
                        Reference referenceRoot =
                            FirebaseStorage.instance.ref();
                        Reference referenceDirImages =
                            referenceRoot.child('images');
                        Reference referenceImageToUpload =
                            referenceDirImages.child('name');
                        try {
                          await referenceImageToUpload.putFile(File(file.path));
                          imageUrl =
                              await referenceImageToUpload.getDownloadURL();
                        } catch (error) {}
                      },
                    ),
                  ],
                ),
                SizedBox(height: context.screenHeight * 0.08),
                KButton(
                  btnColor: KColor.primary,
                  btnWidth: context.screenWidth,
                  btnText: "Add",
                  tap: () async {
                    if (key.currentState!.validate()) {
                      sellerProvider.addList(
                        name: name.text,
                        description: description.text,
                        price: bidPrice.text,
                        date: date,
                        image: imageUrl,
                      );
                      Navigator.pushReplacement(
                        context,
                        BottomTransition(const MainScreen()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _addProducts(text, TextEditingController controller, label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: KTextStyle.title4),
        const SizedBox(height: 8),
        KTextField(
          label: label,
          controller: controller,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
