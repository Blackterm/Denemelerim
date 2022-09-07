import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'e_declarations_controller.dart';

class EDeclarationsView extends View {
  @override
  State<StatefulWidget> createState() {
    return _EDeclarationsViewState(EDeclarationsController());
  }
}

class _EDeclarationsViewState
    extends ViewState<EDeclarationsView, EDeclarationsController> {
  _EDeclarationsViewState(EDeclarationsController controller)
      : super(controller);

  @override
  Widget get view {
    EdgeInsets padding = MediaQuery.of(context).padding;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: padding.top),
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width - 20,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'E-TEBLİGAT',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ControlledWidgetBuilder<EDeclarationsController>(
                        builder: (context, controller) {
                      return InkWell(
                        child: Container(
                          width: size.width - 20,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Center(
                                  child: Text('Başlangıç Tarihi'),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 30,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          controller.isVisibilityStartDateCheck(
                              !controller.isVisibilityStartDate);
                        },
                      );
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    ControlledWidgetBuilder<EDeclarationsController>(
                        builder: (context, controller) {
                      return Visibility(
                        visible: controller.isVisibilityStartDate,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              child: CupertinoDatePicker(
                                maximumYear: 2050,
                                minimumYear: 2000,
                                initialDateTime: DateTime.now(),
                                onDateTimeChanged: (value) {},
                                mode: CupertinoDatePickerMode.date,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        controller
                                            .isVisibilityStartDateCheck(false);
                                      },
                                      icon: Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 30,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    ControlledWidgetBuilder<EDeclarationsController>(
                        builder: (context, controller) {
                      return InkWell(
                        child: Container(
                          width: size.width - 20,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    'Bitiş Tarihi',
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 30,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          controller.isVisibilityEndDateCheck(
                              !controller.isVisibilityEndDate);
                        },
                      );
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    ControlledWidgetBuilder<EDeclarationsController>(
                        builder: (context, controller) {
                      return Visibility(
                        visible: controller.isVisibilityEndDate,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              child: CupertinoDatePicker(
                                maximumYear: 2050,
                                minimumYear: 2000,
                                initialDateTime: DateTime.now(),
                                onDateTimeChanged: (value) {},
                                mode: CupertinoDatePickerMode.date,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        controller
                                            .isVisibilityEndDateCheck(false);
                                      },
                                      icon: Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 30,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
