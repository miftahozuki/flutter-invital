import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:plj/theme.dart';
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
    String urlEndpoint = "http://192.168.12.1:8000/api/api_kehadiran";
    String userId = qrContent[2];
    String requestUrl = urlEndpoint + '?user_id=' + userId;

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
            'Scan Code | My Code',
            style: whiteTextStyle.copyWith(
              fontSize: 28,
            ),
          ),
        ),
        actions: [
          Container(
            margin:
                const EdgeInsets.only(right: 30), // Tambahkan margin sebesar 30
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                shape: const CircleBorder(),
                child: IconButton(
                  icon: const Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    // Tambahkan aksi saat tombol profil diklik
                  },
                ),
              ),
            ),
          ),
        ],
        toolbarHeight: 126, // Mengatur tinggi AppBar
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
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
          Expanded(
            flex: 1,
            child: Center(
              child: Align(
              alignment: Alignment.topCenter, // Mengatur posisi teks ke atas
              child: Text('Silahkan pindai QR Code pada undangan tamu.', style: TextStyle(fontSize: 20),),
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
