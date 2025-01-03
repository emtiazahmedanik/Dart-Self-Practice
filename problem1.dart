import 'dart:io';

main(){
  TaskManager taskManager = TaskManager();
  while(true){
    print("1. Add Task\n2. Update Task\n3. Task List\n4. Show overdue task\n0. Exit");
    int? num = int.tryParse(stdin.readLineSync()!);
    try{
      if(num==1){
        taskManager.addTask();
      }else if(num==3){
        taskManager.showTaskList();
      }else if(num==0){
        exit(0);
      }
    }catch(e){
      print(e);
    }
  }

}
class Task{
  int? id;
  String? title;
  String? description;
  String? status;
  String? duedate;

  Task({required this.id,required this.title,required this.description,required this.status,required this.duedate});
}

class TaskManager{
  List<Task> tasklist = [];

  void addTask(){
    String? status;
    print("Enter id:");
    int? id = int.tryParse(stdin.readLineSync()!);
    print("Enter title:");
    String? title = stdin.readLineSync()!;
    print("Enter description:");
    String? description = stdin.readLineSync()!;

    print("Enter status: 1.Pending 2.In Progress 3. Complete");
    int? n = int.tryParse(stdin.readLineSync()!);
    if(n==1){
      status = "Pending";
    }else if(n==2){
      status = "In Progress";
    }else if(n==3){
      status = "Complete";
    }

    print("Enter duedate:");
    String? duedate = stdin.readLineSync()!;
    Task task = Task(id: id, title: title, description: description, status: status, duedate: duedate);
    tasklist.add(task);
  }

  void showTaskList(){
    Task task;
    for(final task in tasklist){
      print('Id:${task.id}\n');
      print('Title:${task.title}\n');
      print('Description:${task.description}\n');
      print('Status:${task.status}\n');
      print('Due date:${task.duedate}\n');
      print("-----------------------------------------------");
    }
  }

}