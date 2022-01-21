import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String? food, price, desc, add_ons, base64;
  XFile? imageFile;
  bool picked = false;
  String? _image;

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    // _cropImage(pickedFile.path);
    imageFile = pickedFile;
    //  uploadImage(pickedFile!);
  }

  /// Crop Image
  // _cropImage(filePath) async {
  //   File croppedImage = await ImageCropper.cropImage(
  //     sourcePath: filePath,
  //     compressFormat: ImageCompressFormat.png,
  //     maxWidth: 1080,
  //     maxHeight: 1080,
  //     aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
  //   );
  //   if (croppedImage != null) {
  //     imageFile = croppedImage;
  //     uploadImage(File(imageFile.path));
  //     setState(() {
  //       picked = true;
  //     });
  //   }
  // }

  // Future<void> uploadImage(XFile file) async {

  //    firebase_storage.UploadTask uploadTask;

  //   // Create a Reference to the file
  //   firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child('playground')
  //       .child('/some-image.jpg');

  //   final metadata = firebase_storage.SettableMetadata(
  //       contentType: 'image/jpeg',
  //       customMetadata: {'picked-file-path': file.path});

        
  //   // Storager storageReference;
  //   // storageReference = FirebaseStorage.instance.ref().child(
  //   //     "food_img/${box.read("user")["id_no"]}" + DateTime.now().toString());
  //   // final StorageUploadTask uploadTask = storageReference.putFile(file);
  //   // final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
  //   // final String url = (await downloadUrl.ref.getDownloadURL());
  //   // print("URL is $url");
  //   // setState(() {
  //   //   _image = url;
  //   // });
  //   // updateshopImage({"shop_image" : url});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Food"),
        centerTitle: true,
        backgroundColor: Color(0xff701504),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Product Image", style: TextStyle(fontSize: 15)),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                      _getFromGallery();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.photo_library,
                            color: Colors.white,
                            size: 15,
                          ),
                          // SizedBox(width: 5,),
                          Text(
                            picked ? "Change" : " Upload",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      // Text(
                      //   picked ? "Change" : "Select",
                      //   style: TextStyle(
                      //       fontSize: 12, fontWeight: FontWeight.w700),
                      // ),
                      color: Colors.green,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(14),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: picked
                  ? Image.file(
                     File(imageFile!.path),
                      fit: BoxFit.cover,
                    )
                  : Container(),
            ),
            picked
                ? SizedBox(
                    height: 20,
                  )
                : Container(),
            // new Form(
            //   key: _key,
            //   autovalidate: _validate,
            //   // child: FormUI(),
            // ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.8,
                child: RaisedButton(
                  color: Color(0xff701504),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    // _inputValidate();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}