import 'package:flutter/material.dart';

class daftarAcara extends StatefulWidget {
  const daftarAcara({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<daftarAcara> createState() => _daftarAcaraState();
}

class Guest {
  final String name;
  final String address;

  Guest(this.name, this.address);
}

class _daftarAcaraState extends State<daftarAcara> {
  final TextEditingController _searchController = TextEditingController();

  final List<Guest> guests = [
    Guest('Tamu 1', 'Alamat 1'),
    Guest('Tamu 2', 'Alamat 2'),
    Guest('Tamu 3', 'Alamat 3'),
    Guest('Tamu 4', 'Alamat 4'),
    Guest('Tamu 5', 'Alamat 5'),
    Guest('Tamu 6', 'Alamat 6'),
    Guest('Tamu 7', 'Alamat 7'),
  ];

  void onTapDiv(Guest guest) {
    // Tambahkan tindakan yang ingin Anda lakukan saat div diklik di sini
    print('Tamu diklik: ${guest.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // Add padding around the search bar
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                // Use a Material design search bar
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    // Add a clear button to the search bar
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _searchController.clear(),
                    ),
                    // Add a search icon or button to the search bar
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Perform the search here
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
