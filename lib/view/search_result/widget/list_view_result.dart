import 'package:flutter/material.dart';
import 'package:m2p_assignment/model/data_model/media_model/media_model.dart';
import 'package:m2p_assignment/res/AppContextExtension.dart';
import '../../detailed_view/detailed_view_screen.dart';
import '../../shared/text_view.dart';

class ListViewResultWidget extends StatelessWidget {
  final List<Result> mediaList;
  final String mediaType;

  const ListViewResultWidget({super.key, required this.mediaList, required this.mediaType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.maxFinite,
            color: context.resources.color.backgroundColor,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${mediaType[0].toUpperCase()}${mediaType.substring(1)}s',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: mediaList.length,
            itemBuilder: (context, index) {
              final media = mediaList[index];
              return buildListItem(media, context);
            },
          ),
        ),
      ],
    );
  }

  Widget buildListItem(Result media, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedViewScreen(media: media),
          ),
        );
      },
      child: Card(
        child: ListTile(
          tileColor: Colors.black,
          leading: Image.network(
            media.artworkUrl100 ?? 'https://via.placeholder.com/100',
            fit: BoxFit.cover,
            height: 50,
            width: 50,
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                'https://via.placeholder.com/100',
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              );
            },
          ),
          title: MyTextView(label: media.trackName ?? "", fontSize: context.resources.dimension.mediumText,),
          subtitle: MyTextView(label: media.artistName ?? "", fontSize: context.resources.dimension.smallText,),
        ),
      ),
    );
  }
}
