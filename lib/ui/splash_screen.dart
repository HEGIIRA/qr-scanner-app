import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState(); //manggil itstate bawaan
    // nentuin durasi splash screen
    Future.delayed(const Duration(seconds: 3), () { //ini kayak kalo udh 3 detik bakal ke halaman berikutnya
      Navigator.pushReplacementNamed( //na ini, bakal di replace ke sini
        // ignore: use_build_context_synchronously
        context, '/home'); // Navigasi ke halaman utama
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scanify_logo.png',
              width: 200, // Ukuran lebar logo
            ),
            const SizedBox(height: 20),
            const Text(
              "QUICK SCAN, ACCURATE RESULTS!",
              style: TextStyle(
                fontSize: 18, 
                ),
            ),
          ],
        ),
      ),
    );
  }
}
