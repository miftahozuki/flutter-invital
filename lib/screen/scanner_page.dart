import 'package:flutter/material.dart';

import '../theme.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScannerPage extends StatefulWidget {
  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  List<String> qrContent = [];
  bool isScanning = true;

  Future<void> fillAttendance() async {
    String urlEndpoint = "https://invitation-digital.tifint.myhost.id/api/api_kehadiran";
    String userId = qrContent[2];
    String requestUrl = urlEndpoint + '?tamu_id=' + userId;

    http.post(
      Uri.parse(requestUrl),
    );
  }

  Future<void> showAlertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              SizedBox(width: 8),
              Text(
                "Attendance",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
          content: Text(
            '${qrContent[0]} berhasil mengisi kehadiran.',
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'Montserrat',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 5.0, // Menambahkan bayangan
              ),
              child: Text(
                "Oke",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                isScanning = true;
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(
          child: Text(
            'Scan Code',
            style: whiteTextStyle.copyWith(
              fontSize: 28,
            ),
          ),
        ),
        actions: [
          Container(
            margin:
                const EdgeInsets.only(right: 50), // Tambahkan margin sebesar 30
          ),
        ],
        toolbarHeight: 80, // Mengatur tinggi AppBar
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          SizedBox(
            // flex: 5,
            child: Center(
              child: Container(
                width: 350, // Atur lebar sesuai keinginan Anda
                height: 350, // Atur tinggi sesuai keinginan Anda
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 250, // Atur sesuai ukuran kotak QR Code
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Align(
              alignment: Alignment.topCenter, // Mengatur posisi teks ke atas
              child: Center(
                child: Text(
                  'Silahkan pindai QR Code\n pada undangan tamu',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (isScanning) {
        isScanning = false; // Set isScanning ke false ketika pemindaian dimulai
        setState(() {
          result = scanData;
          qrContent = utf8.decode(base64.decode(scanData.code!)).split('::');
          controller.pauseCamera(); // Jeda kamera sementara
          fillAttendance();
          print('berhasil presensi');
          showAlertDialog(context).then((_) {
            isScanning = true; // Set isScanning ke true setelah alert ditutup
            controller.resumeCamera(); // Mulai kembali kamera
          });
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
