import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflex/views/profil/bloc/profile_bloc.dart';
import 'package:movieflex/views/profil/bloc/profile_event.dart';

class EdithPage extends StatefulWidget {
  const EdithPage({super.key, required this.title});

  final String title;

  @override
  State<EdithPage> createState() => _EdithPageState();
}

class _EdithPageState extends State<EdithPage> {
  late TextEditingController _fullNameController;
  late TextEditingController _nicknameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  late String _selectedGender;
  late String _selectedCountry;

  @override
  void initState() {
    super.initState();
    final user = context.read<ProfileBloc>().state.user;

    _fullNameController = TextEditingController(text: user.fullName);
    _nicknameController = TextEditingController(text: user.nickname);
    _emailController = TextEditingController(text: user.email);
    _phoneController = TextEditingController(text: user.phone);
    _selectedGender = user.gender;
    _selectedCountry = user.country;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _nicknameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String hintText, {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: const Color(0xFFFAFAFA),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.watch<ProfileBloc>();
    final user = profileBloc.state.user;

    ImageProvider avatarImage;
    if (user.imagePath != null && user.imagePath!.isNotEmpty) {
      avatarImage = FileImage(File(user.imagePath!));
    } else {
      avatarImage = const AssetImage("assets/images/tom.jpg");
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.title.isNotEmpty ? widget.title : "Edit Profile",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // Avatar + Sélection Image
            Center(
              child: Stack(
                children: [
                  CircleAvatar(radius: 50, backgroundImage: avatarImage),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        context.read<ProfileBloc>().add(
                          PickProfileImageEvent(),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Champs de saisie
            TextFormField(
              controller: _fullNameController,
              decoration: _inputDecoration("Full Name"),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _nicknameController,
              decoration: _inputDecoration("Nickname"),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: _inputDecoration(
                "Email",
                suffixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: _inputDecoration(
                "Phone Number",
                suffixIcon: const Icon(
                  Icons.phone_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: _selectedGender,
              decoration: _inputDecoration("Gender"),
              items: ["Male", "Female", "Other"]
                  .map(
                    (gender) =>
                        DropdownMenuItem(value: gender, child: Text(gender)),
                  )
                  .toList(),
              onChanged: (val) {
                if (val != null) setState(() => _selectedGender = val);
              },
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: _selectedCountry,
              decoration: _inputDecoration("Country"),
              items: ["Côte d'Ivoire", "United States", "France", "Canada"]
                  .map(
                    (country) =>
                        DropdownMenuItem(value: country, child: Text(country)),
                  )
                  .toList(),
              onChanged: (val) {
                if (val != null) setState(() => _selectedCountry = val);
              },
            ),

            const SizedBox(height: 32),

            // Bouton Update
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: () {
                  final updatedUser = user.copyWith(
                    fullName: _fullNameController.text,
                    nickname: _nicknameController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    gender: _selectedGender,
                    country: _selectedCountry,
                  );

                  context.read<ProfileBloc>().add(
                    UpdateProfileEvent(updatedUser),
                  );

                  Navigator.pop(context);
                },
                child: const Text(
                  "Update",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
