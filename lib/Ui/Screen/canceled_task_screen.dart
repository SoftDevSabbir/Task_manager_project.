// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../Widget/profile_summary_card.dart';
// import '../Widget/task_item_card.dart';
//
// class CanceTasksScreen extends StatefulWidget {
//   const CanceTasksScreen({super.key});
//
//   @override
//   State<CanceTasksScreen> createState() => _CanceTasksScreenState();
// }
//
// class _CanceTasksScreenState extends State<CanceTasksScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: Column(
//               children: [
//                 ProfileSummaryCard(),
//                 Expanded(
//                     child: ListView.builder(
//                       itemBuilder: (context, index) =>
//                           Padding(
//                             padding: const EdgeInsets.only(top: 18),
//                             //child: TaskItemCard(),
//                           ),
//                       itemCount: 8,
//                     ))
//               ],
//             )));
//   }
// }
//
// import 'package:crud_app/Ui/Widget/snack_message.dart';
// import 'package:flutter/material.dart';
//
// import '../../data_network_caller/models/taskListModel.dart';
// import '../../data_network_caller/network_caller.dart';
// import '../../data_network_caller/utility/urls.dart';
// import '../Widget/body_background.dart';
// import 'add_new_task_screen.dart';
// //import 'package:softbyhasan/data/urls.dart';
//
// // import '../../data/models/task-model.dart';
// // import '../../data/network-utils.dart';
// // import '../utils/snackbar-message.dart';
// // import '../widgets/changeTaskStatus-show-bottom-sheet.dart';
// // import '../widgets/screen-Background-images.dart';
// // import '../widgets/task-list-item.dart';
// // import 'add-new-task-screen.dart';
//
// class CancelledTaskScreen extends StatefulWidget {
//   const CancelledTaskScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
// }
//
// class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
//   TaskListModel cancelledTaskModel = TaskListModel();
//   bool inProgress = false;
//   dynamic count2;
//
//   @override
//   void initState() {
//     super.initState();
//     cancelTasks();
//   }
//
//   Future<void> deleteTask(dynamic id) async {
//     showDialog(context: context, builder: (context){
//
//       return AlertDialog(
//         title: const Text('Delete!'),
//         content: const Text("Once delete, you won't be get it back"),
//         actions: [
//           OutlinedButton(onPressed: () async {
//             Navigator.pop(context);
//             inProgress = true;
//             setState(() {});
//             await NetworkCaller().deleteMethod(Urls.deleteTaskUrl(id));
//             inProgress = false;
//             setState(() {});
//             cancelTasks();
//
//           }, child: const Text('Yes')),
//           OutlinedButton(onPressed: (){
//             Navigator.pop(context);
//           }, child: const Text('No')),
//         ],
//       );
//     });
//   }
//
//   Future<void> cancelTasks() async {
//     inProgress = true;
//     setState(() {});
//     final response = await NetworkCaller().getRequest(
//         'https://task.teamrabbil.com/api/v1/listTaskByStatus/Cancelled');
//
//     if (response != null) {
//       cancelledTaskModel = TaskListModel.fromJson(response as Map<String, dynamic>);
//     } else {
//       if (mounted) {
//        showSnackMessage(context, 'Unable to fetch data. Try again!', true);
//       }
//     }
//     inProgress = false;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: BodyBackground(
//           child: Column(
//             children: [
//               Expanded(
//                   child: inProgress
//                       ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                       : RefreshIndicator(
//                     onRefresh: () async {
//                       cancelTasks();
//                     },
//                     child: ListView.builder(
//                         itemCount: cancelledTaskModel.data?.length ?? 0,
//                         itemBuilder: (context, index) {
//                           return TaskListItem(
//                             subject:
//                             cancelledTaskModel.data?[index].title ??
//                                 'Unknown',
//                             description: cancelledTaskModel
//                                 .data?[index].description ??
//                                 'Unknown',
//                             date: cancelledTaskModel
//                                 .data?[index].createdDate ??
//                                 'Unknown',
//                             type: 'Cancelled',
//                             backgroundColor: Colors.purple,
//                             onEdit: () {
//                               showChangedTaskStatus(
//                                   'Cancelled',
//                                   cancelledTaskModel.data?[index].sId ??
//                                       '', () {
//                                 cancelTasks();
//                               });
//                             },
//                             onDelete: () {
//                               deleteTask(cancelledTaskModel.data?[index].sId);
//                             },
//                           );
//                         }),
//                   )),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.green,
//         onPressed: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const AddNewTaskScreen()));
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../Widget/profile_summary_card.dart';
// import '../Widget/summary_card.dart';
// import '../Widget/task_item_card.dart';
//
// class ProgressTasksScreen extends StatefulWidget {
//   const ProgressTasksScreen({super.key});
//
//   @override
//   State<ProgressTasksScreen> createState() => _NewTasksScreenState();
// }
//
// class _NewTasksScreenState extends State<ProgressTasksScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: Column(
//               children: [
//                 ProfileSummaryCard(),
//                 Expanded(
//                     child: ListView.builder(
//                       itemBuilder: (context, index) =>
//                           Padding(
//                             padding: const EdgeInsets.only(top: 18),
//                            // child: TaskItemCard(),
//                           ),
//                       itemCount: 8,
//                     ))
//               ],
//             )));
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data_network_caller/models/taskListModel.dart';
import '../../data_network_caller/network_caller.dart';
import '../../data_network_caller/network_reponse.dart';
import '../../data_network_caller/utility/urls.dart';
import '../Widget/profile_summary_card.dart';
import '../Widget/summary_card.dart';
import '../Widget/task_item_card.dart';

import '../Widget/task_item_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  bool getProgressTaskInProgress = false;
  TaskListModel taskListModel = TaskListModel();

  Future<void> getCancelledTaskScreen() async {
    getProgressTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.getCancelledTask);
    if (response.isSuccess) {
      taskListModel = TaskListModel.fromJson(response.jsonResponse!);
    }
    getProgressTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getCancelledTaskScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const ProfileSummaryCard(),
              Expanded(
                child: Visibility(
                  visible: getProgressTaskInProgress == false,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: RefreshIndicator(
                    onRefresh: getCancelledTaskScreen,
                    child: ListView.builder(
                      itemCount: taskListModel.taskList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return TaskItemCard(
                          task: taskListModel.taskList![index],
                          onStatusChange: () {
                            getCancelledTaskScreen();
                          },
                          showProgress: (inProgress) {
                            getProgressTaskInProgress = inProgress;
                            if (mounted) {
                              setState(() {});
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}