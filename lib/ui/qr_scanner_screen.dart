import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner/const.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code!"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/generator");
            },
            icon: const Icon(Icons.qr_code),
          )
        ],
        backgroundColor: tertiaryColor,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50), // Jarak dari atas
          const Text(
            "Point the camera at the QR Code you want to scan. Scanify will automatically read the QR Code and display related information.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Lebar kamera 80% dari layar
              height: MediaQuery.of(context).size.height * 0.5, // Tinggi kamera 50% dari layar
              child: ClipRRect( // NAH INI COY
                borderRadius: BorderRadius.circular(16), // Sama dengan dekorasi agar kamera terpotong mengikuti sudut
                //ini manggil mobile scanner (camera nya)
                child: MobileScanner(
                  controller: MobileScannerController(
                    detectionSpeed: DetectionSpeed.noDuplicates, //biar camera nya tuh kek 'berapa lama dia nunggunya'
                    //biar sekali detec
                    returnImage: true,
                  ),
                  onDetect: (capture) { //pas kamera berhasil ngedeteksi, disini logic nya
                    //bakal nyimpen hasilnya (barcode yg udah ter capture) di variabel barcodes

                    //uint8list size maksimal yg kita ambil, cuma 8bit brarti
                    final List<Barcode> barcodes = capture.barcodes;
                    final Uint8List? image = capture.image;
                    for (final barcode in barcodes) {  //for -> kondisi 'benar'
                      print(
                          'Barcode is valid! Here is the source: ${barcode.rawValue}'); //rawValue tuh value dri barcode (translate nya), in tuh klo barcode kan aslinya isimya tuh angka yg banyak dan acak
                    }
                    if (image != null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              //klo image nya gabisa di scan
                              barcodes.first.rawValue ??
                                  "No reference found from this QR",
                            ),
                            content: Image(
                              image: MemoryImage(image),//ini salsat cara kita nampilin image yg ramah ke ram, ngompres sesuai yg ada di uint8list
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
