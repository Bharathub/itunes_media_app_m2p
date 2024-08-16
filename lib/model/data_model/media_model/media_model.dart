import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_model.freezed.dart';
part 'media_model.g.dart';

@freezed
class Media with _$Media {
    const factory Media({
        @JsonKey(name: "resultCount")
        int? resultCount,
        @JsonKey(name: "results")
        List<Result>? results,
    }) = _Media;

    factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

@freezed
class Result with _$Result {
    const factory Result({
        @JsonKey(name: "wrapperType")
        String? wrapperType,
        @JsonKey(name: "kind")
        String? kind,
        @JsonKey(name: "artistId")
        int? artistId,
        @JsonKey(name: "collectionId")
        int? collectionId,
        @JsonKey(name: "trackId")
        int? trackId,
        @JsonKey(name: "artistName")
        String? artistName,
        @JsonKey(name: "collectionName")
        String? collectionName,
        @JsonKey(name: "trackName")
        String? trackName,
        @JsonKey(name: "collectionCensoredName")
        String? collectionCensoredName,
        @JsonKey(name: "trackCensoredName")
        String? trackCensoredName,
        @JsonKey(name: "artistViewUrl")
        String? artistViewUrl,
        @JsonKey(name: "collectionViewUrl")
        String? collectionViewUrl,
        @JsonKey(name: "trackViewUrl")
        String? trackViewUrl,
        @JsonKey(name: "previewUrl")
        String? previewUrl,
        @JsonKey(name: "artworkUrl30")
        String? artworkUrl30,
        @JsonKey(name: "artworkUrl60")
        String? artworkUrl60,
        @JsonKey(name: "artworkUrl100")
        String? artworkUrl100,
        @JsonKey(name: "collectionPrice")
        double? collectionPrice,
        @JsonKey(name: "trackPrice")
        double? trackPrice,
        @JsonKey(name: "releaseDate")
        DateTime? releaseDate,
        @JsonKey(name: "collectionExplicitness")
        String? collectionExplicitness,
        @JsonKey(name: "trackExplicitness")
        String? trackExplicitness,
        @JsonKey(name: "discCount")
        int? discCount,
        @JsonKey(name: "discNumber")
        int? discNumber,
        @JsonKey(name: "trackCount")
        int? trackCount,
        @JsonKey(name: "trackNumber")
        int? trackNumber,
        @JsonKey(name: "trackTimeMillis")
        int? trackTimeMillis,
        @JsonKey(name: "country")
        String? country,
        @JsonKey(name: "currency")
        String? currency,
        @JsonKey(name: "primaryGenreName")
        String? primaryGenreName,
        @JsonKey(name: "isStreamable")
        bool? isStreamable,
    }) = _Result;

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
