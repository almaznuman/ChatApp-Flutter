import 'package:demo1/repo/imagesrepo.dart';
import 'package:flutter/material.dart';

import '../models/image.dart';

class ImagePicker extends StatelessWidget {
  final Imagerepo _loadnetworkimages=Imagerepo();
  ImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PixelfordImage>>(
        future: _loadnetworkimages.getnetworkImage(),
        builder: (BuildContext context,
            AsyncSnapshot<List<PixelfordImage>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Image.network(snapshot.data![index].urlSmallSize);
              },
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5),
            );
            // return Image.network(snapshot.data![0].urlSmallSize);
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
