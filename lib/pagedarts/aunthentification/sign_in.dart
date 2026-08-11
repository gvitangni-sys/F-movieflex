import 'package:flutter/material.dart';
import 'package:movieflex/pagedarts/animation/animation.dart';
import 'package:movieflex/pagedarts/aunthentification/sign_up.dart';
import 'package:movieflex/pagedarts/home/homepage.dart';

class MyLoginpage extends StatefulWidget {
  const MyLoginpage({super.key});

  @override
  State<MyLoginpage> createState() => _MyLoginpageState();
}

class _MyLoginpageState extends State<MyLoginpage> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF000000),
        toolbarHeight: 60,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 32,
            color: Colors.white,
          ),
        ),
        title: Image.asset("assets/images/brand_movie.png", height: 80),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Help",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1500,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Email address",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true, // Requis pour que fillColor fonctionne
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              DelayedAnimation(
                delay: 2500,
                child: TextField(
                  style: const TextStyle(color: Colors.white),

                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true, // Requis pour que fillColor fonctionne
                    fillColor: Colors.grey[900],
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              DelayedAnimation(
                delay: 2000,
                child: Padding(
                  padding: EdgeInsets.all(12),

                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.redAccent),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(title: "homepage"),
                          ),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "OR",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              DelayedAnimation(
                delay: 2000,
                child: Padding(
                  padding: EdgeInsets.all(12),

                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey[900]),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MySignUp()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
