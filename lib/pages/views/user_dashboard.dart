import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:writopia_frontend/controllers/dashboard_controller.dart';
import 'package:writopia_frontend/widgets/header.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    DashBoardController dashBoardController = Get.put(DashBoardController());
    // var controller = Get.put(HomePageController());
    var username = dashBoardController.userName.value;
    return ListView(
      children: [
        Header(
          // name: controller.getUserFirstName(),
          name: username,
          ontap: () async {
            // await controller.fetchDashboardDetails();
            // await controller.fetchDashBoardTableData();
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 250,
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                // flex: 5,
                child: Column(
                  // mainAxisAlignment: controller.isAdmin
                  //     ? MainAxisAlignment.spaceAround
                  //     : MainAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:
                            // controller.isAdmin
                            //     ?
                            [
                          const Text(
                            "Quick Actions",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const Spacer(),
                          ElevatedButton.icon(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16 * 1.5, vertical: 16),
                            ),
                            onPressed: () {
                              // Get.defaultDialog(
                              //   title: "",
                              //   content: EditProjectForm(),
                              // );
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("New Project"),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton.icon(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16 * 1.5, vertical: 16),
                            ),
                            onPressed: () {
                              // buildUserEditForm(null, true);
                            },
                            icon: const Icon(CupertinoIcons.person_add),
                            label: const Text("Add User"),
                          ),
                        ]
                        // : [],
                        ),
                    Obx(
                      () => SizedBox(
                        height: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // children: controller.buildInfoCards(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Obx(
                      () => SizedBox(
                        width: 1200,
                        // child: controller.isLoading.value
                        //     ? LoadingAnimationWidget.beat(
                        //         color: Colors.blue,
                        //         size: 50,
                        //       )
                        //     : controller.hasData.value
                        //         ? PaginatedDataTable(
                        //             columns: controller.columns.value,
                        //             source: controller.source.value,
                        //           )
                        //         : const NodataWidget(
                        //             message: "No data found!",
                        //           ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // flex: 2,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Obx(
                  () => SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // children: controller.buildQuickStats(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
