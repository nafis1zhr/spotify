import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  final List<String> favoriteSongs;

  const LibraryPage({Key? key, required this.favoriteSongs}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
        backgroundColor: Colors.green,
      ),
      body: widget.favoriteSongs.isEmpty
          ? const Center(
              child: Text(
                "No favorite songs added.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: widget.favoriteSongs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.music_note, color: Colors.green),
                  title: Text(widget.favoriteSongs[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Menghapus lagu dari daftar favorite dengan setState()
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm'),
                            content: Text('Do you want to remove this song?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  setState(() {
                                    widget.favoriteSongs.removeAt(index); // Hapus lagu
                                  });
                                  Navigator.of(context).pop(); // Tutup dialog
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
