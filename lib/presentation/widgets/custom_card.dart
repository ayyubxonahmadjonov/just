import 'package:flutter/material.dart';

class PopupBelowButtonExample extends StatefulWidget {
  @override
  _PopupBelowButtonExampleState createState() => _PopupBelowButtonExampleState();
}

class _PopupBelowButtonExampleState extends State<PopupBelowButtonExample> {
  final GlobalKey _buttonKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showPopup() {
    final renderBox = _buttonKey.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5, // buttondan pastroqda chiqadi
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.black26,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Popup oynasi", style: TextStyle(color: Colors.blue.shade900)),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    print("Popupdagi tugma bosildi");
                  },
                  child: Text("Ichki amal"),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removePopup() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ko‘k Popup misoli")),
      body: Center(
        child: ElevatedButton(
          key: _buttonKey,
          onPressed: () {
            if (_overlayEntry == null) {
              _showPopup();
            } else {
              _removePopup();
            }
          },
          child: Text("Ko‘rsat / Yop"),
        ),
      ),
    );
  }
}
