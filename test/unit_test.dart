import 'package:flutter_test/flutter_test.dart';
import 'package:taski/domain/entities/task.dart';

void main() {
  test('Deve criar uma tarefa com título, descrição e como não concluída', () {
    List<Task> tasks = [];

    final task = Task(
      title: 'Title',
      description: 'Description',
      date: DateTime.now().toIso8601String(),
      isDone: false,
    );

    tasks.add(task);

    expect(tasks.length, 1);
    expect(tasks.first.title, 'Title');
    expect(tasks.first.description, 'Description');
    expect(tasks.first.isDone, false);
  });

  test('Deve atualizar o título e a descrição de uma tarefa existente', () {
    List<Task> tasks = [];

    final task = Task(
      title: 'Title',
      description: 'Description',
      date: DateTime.now().toIso8601String(),
      isDone: false,
    );

    tasks.add(task);

    final updatedTask = Task(
      id: task.id,
      title: 'Updated Title',
      description: 'Updated Description',
      date: task.date,
      isDone: task.isDone,
    );

    tasks.removeWhere((task) => task.id == updatedTask.id);

    tasks.add(updatedTask);

    expect(tasks.length, 1);
    expect(tasks.first.title, 'Updated Title');
    expect(tasks.first.description, 'Updated Description');
    expect(tasks.first.isDone, false);
    expect(tasks.first.date, task.date);
  });

  test('Deve alternar o estado de conclusão da tarefa', () {
    List<Task> tasks = [];

    final task = Task(
      title: 'Title',
      description: 'Description',
      date: DateTime.now().toIso8601String(),
      isDone: false,
    );

    tasks.add(task);

    final updatedTask = Task(
      id: task.id,
      title: task.title,
      description: task.description,
      date: task.date,
      isDone: !task.isDone,
    );

    tasks.removeWhere((task) => task.id == updatedTask.id);

    tasks.add(updatedTask);

    expect(tasks.length, 1);
    expect(tasks.first.isDone, true);
  });

  test('Deve remover uma tarefa pelo seu ID', () {
    final tasks = [
      Task(id: 1, title: 'Title 1', description: 'Desc 1', date: DateTime.now().toIso8601String(), isDone: false),
      Task(id: 2, title: 'Title 2', description: 'Desc 2', date: DateTime.now().toIso8601String(), isDone: false),
    ];

    final taskIdToRemove = 1;
    tasks.removeWhere((task) => task.id == taskIdToRemove);

    expect(tasks.length, 1);
    expect(tasks.first.id, 2);
  });

  test('Deve remover todas as tarefas concluídas da lista', () {
    final tasks = [
      Task(id: 1, title: 'Title 1', description: 'Desc 1', date: DateTime.now().toIso8601String(), isDone: true),
      Task(id: 2, title: 'Title 2', description: 'Desc 2', date: DateTime.now().toIso8601String(), isDone: false),
      Task(id: 3, title: 'Title 3', description: 'Desc 3', date: DateTime.now().toIso8601String(), isDone: true),
    ];

    final filteredTasks = tasks.where((task) => !task.isDone).toList();

    expect(filteredTasks.length, 1);
    expect(filteredTasks.first.id, 2);
  });
}
