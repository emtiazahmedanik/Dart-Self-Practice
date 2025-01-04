import 'dart:io';

main(){
  Quiz quiz = Quiz();
  while(true){
    print("0.Exit\n1.Add Question\n2.Start Quiz ");
    int? number = int.tryParse(stdin.readLineSync()!);
    if(number!=null){
      if(number==0){
        exit(0);
      }else if(number==1){
        quiz.addQuestion();
      }else if(number==2){
        quiz.startQuiz();
      }
    }
  }

}
class Question{
  String? questionText;
  List<String> options;
  int? correctIndex;
  int? points;

  Question({required this.questionText,required this.options,required this.correctIndex,required this.points});
}

class Quiz{
  List<Question> questionList = [];
  void addQuestion(){
    print('Enter number of question:');
    int? qnum = int.tryParse(stdin.readLineSync()!);
    String? questionText;
    int? correctIndex;
    int? points;
    for(int i=1;i<=qnum!;i++){
      List<String> options=[];
      print('Enter question $i');
      print('Question:');
      questionText = stdin.readLineSync()!;
      print('Options:');
      print('A:');
      String? optionA = stdin.readLineSync()!;
      print('B:');
      String? optionB = stdin.readLineSync()!;
      print('C:');
      String? optionC = stdin.readLineSync()!;
      options.add(optionA);
      options.add(optionB);
      options.add(optionC);

      print("Correct Answer index:");
      correctIndex = int.tryParse(stdin.readLineSync()!);

      print("Points:");
      points = int.tryParse(stdin.readLineSync()!);
      Question question = Question(questionText: questionText, options: options, correctIndex: correctIndex, points: points);
      questionList.add(question);
    }

  }

  void startQuiz(){
    Question question;
    for(final question in questionList){
      print("Q. ${question.questionText}");
      List<String> option = question.options;
      int i=1;
      for(int opt=0;opt<option.length; opt++){
        print("$i: ${option[opt]}");
        i++;

      }


    }
  }
}