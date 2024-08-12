// import 'dart:io';

// import 'package:image_picker/image_picker.dart';

// import '../base/export_view.dart';

// class FileUtility {
//   static Future<File?> addImage() async {
//     return await Get.bottomSheet<File?>(
//       backgroundColor: VColor.scaffoldBg,
//       SafeArea(
//         child: Wrap(
//           children: <Widget>[
//             ListTile(
//               leading: const Icon(Icons.photo_library),
//               title: VText('Ambil dari Galeri'),
//               onTap: () async {
//                 final pickedFile =
//                     await ImagePicker().pickImage(source: ImageSource.gallery);
//                 if (pickedFile == null)
//                   Get.back();
//                 else {
//                   Get.back(result: File(pickedFile.path));
//                 }
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo_camera),
//               title: VText('Ambil dari Kamera'),
//               onTap: () async {
//                 final pickedFile =
//                     await ImagePicker().pickImage(source: ImageSource.camera);
//                 if (pickedFile == null)
//                   Get.back();
//                 else {
//                   Get.back(result: File(pickedFile.path));
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
