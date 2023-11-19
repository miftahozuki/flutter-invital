import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plj/models/visitor.dart';
import 'package:plj/widgets/visitor_card.dart';

import '../theme.dart';

class VisitorPage extends StatelessWidget {
  const VisitorPage({super.key});

//
  Future<List<Visitor>> getVisitor() async {

    // String urlEndPoint =
    //     "https://learn-flutter-ec403-default-rtdb.asia-southeast1.firebasedatabase.app/.json";

    String urlEndPoint = "http://127.0.0.1:8000/api/visitors";
    final response = await http.get(Uri.parse(urlEndPoint));

    // Mengonversi JSON menjadi list Tamu
    List<Visitor> tamuList = (json.decode(response.body)['visitor'] as List)
        .map((data) => Visitor.fromJson(data))
        .toList();

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
          },
          child: Icon(Icons.picture_as_pdf_sharp),
        ),
    );
  }
}
