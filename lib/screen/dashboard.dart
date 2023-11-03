import 'package:flutter/material.dart';
import 'list_tamu.dart';
import 'list_acara.dart';
import 'about.dart';
import 'scanner.dart';
import 'package:get/get.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
        actions: [
            Padding(
              padding: EdgeInsets.all(8.0), // You can adjust the padding as needed
              child: Icon(Icons.account_circle_rounded, color: Colors.white),// U,se the correct path to your icon
            ),
          ],
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            // Column dan GridView di bawah gambar
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                      padding:
                          EdgeInsets.all(20.0), // Atur sesuai kebutuhan Anda
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            15.0), // Atur radius sesuai kebutuhan Anda
                        child: Image.asset(
                          'assets/images/logo-db.png', // Ganti dengan path gambar Anda
                          width: double.infinity,
                          height:
                              200, // Atur tinggi gambar sesuai kebutuhan Anda
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 60, right: 60),
                  children: [
                    GridItem(
                      icon: Icons.calendar_month,
                      label: 'Acara',
                    ),
                    GridItem(icon: Icons.account_box, label: 'Tamu'),
                    GridItem(icon: Icons.warning_amber, label: 'About'),
                    GridItem(icon: Icons.barcode_reader, label: 'Scanner'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final IconData icon;
  final String label;

  GridItem({required this.icon, required this.label});
  void _handleIconClick(BuildContext context) {
    switch (label) {
      case 'Acara':
        // Tindakan untuk ikon 'Tamu'
        print('Ikon $label diklik');
        Navigator.push(context, MaterialPageRoute(builder: (context) => daftarAcara(title: 'Daftar Acara',)));
        // Misalnya, navigasi ke layar 'Tamu'
        break;
      case 'Tamu':
        // Tindakan untuk ikon 'Tamu'
        print('Ikon $label diklik');
        // Misalnya, navigasi ke layar 'Tamu'
        Navigator.push(context, MaterialPageRoute(builder: (context) => daftarTamu(title: 'Daftar Tamu',)));
        break;
      case 'About':
        // Tindakan untuk ikon 'About'
        print('Ikon $label diklik');
        // Misalnya, menampilkan dialog 'About'
        Navigator.push(context, MaterialPageRoute(builder: (context) => about(title: 'About',)));
        break;
      case 'Scanner':
        // Tindakan untuk ikon 'Scanner'
        print('Ikon $label diklik');
        // Misalnya, menjalankan pemindai kode QR
        Navigator.push(context, MaterialPageRoute(builder: (context) => scanner(title: 'Scanner',)));
        // (Anda harus memiliki implementasi pemindai kode QR terlebih dahulu)
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleIconClick(context);
      },
      child: Column(
      children: <Widget>[
        Icon(icon, size: 60, color: Theme.of(context).primaryColor),
        Text(label),
      ],
    ),
    );
  }
}
