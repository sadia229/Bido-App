// import 'dart:io';
// import 'package:bido/general/utils/config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../general/utils/colors.dart';
// import '../../../general/utils/text_style.dart';
//
// class EditProfilePicture extends ConsumerStatefulWidget {
//   const EditProfilePicture({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<EditProfilePicture> createState() => _EditProfilePictureState();
// }
//
// class _EditProfilePictureState extends ConsumerState<EditProfilePicture> {
//
//   File? image;
//   XFile? pickedFile;
//
//   final _picker = ImagePicker();
//   _pickImage(WidgetRef ref) async {
//     pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//       maxHeight: 400,
//       maxWidth: 400,
//       imageQuality: 50,
//     );
//
//     debugPrint(pickedFile.toString());
//
//     // if (pickedFile != null) {
//     //   image = File(pickedFile!.path);
//     //
//     //   dio.FormData formData = dio.FormData.fromMap({
//     //     'image': await dio.MultipartFile.fromFile(image!.path,
//     //         filename: image!.path.split('/').last)
//     //   });
//     //   final profileModel = await ProfileRepo().postProfilePic(data: formData);
//     //   if (profileModel != null) {
//     //     //  ref.watch(imagePickerImage.notifier).state = image!.path;
//     //     ref.read(profileNotifyProvider.notifier).getAllUsers();
//     //   }
//     // }
//   }
//
//   bool isEditable = false;
//
//   @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   setState(() {
//   //     ref.read(profileNotifyProvider.notifier).getAllUsers();
//   //   });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     // final pickedImage = ref.watch(imagePickerImage);
//     //   final profileData = ref.watch(profileNotifyProvider).image;
//
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//       color: KColor.primary,
//       height: context.screenHeight * 0.28,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("প্রোফাইল", style: KTextStyle.headline1,),
//           const SizedBox(height: 15),
//           profile.image != null
//               ? InkWell(
//             onTap: () {
//               _pickImage(ref);
//               isEditable = false;
//               // setState(() {
//               //   ref.refresh(profileNotifyProvider.notifier).getAllUsers();
//               // });
//             },
//             child: Center(
//               child: Stack(
//                 children: [
//                   Container(
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         fit: BoxFit.contain,
//                         image: NetworkImage(
//                             Urls.imageBaseUrl + profile.image.toString()),
//                       ),
//                     ),
//                   ),
//                   const Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Icon(
//                       Icons.camera_alt,
//                       color: Colors.blue,
//                       size: 30,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//               : InkWell(
//             onTap: () {
//               _pickImage(ref);
//               isEditable = false;
//             },
//             child: Center(
//               child: Stack(children: [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundColor: KColor.white,
//                 ),
//                 const Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: Icon(
//                     Icons.camera_alt,
//                     color: Colors.blue,
//                     size: 30,
//                   ),
//                 )
//               ]),
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }