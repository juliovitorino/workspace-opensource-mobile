import 'dart:io';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Usa a URL para decidir o player:
/// - YouTube (inclui Shorts): player nativo via youtube_player_iframe
/// - Vimeo: WebView com player.vimeo.com
/// - Outros (TikTok, etc.): WebView direto da URL
class VerticalVideoPlayer extends StatefulWidget {
  final String url;

  const VerticalVideoPlayer({super.key, required this.url});

  @override
  State<VerticalVideoPlayer> createState() => _VerticalVideoPlayerState();
}

class _VerticalVideoPlayerState extends State<VerticalVideoPlayer> {
  YoutubePlayerController? _ytController;
  late final Uri _uri;

  @override
  void initState() {
    super.initState();
    _uri = Uri.parse(widget.url);

    final host = _uri.host.toLowerCase();

    if (_isYouTube(host)) {
      final videoId = _extractYouTubeId(_uri);
      if (videoId != null) {
        _ytController = YoutubePlayerController.fromVideoId(
          videoId: videoId,
          autoPlay: false,
          params: const YoutubePlayerParams(
            showControls: true,
            mute: false,
            // Mantemos layout limpo; fullscreen control também disponível
            enableCaption: true,
            strictRelatedVideos: true,
            showFullscreenButton: true,
          ),
        );
      }
    } else if (_isWebViewPlatform()) {
      // Android/iOS: inicialização específica pode ser necessária
      WebViewPlatform.instance; // só para garantir linkage
    }
  }

  @override
  void dispose() {
    _ytController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Força 9:16 (vertical) em todas as plataformas
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: _buildPlayer(),
    );
  }

  Widget _buildPlayer() {
    final host = _uri.host.toLowerCase();

    if (_ytController != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: YoutubePlayer(
          controller: _ytController!,
          aspectRatio: 9 / 16,
        ),
      );
    }

    if (_isVimeo(host)) {
      final vimeoId = _extractVimeoId(_uri);
      final vimeoEmbedUrl = vimeoId != null
          ? 'https://player.vimeo.com/video/$vimeoId?h=&title=0&byline=0&portrait=0'
          : widget.url; // fallback
      return _WebViewContainer(initialUrl: vimeoEmbedUrl);
    }

    // Fallback: TikTok e outros providers — abre a própria página
    // Obs.: para TikTok, o embed perfeito costuma exigir HTML custom,
    // mas este fallback funciona bem para visualização.
    return _WebViewContainer(initialUrl: widget.url);
  }

  bool _isYouTube(String host) =>
      host.contains('youtube.com') || host.contains('youtu.be');

  bool _isVimeo(String host) => host.contains('vimeo.com');

  bool _isWebViewPlatform() => Platform.isAndroid || Platform.isIOS;

  /// Extrai o ID do YouTube para URLs padrões, encurtadas e Shorts.
  String? _extractYouTubeId(Uri uri) {
    // 1) youtu.be/<id>
    if (uri.host.contains('youtu.be')) {
      final id = uri.pathSegments.isNotEmpty ? uri.pathSegments.first : null;
      return _normalizeId(id);
    }

    // 2) youtube.com/watch?v=<id>
    final v = uri.queryParameters['v'];
    if (v != null && v.isNotEmpty) return _normalizeId(v);

    // 3) youtube.com/shorts/<id>
    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'shorts') {
      final id = uri.pathSegments.length > 1 ? uri.pathSegments[1] : null;
      return _normalizeId(id);
    }

    // 4) outras rotas /embed/<id> etc.
    if (uri.pathSegments.contains('embed')) {
      final idx = uri.pathSegments.indexOf('embed');
      if (idx >= 0 && idx + 1 < uri.pathSegments.length) {
        return _normalizeId(uri.pathSegments[idx + 1]);
      }
    }
    return null;
  }

  String? _normalizeId(String? raw) {
    if (raw == null) return null;
    return raw.trim().split('?').first.split('&').first;
  }

  /// Tenta extrair ID de URLs vimeo.com/<id> ou /channels/.../<id>, /video/<id>
  String? _extractVimeoId(Uri uri) {
    // pega último segmento numérico
    for (var i = uri.pathSegments.length - 1; i >= 0; i--) {
      final seg = uri.pathSegments[i];
      if (RegExp(r'^\d+$').hasMatch(seg)) return seg;
    }
    return null;
  }
}

class _WebViewContainer extends StatefulWidget {
  final String initialUrl;
  const _WebViewContainer({required this.initialUrl});

  @override
  State<_WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<_WebViewContainer> {
  late final WebViewController _controller;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (_) => setState(() => _loading = false),
      ))
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: _controller),
        if (_loading)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
