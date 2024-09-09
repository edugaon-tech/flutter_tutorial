import 'package:flutter_tutorial/unit_test/todo/todo_model.dart';
import 'package:get/get.dart';

class TodoController  extends GetxController{
  final List<TodoModel> _todos = <TodoModel>[];
  List<TodoModel> get getTodos => _todos;

  addNewTodo(TodoModel todo){
    _todos.add(todo);
  }

  removeTodo(int index){
    _todos.removeAt(index);
  }
  updateTodo(TodoModel todo, int index){
    _todos[index] = todo;
  }

}