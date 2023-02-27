import 'dart:io';

import 'package:bido/apps/main_screen.dart';
import 'package:bido/general/service/page_transition.dart';
import 'package:bido/widgets/toast/k_toasr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class SellerProvider {
  KToast toast = KToast();

  addList(
      {required String name,
      required String description,
      required String price,
      required String date,
      required String image,
      context}) async {
    try {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('product-list');
      if (image.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please upload an image'),
          ),
        );
        return;
      }
      Map<String, String> dataToSend = {
        'name': name,
        'description': description,
        'price': price,
        'current-date': date,
        'image': image,
      };
      reference.add(dataToSend);
      Navigator.pushReplacement(
        context,
        BottomTransition(const MainScreen()),
      );
    } catch (e) {
      //toast.toastMsg(msg: "$e");
    }
  }

  Future<String> pickDate({context}) async {
    final f = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 2),
    );
    return DateFormat(
      'yyyy-MM-dd',
    ).format(f!).toString();
  }

  pickImage({ image}) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
    print('${file?.path}');
    if (file == null) return;
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageToUpload = referenceDirImages.child('name');
    try {
      await referenceImageToUpload.putFile(File(file.path));
      image = await referenceImageToUpload.getDownloadURL();
    } catch (error) {
      ///
    }
  }
}
