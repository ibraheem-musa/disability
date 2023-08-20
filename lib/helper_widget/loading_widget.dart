import 'package:disability/helper_widget/colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final bool isFromAlertDialog;
  const LoadingWidget({this.isFromAlertDialog = false, Key? key})
      : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: CircularProgressIndicator(color:DisabilityColors.maineGreen,strokeWidth: 7,backgroundColor: Colors.black12,))

            ],
          ),
          SizedBox(height: 25),
          Text("pleas_wait",
              textAlign: TextAlign.center,
              style: TextStyle(color: DisabilityColors.maineGreen, fontSize: 14))
        ],
      ),
    );
  }
}
