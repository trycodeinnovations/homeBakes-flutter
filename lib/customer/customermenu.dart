import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/customers/customerscakegetfun.dart';

class Customermenucake extends StatelessWidget {
  
  const Customermenucake({
    super.key,
  });
  // final baker=Bakerdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("menu"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 2,
            childAspectRatio: .4),
        itemCount: Customerdata.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            color: Colors.black12,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height: 50,
                    color: Colors.amber,
                    child: Image.network(Customerdata[index].images),
                  ),
                ),
                Text(Customerdata[index].cakename),
                Text(Customerdata[index].flavour),
                Text(Customerdata[index].price),
                const Column(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => updateScreen(
                    //               cakename: Bakerdata[index].cakename,
                    //               flavour: Bakerdata[index].flavour,
                    //               price: Bakerdata[index].price,
                    //               id: Bakerdata[index].id),
                    //         ));
                    //   },
                    //   icon: Icon(Icons.edit),
                    // ),
                    // SizedBox(
                    //   width: 150,
                    // ),
                    // IconButton(
                    //   onPressed: () async {
                    //     await deletebaker(Bakerdata[index].id);
                    //     // print("asdf");
                    //     await Bakerget();
                        

                    //     //
                    //     Navigator.pushNamed(context, "customerhomepage");
                    //   },
                    //   icon: Icon(Icons.delete),
                    // )
                  ],
                ),const SizedBox(height: 20,),
                // Text(Bakerdata[index].cakename),
                // Text(Bakerdata[index].flavour),
                // Text(Bakerdata[index].price),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "cakeprice");
                    },
                    child: const Text("ORDER"))
              ],
            ),
          );
        },
      ),
    );
  }
}
