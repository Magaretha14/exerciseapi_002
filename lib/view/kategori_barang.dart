import 'package:flutter/material.dart';
import 'package:flutter_api/controller/kategori_barang_controller.dart';
import 'package:flutter_api/model/kategori_barang_model.dart';
import 'package:flutter_api/view/add_kategori_barang.dart';

class KategoriBarang extends StatefulWidget {
  const KategoriBarang({super.key});

  @override
  State<KategoriBarang> createState() => _KategoriBarangState();
}

class _KategoriBarangState extends State<KategoriBarang> {
  final kategoriBarangController = KategoriBarangController();
  List<KategoriBarangModel> listKategoriBarang = [];
  String? nama;

  @override
  void initState() {
    super.initState();
    getKategoriBarang();
  }

  // void deleteKategoriBarang() async {
  //   KategoriBarangModel kategoriBarang = KategoriBarangModel(nama: nama!);
  //   await kategoriBarangController.deleteKategoriBarang(kategoriBarang);
  // }

  void getKategoriBarang() async {
    final kategoriBarang = await kategoriBarangController.getKategoriBarang();
    setState(() {
      listKategoriBarang = kategoriBarang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Barang'),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: listKategoriBarang.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(listKategoriBarang[index].nama),
              trailing: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      //deleteKategoriBarang();
                    },
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddKategoriBarang()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
