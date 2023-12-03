
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data_network_caller/models/task.dart';
import '../../data_network_caller/models/taskListModel.dart';
import '../../data_network_caller/network_caller.dart';
import '../../data_network_caller/network_reponse.dart';
import '../../data_network_caller/utility/urls.dart';
import 'alert_dialogue.dart';

enum TaskStatus {
  New,
  Progress,
  Completed,
  Cancelled,
}

class TaskItemCard extends StatefulWidget {

  const TaskItemCard({
    super.key,
    required this.task,
    required this.onStatusChange,
    required this.showProgress,
  });

  final Task task;
  final VoidCallback onStatusChange;
  final Function(bool) showProgress;

  @override
  State<TaskItemCard> createState() => _TaskItemCardState();
}

class _TaskItemCardState extends State<TaskItemCard> {

 TaskListModel taskListModel = TaskListModel();
 Future<void> updateTaskStatus(String status) async {
   widget.showProgress(true);
   final response = await NetworkCaller()
       .getRequest(Urls.updateTaskStatus(widget.task.sId ?? '', status));
   if (response.isSuccess) {
     widget.onStatusChange();
   }
   widget.showProgress(false);
 }

 @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade100,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.task.title ?? '',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Text(widget.task.description ?? '',style: TextStyle(fontSize: 18),),
              Text('Date : ${widget.task.createdDate}',style: TextStyle(fontSize: 15),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    label: Text(
                      widget.task.status ?? 'New',
                      style: const TextStyle(color: Colors.white,fontSize: 20),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  Wrap(
                    children: [
                      IconButton(
                          onPressed: () {
                            DeleteItem( widget.task.sId ?? '',);

                          },
                          icon: const Icon(Icons.delete_forever_outlined,color: Colors.red,)),   IconButton(
                          onPressed: () {
                            showUpdateStatusModal();
                          },
                          icon: const Icon(Icons.edit)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );

  }
  Future<void> DeleteTask() async {
widget.showProgress(true);
 setState(() {

 });
widget.showProgress(false);
    final NetworkResponse response =
    await NetworkCaller().deleteRequest(Urls.deleteTaskUrl(widget.task.sId ?? '',));
    if (response.isSuccess) {

    }
    widget.showProgress(false);
setState(() {

});
  }

  DeleteItem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Onece delete, you can't get it back"),
            actions: [
              OutlinedButton(onPressed: () async {
                DeleteTask();
                Navigator.pop(context);
                TaskDeleteAlertDialog(context,"Successful","Task Delete Successful");

                setState(() {

                 });

              }, child: Text('Yes')),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('No')),

            ],
          );

        }
    );
  }

  void showUpdateStatusModal() {
    List<ListTile> items = TaskStatus.values
        .map((e) => ListTile(
      title: Text(e.name),
      onTap: () {
        updateTaskStatus(e.name);
        Navigator.pop(context);
      },
    ))
        .toList();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update status'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: items,
            ),
            actions: [
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}


