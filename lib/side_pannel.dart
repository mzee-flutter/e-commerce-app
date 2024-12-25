import 'dart:io';

import 'package:flutter/material.dart';
import 'package:e_commerce/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class SidePannel extends StatefulWidget {
  static const String id = 'side_pannel';
  State<SidePannel> createState() => SidePannelState();
}

class SidePannelState extends State<SidePannel> {
  String? fullName;
  final auth = FirebaseAuth.instance;
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final image = await _imagePicker.pickImage(source: source);
    setState(
      () {
        _imageFile = image;
      },
    );
  }

  void showImageSourceSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library_rounded),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Object? argument = ModalRoute.of(context)!.settings.arguments;
    fullName = (argument is String) ? argument : 'guest';
    return Drawer(
      backgroundColor: Color(0xffEFEFEF),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xff67802F),
                  width: 2,
                ),
                image: DecorationImage(
                  image: _imageFile != null
                      ? FileImage(
                          File(_imageFile!.path),
                        ) as ImageProvider
                      : AssetImage('images/imageNO.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  InkWell(
                    onTap: () {
                      showImageSourceSheet(context);
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(
                            0xff67802F,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.add_a_photo_rounded,
                        size: 15,
                        color: Color(0xff67802F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${fullName}',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 7,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Active status'),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileField(
                        fieldName: 'Edit Profile',
                        fieldIcon: Icons.person,
                        fieldEditIcon: Icons.arrow_forward_ios,
                      ),
                      ProfileField(
                        fieldName: 'Shopping Address',
                        fieldIcon: Icons.location_on,
                        fieldEditIcon: Icons.arrow_forward_ios,
                      ),
                      ProfileField(
                        fieldName: 'Wishlist',
                        fieldIcon: Icons.favorite,
                        fieldEditIcon: Icons.arrow_forward_ios,
                      ),
                      ProfileField(
                        fieldName: 'Order History',
                        fieldIcon: Icons.history,
                        fieldEditIcon: Icons.arrow_forward_ios,
                      ),
                      ProfileField(
                        fieldName: 'Notification',
                        fieldIcon: Icons.notifications,
                        fieldEditIcon: Icons.arrow_forward_ios,
                      ),
                      ProfileField(
                        fieldName: 'Cards',
                        fieldIcon: Icons.credit_card_outlined,
                        fieldEditIcon: Icons.arrow_forward_ios,
                      ),
                      InkWell(
                        onTap: () {
                          auth.signOut();
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                        child: Row(
                          children: [
                            Flexible(
                              child: ListTile(
                                leading: Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                  size: 21,
                                ),
                                title: Text(
                                  'Log out',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  ProfileField({
    required this.fieldName,
    required this.fieldIcon,
    required this.fieldEditIcon,
  });

  final String fieldName;
  final IconData fieldIcon;
  final IconData fieldEditIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ListTile(
            leading: Icon(
              fieldIcon,
              color: Colors.grey[600],
              size: 21,
            ),
            title: Text(
              fieldName,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Icon(
          fieldEditIcon,
          size: 16,
          color: Colors.grey[600],
        ),
      ],
    );
  }
}
