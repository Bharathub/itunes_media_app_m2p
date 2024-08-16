import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:m2p_assignment/res/AppContextExtension.dart';
import 'package:m2p_assignment/view/detailed_view/widget/video_player.dart';
import 'package:m2p_assignment/view/shared/text_view.dart';
import '../../../model/data_model/media_model/media_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedViewScreen extends StatelessWidget {
  final Result media;

  const DetailedViewScreen({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    final resources = context.resources;

    return Scaffold(
      backgroundColor: resources.color.primaryColor,
      appBar: AppBar(
        title: const MyTextView(label: 'Description'),
        backgroundColor: resources.color.primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: context.resources.color.secondaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  media.artworkUrl100 ?? '',
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextView(
                        label: media.trackName ?? 'Unknown Track',
                        fontSize: context.resources.dimension.mediumText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextView(
                        label: media.artistName ?? 'Unknown Artist',
                        fontSize: context.resources.dimension.smallText,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextView(
                        label: media.primaryGenreName ?? 'Unknown Genre',
                        fontSize: context.resources.dimension.smallText,
                        color: context.resources.color.highlightColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(media.artistViewUrl ?? "");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyTextView(
                              label: "Preview ",
                              fontSize:
                                  context.resources.dimension.verySmallText,
                              color: context.resources.color.blueColor,
                            ),
                            Icon(
                              CupertinoIcons.globe,
                              color: context.resources.color.blueColor,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            MyTextView(
              label: "Preview",
              fontSize: context.resources.dimension.smallText,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 10),
            VideoPlayerWidget(
              videoUrl: media.previewUrl ?? '',
            ),
            const SizedBox(height: 16),
            MyTextView(
              label: "Description",
              fontSize: context.resources.dimension.smallText,
              fontWeight: FontWeight.w400,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Html(
                  data: media.collectionCensoredName ??
                      '<p>No Description Available</p>',
                  style: {
                    "p": Style(
                      fontSize: FontSize(16.0),
                    ),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String uri) async {
    final Uri url = Uri.parse(uri);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
