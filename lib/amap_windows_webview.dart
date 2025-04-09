import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AMapWindowsWebView extends StatefulWidget {
  final String apiKey;

  const AMapWindowsWebView({super.key, required this.apiKey});

  @override
  State<AMapWindowsWebView> createState() => _AMapWindowsWebViewState();
}

class _AMapWindowsWebViewState extends State<AMapWindowsWebView> {
  final _controller = WebviewController();
  final _textController = TextEditingController();
  final List<StreamSubscription> _subscriptions = [];
  InAppWebViewController? _webViewController;

  static const double initialLatitude = 39.90923;
  static const double initialLongitude = 116.397428;

  @override
  void initState() {
    super.initState();
  }

  String getHtmlContent() {
    return '''
      <!DOCTYPE html>
      <html>
      <head>
          <meta charset="utf-8">
          <script src="https://webapi.amap.com/maps?v=2.0&key=${widget.apiKey}"></script>
          <style>
              html, body {
                  width: 100%;
                  height: 100%;
                  margin: 0;
                  padding: 0;
                  overflow: auto;
              }
              #container {
                  width: 100%;
                  height: 100%;
                  min-height: 500px;
              }
          </style>
      </head>
      <body>
          <div id="container"></div>
          <script>
          var position = [${initialLongitude}, ${initialLatitude}]; 
          var map = new AMap.Map('container', {
              zoom: 5,
              center: position,
          });

          AMap.plugin('AMap.Geolocation', function() {
              var geolocation = new AMap.Geolocation({
                enableHighAccuracy: true,
                timeout: 20000,
                offset: [10, 20],
                zoomToAccuracy: true,
                getCityWhenFail: true,
                showMarker: true,
                position: 'RB'
              });
              
              geolocation.getCurrentPosition(function(status,result){
                    if(status=='complete'){
                        onComplete(result)
                    }else{
                        onError(result)
                    }
              });

              function onComplete(data) {
                  position = data.position;
                  map.setCenter(position);
                  const marker = new AMap.Marker({
                    position: new AMap.LngLat(position[0],position[1]),
                    icon: 'https://a.amap.com/jsapi_demos/static/demo-center/icons/dir-via-marker.png'
                  });
                  map.add(marker);
              }

              function onError(data) {
                  alert("Unable to get current location at the moment.");
              }
          });
          </script>
      </body>
      </html>
    ''';
  }

  Widget compositeView() {
    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri("about:blank")),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              useShouldOverrideUrlLoading: true,
              javaScriptEnabled: true,
            ),
          ),
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
            _webViewController!.loadData(
              data: getHtmlContent(),
              mimeType: 'text/html',
              encoding: 'utf-8',
            );
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return compositeView();
  }

  @override
  void dispose() {
    for (var s in _subscriptions) {
      s.cancel();
    }
    _controller.dispose();
    super.dispose();
  }
}
