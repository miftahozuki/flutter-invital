import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:plj/models/visitor.dart';
import 'package:plj/widgets/visitor_card.dart';
import 'package:plj/database/visitorDB.dart';

import '../theme.dart';

class VisitorPage extends StatelessWidget {
  const VisitorPage({super.key});
  

//
  Future<List<Visitor>> getVisitor() async {
    String urlEndPoint = "http://invitation-digital.tifint.myhost.id/api/visitors";

    try {
      final response = await http.get(Uri.parse(urlEndPoint));
      print(response.body);
      if (response.statusCode == 200) {
        print('Mengambil data dari server....');
        List<Visitor> tamuList = (json.decode(response.body)['visitor'] as List)
            .map((data) => Visitor.fromJson(data))
            .toList();

        // inisialisasi
        final SQLiteDbProvider dbProvider = SQLiteDbProvider.db;
        await dbProvider.initDB();

        // Hapus data lama di database (opsional)
        await dbProvider.deleteAllVisitors();
        print('updating database...');

        // Tambahkan data baru ke dalam database
        for (Visitor visitor in tamuList) {
          await dbProvider.addVisitor({
            'id': visitor.id,
            'nama_tamu': visitor.name,
            'status': visitor.status,
            'kelamin': visitor.gender,
            'alamat': visitor.address,
            'waktu': visitor.waktu,
          });
        }
        return tamuList;
      } else {
        print('Mengambil data dari database lokal....');
        return getfromDB();
      }
    } catch (error) {
      // Handle network errors or other exceptions
      print("Error: $error");
      // Jika terjadi exception, kembalikan fallback dari database lokal
      return getfromDB();
    }
  }

  Future<List<Visitor>> getfromDB() async {
    final SQLiteDbProvider dbProvider = SQLiteDbProvider.db;
    await dbProvider.initDB();

    List<Map<String, dynamic>> allVisitors = await dbProvider.getAllVisitors();

    List<Visitor> tamuList =
        allVisitors.map((data) => Visitor.fromJson(data)).toList();

    return tamuList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(
          child: Text(
            'Tamu Hadir',
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
      body: FutureBuilder(
        future: getVisitor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading state
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Error state
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data loaded successfully
            List<Visitor> tamuList = snapshot.data as List<Visitor>;

            return ListView.builder(
              itemCount: tamuList.length,
              itemBuilder: (context, index) {
                Visitor visitor = tamuList[index];
                return Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 20.0),
                  child: Column(
                    children: [
                      VisitorCard(
                        Visitor(
                            name: visitor.name,
                            gender: visitor.gender,
                            address: visitor.address,
                            status: visitor.status,
                            waktu: visitor.waktu),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Mencetak pdf...');
          // _bjir();
        },
        child: Icon(Icons.picture_as_pdf_sharp),
      ),
    );
  }
}

// Future<void> _bjir() async {
//   Directory documentsDirectory = await getApplicationDocumentsDirectory();
//   String path = join(documentsDirectory.path, "VisitorDB.db");

//   try {
//     File file = File(path);
//     if (await file.exists()) {
//       await file.delete();
//       print('File berhasil dihapus');
//     } else {
//       print('File tidak ditemukan');
//     }
//   } catch (e) {
//     print('Error saat menghapus file: $e');
//   }
// }
