import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mottu/constaints.dart';
import 'package:mottu/dimens.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: PlatformChannelTestBody(),
    ),
  ));
}

class PlatformChannelTestBody extends StatefulWidget {
  const PlatformChannelTestBody({Key? key}) : super(key: key);

  @override
  PlatformChannelTestBodyState createState() {
    return PlatformChannelTestBodyState();
  }
}

class PlatformChannelTestBodyState extends State<PlatformChannelTestBody> {
  static const platformMethodChannel =
      MethodChannel(Constaints.platformMethodChannel);
  String nativeMessage = '';
  String buttonText = Constaints.clickSurprise;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff50B131),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: Dimens.m,
              top: Dimens.xg,
            ),
            child: Center(
              child: Text(
                Constaints.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: Dimens.g,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.m,
              right: Dimens.m,
              top: Dimens.g,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
              ),
              child: Text(buttonText),
              onPressed: () => callMethodChannel(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.m,
              right: Dimens.m,
              top: Dimens.g,
            ),
            child: Center(
              child: Text(
                nativeMessage,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: Dimens.fontM,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void callMethodChannel() async {
    String _message;
    try {
      final String result = await platformMethodChannel.invokeMethod('MOTTU');
      _message = result;
    } on PlatformException catch (e) {
      _message = "ERRO: ${e.message}.";
    }
    setState(() {
      nativeMessage = _message;
      buttonText = Constaints.warned;
    });
  }
}
