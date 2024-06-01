import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:take_home_test_pi/app/modules/profile/widgets/field_widget.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/avatar.jpeg'),
                )),
          ),
          FieldWidget(title: 'Nama Lengkap', value: 'Harri Hidayat'),
          FieldWidget(title: 'Email', value: 'harrihidayat92@gmail.com'),
          FieldWidget(title: 'Tempat Tinggal', value: 'Bogor'),
          FieldWidget(title: 'Pengalaman Bekerja', value: '1 Tahun'),
        ],
      ),
    );
  }
}
