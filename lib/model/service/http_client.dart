import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

class CustomHttpClient {
  final HttpClient _httpClient = HttpClient();

  CustomHttpClient() {
    _initialize();
  }

  void _initialize() async {
    final securityContext = SecurityContext(withTrustedRoots: false);
    final certificatePem = await rootBundle.loadString('assets/certificate.pem');
    securityContext.setTrustedCertificatesBytes(_pemToBytes(certificatePem));

    _httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      final publicKeyHash = _hashPublicKey(cert);
      final pinnedPublicKey = _getPinnedPublicKey();
      return publicKeyHash == pinnedPublicKey;
    };
  }

  Future<String> _getPinnedPublicKey() async {
    // Replace this with your actual pinned public key hash
    return 'your_pinned_public_key_hash';
  }

  String _hashPublicKey(X509Certificate cert) {
    final publicKeyBytes = _extractPublicKeyBytes(cert);
    final digest = sha256.convert(publicKeyBytes);
    return hex.encode(digest.bytes);
  }

  Uint8List _extractPublicKeyBytes(X509Certificate cert) {
    final publicKeyPem = cert.pem.split('\n').skip(1).takeWhile((line) => line != '-----END PUBLIC KEY-----').join();
    return base64.decode(publicKeyPem);
  }

  Uint8List _pemToBytes(String pem) {
    final pemBase64 = pem
        .replaceAll('-----BEGIN CERTIFICATE-----', '')
        .replaceAll('-----END CERTIFICATE-----', '')
        .replaceAll('\n', '');
    return base64.decode(pemBase64);
  }

  Future<HttpClientRequest> getUrl(Uri url) async {
    return _httpClient.getUrl(url);
  }
}
