import 'package:flutter/material.dart';
import 'package:qr_scanner/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SCANIFY",
          style: TextStyle(
            fontFamily: 'Modak',
            color: Colors.white,
            fontSize: 30,
            letterSpacing: 5,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scanify_logo.png',
              height: 210,
            ),
            const SizedBox(height: 20,),
            const Text(
              "EASY, QUICK AND PRACTICAL WITH SCANIFY!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol pertama
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/generator');
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code_outlined,
                            size: 50,
                            color: secondaryColor,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Code Generator",
                            style: TextStyle(
                              fontSize: 16,
                              color: accentColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Tombol kedua
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/scanner');
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code_scanner_outlined,
                            size: 50,
                            color: tertiaryColor,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "QR Scanner",
                            style: TextStyle(
                              fontSize: 16,
                              color: accentColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
