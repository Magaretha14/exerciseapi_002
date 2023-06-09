import 'dart:convert';

import 'package:flutter_api/model/kategori_barang_model.dart';
import 'package:http/http.dart' as http;

class KategoriBarangController {
  final String apiUrl = "http://10.0.2.2:8000/api/";

  Future<List<KategoriBarangModel>> getKategoriBarang() async {
    var result = await http.get(Uri.parse("${apiUrl}barang/getAllKB/"));
    if (result.statusCode == 200) {
      var data = json.decode(result.body); //json to map
      List<KategoriBarangModel> kategoriBarang = []; //list of kategoriBarang
      for (var i in data) {
        //loop data
        KategoriBarangModel kategori =
            KategoriBarangModel.fromMap(i); //map to kategoriBarang
        kategoriBarang.add(kategori); //add kategoriBarang to list
      }
      return kategoriBarang;
    } else {
      throw Exception('Gagal mengambil data kategori barang');
    }
  }

  Future addKategoriBarang(KategoriBarangModel kategoriBarang) async {
    var result = await http.post(Uri.parse("${apiUrl}barang/addKB/"), body: {
      "nama_kategori_barang": kategoriBarang.nama,
    });
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      throw Exception('Gagal manambahkan data kategori barang');
    }
  }

  Future updateKategoriBarang(int id, String nama) async {
    var result =
        await http.post(Uri.parse("${apiUrl}barang/updateKB/$id"), body: {
      "nama_kategori_barang": nama,
    });
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      throw Exception('Gagal mengubah data kategori barang');
    }
  }

  Future deleteKategoriBarang(int id) async {
    var result = await http.post(Uri.parse("${apiUrl}barang/deleteKB/$id"));
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      throw Exception('Gagal menghapus data kategori barang');
    }
  }
}
