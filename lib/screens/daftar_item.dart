import 'package:flutter/material.dart';
import 'package:inventory_pesawat/screens/tambah_item.dart';
import 'package:inventory_pesawat/widgets/item.dart';
import 'package:inventory_pesawat/widgets/left_drawer.dart';

class DaftarItem extends StatelessWidget {
  const DaftarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Item")),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: inventory.length,
        itemBuilder: (context, index) {
            if(inventory.isEmpty) {
              return const Center(child: Text("Tidak ada item"));
            }
            else {
            return Card(
              child: ListTile(
                leading: Text("Items " + (index + 1).toString()),
                title: Text(inventory[index].name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jumlah: " + inventory[index].amount.toString()),
                    Text("Deskripsi: " + inventory[index].description),
                    Text("Mesin: " + inventory[index].engine),
                    Text("Winglet: " + inventory[index].winglet.toString()),
                    Image.network(inventory[index].image),
                  ],
                ),
              ),
            );
          }

        },

    ),
    );
  }
}
