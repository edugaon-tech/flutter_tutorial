
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/unit_test/todo/todo_controller.dart';
import 'package:flutter_tutorial/unit_test/todo/todo_model.dart';

void main(){
  test("initial value", (){
    var todoController = TodoController();
    expect(todoController.getTodos, <TodoModel>[]);
  });

  test('add new todo', (){
    var todoController = TodoController();
    var data = TodoModel(title: "title", subtitle: "subtitle");
    todoController.addNewTodo(data);
    expect(todoController.getTodos[0], data);
  });

  test('add new todo', (){
    var todoController = TodoController();
    var data = TodoModel(title: "title", subtitle: "subtitle");
    todoController.addNewTodo(data);
    expect(todoController.getTodos[0], data);
  });

}