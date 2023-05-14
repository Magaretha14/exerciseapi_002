import 'dart:convert';

class KategoriBarangModel {
  final String nama;
  final int index;
  KategoriBarangModel({
    required this.nama,
    required this.index,
  });

  KategoriBarangModel copyWith({
    String? nama,
    int? index,
  }) {
    return KategoriBarangModel(
      nama: nama ?? this.nama,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama_kategori_barang': nama,
      'id_kategori_barang': index,
    };
  }

  factory KategoriBarangModel.fromMap(Map<String, dynamic> map) {
    return KategoriBarangModel(
      nama: map['nama_kategori_barang'] ?? '',
      index: map['id_kategori_barang']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory KategoriBarangModel.fromJson(String source) =>
      KategoriBarangModel.fromMap(json.decode(source));

  @override
  String toString() => 'KategoriBarangModel(nama: $nama, index: $index)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KategoriBarangModel &&
        other.nama == nama &&
        other.index == index;
  }

  @override
  int get hashCode => nama.hashCode ^ index.hashCode;
}
