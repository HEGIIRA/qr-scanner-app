import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_scanner/const.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  String? qrRawValue;
  TextEditingController controller = TextEditingController(); //ini bikin controller buat textfield


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Code"),
        actions: [
          IconButton(
            onPressed: () {
              //BARU NIH, 
              Navigator.popAndPushNamed(context, "/scanner");
            },
            icon: const Icon(Icons.qr_code_scanner),
          )
        ],
        backgroundColor: secondaryColor,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max, //sama kyk expanded, bedanya ini main nya (vertical)
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Enter the information you want to create a QR Code for, such as URL, text, or contact. Scanify will generate a unique QR Code in just a few seconds.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            TextField(
              //INI AK PINDAHIN KE TOMBOL
              // onSubmitted: (value) {
              //   setState(() {
              //     qrRawValue = value;
              //   });
              // },
              controller: controller, //ini controller nya dipanggil buat ngontrol si textfield ini
              decoration: InputDecoration(
                labelText: 'Enter Text or Code to Generate QR', //teks yg di dalem kotak nnya, nnti pindah ke atas
                labelStyle: const TextStyle(color: accentColor),
                //INI BOX PAS SEBELUM DI KLIK
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: secondaryColor,
                    width: 3.0,
                  ),
                ),
                //NAH INI KALO GA DI KLIK
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: secondaryColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  qrRawValue = controller.text; //nagmbil ilai dri textfield
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor
              ),
              child: const Text("Make"),
            ),
            const SizedBox(height: 30,),
            if (qrRawValue != null)  PrettyQrView.data(data: qrRawValue!) //ini inline condition tpi gaada : nya, karna yaudahlah

          ],
        ),
      ),
    );
  }
}