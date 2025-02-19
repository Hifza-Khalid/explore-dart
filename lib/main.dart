/*
  main.dart
  Explore Dart: A demonstration of Dart fundamentals, object-oriented programming,
  asynchronous programming, and additional advanced concepts.
*/

import 'dart:async';

// --------------------------
// Dart Fundamentals
// --------------------------

// Global variable example
int globalCounter = 0;

// A simple function to add two numbers
int addNumbers(int a, int b) {
  return a + b;
}

// --------------------------
// Object-Oriented Programming (OOP)
// --------------------------

// Base class: Animal
class Animal {
  String name;
  Animal(this.name);

  // Method to demonstrate behavior
  void speak() {
    print('$name makes a noise.');
  }
}

// Derived class: Dog inherits from Animal and overrides speak()
class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void speak() {
    print('$name barks.');
  }
}

// Interface demonstration using an abstract class
abstract class Runner {
  void run();
}

// Class implementing the Runner interface
class Athlete implements Runner {
  String name;
  Athlete(this.name);

  @override
  void run() {
    print('$name is running.');
  }
}

// --------------------------
// Asynchronous Programming
// --------------------------

// Function that simulates fetching data asynchronously
Future<String> fetchData() async {
  // Simulate network delay
  await Future.delayed(Duration(seconds: 2));
  return 'Fetched Data';
}

// Function that returns a stream of numbers
Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    // Simulate delay between stream events
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

// --------------------------
// Additional Concepts
// --------------------------

// 1. Collections Demo: Lists, Maps, and Sets
void collectionsDemo() {
  // List demonstration
  List<int> numbers = [5, 3, 8, 1];
  print('\n--- Collections Demo: List ---');
  print('Original list: $numbers');
  numbers.sort();
  print('Sorted list: $numbers');

  // Map demonstration
  Map<String, int> fruitCount = {'apple': 3, 'banana': 5, 'orange': 2};
  print('\n--- Collections Demo: Map ---');
  fruitCount.forEach((fruit, count) {
    print('$fruit: $count');
  });

  // Set demonstration (automatically removes duplicates)
  Set<String> uniqueNames = {'Alice', 'Bob', 'Alice'};
  print('\n--- Collections Demo: Set ---');
  print('Unique names: $uniqueNames');
}

// 2. Null Safety Demo
void nullSafetyDemo() {
  print('\n--- Null Safety Demo ---');
  // Nullable variable demonstration using "?" syntax
  int? maybeNumber;
  print('Value of maybeNumber (should be null): $maybeNumber');
  maybeNumber = 42;
  print('Value of maybeNumber after assignment: $maybeNumber');
}

// 3. Exception Handling Demo
void exceptionHandlingDemo() {
  print('\n--- Exception Handling Demo ---');
  try {
    // This will throw an exception (integer division by zero)
    int result = 10 ~/ 0;
    print('Result: $result');
  } catch (e) {
    print('Caught an exception: $e');
  } finally {
    print('Exception handling demo complete.');
  }
}

// 4. Generic Function Demo
// A generic function that returns the first element of a list
T getFirstElement<T>(List<T> list) {
  if (list.isNotEmpty) {
    return list.first;
  }
  throw Exception('List is empty');
}

// 5. Extension Method Demo
// An extension on List<int> to sum its elements
extension ListSum on List<int> {
  int sum() {
    return this.fold(0, (prev, element) => prev + element);
  }
}

// 6. Mixin Demo
// A mixin to add logging functionality
mixin Logger {
  void log(String message) {
    print('[LOG]: $message');
  }
}

// A class that uses the Logger mixin
class Service with Logger {
  void performAction() {
    log('Action performed in Service.');
  }
}

// --------------------------
// Main Function
// --------------------------

void main() async {
  // Dart Fundamentals Demo
  print('--- Dart Fundamentals Demo ---');
  int result = addNumbers(10, 20);
  print('Addition result: $result');

  // Control Structures: For loop
  for (int i = 0; i < 3; i++) {
    print('For loop iteration: $i');
  }

  // Control Structures: While loop
  int count = 0;
  while (count < 3) {
    print('While loop count: $count');
    count++;
  }

  // OOP Demo
  print('\n--- OOP Demo ---');
  Animal animal = Animal('Generic Animal');
  animal.speak();

  Dog dog = Dog('Buddy');
  dog.speak();

  Athlete athlete = Athlete('Usain');
  athlete.run();

  // Asynchronous Programming Demo
  print('\n--- Asynchronous Programming Demo ---');
  print('Fetching data asynchronously...');
  String data = await fetchData();
  print('Data received: $data');

  print('Listening to number stream:');
  await for (int number in numberStream()) {
    print('Stream emitted: $number');
  }

  // Additional Concepts Demos
  collectionsDemo();
  nullSafetyDemo();
  exceptionHandlingDemo();

  // Generic Function Demo
  print('\n--- Generic Function Demo ---');
  try {
    List<String> names = ['Alice', 'Bob', 'Charlie'];
    String firstName = getFirstElement<String>(names);
    print('First element in names list: $firstName');
  } catch (e) {
    print('Error in Generic Function Demo: $e');
  }

  // Extension Method Demo
  print('\n--- Extension Method Demo ---');
  List<int> intList = [1, 2, 3, 4, 5];
  print('Sum of intList: ${intList.sum()}');

  // Mixin Demo
  print('\n--- Mixin Demo ---');
  Service service = Service();
  service.performAction();

  print('\nAll demos completed.');
}
