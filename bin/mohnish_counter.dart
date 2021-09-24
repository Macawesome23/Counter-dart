import 'dart:io';

void main(List<String> arguments) {
  double operationValue;
  int function;
  bool stop = false;
  String? tempInput;
  MohnishCounter mohnishCounter;

  // take input for incrementValue     String?  !=  String

  print('Please enter user name');
  tempInput = stdin.readLineSync();

  if (tempInput != null && tempInput.isNotEmpty) {
    mohnishCounter = MohnishCounter(
      userName: tempInput,
      count: 100,
    );
  } else {
    return;
  }

  while (!stop) {
    print('Enter operational value');
    tempInput = stdin.readLineSync();

    if (tempInput != null && tempInput.isNotEmpty) {
      print('tempInput is : $tempInput');
      operationValue = double.parse(tempInput);
    } else {
      operationValue = 0;
    }

    print('''
    Enter your choice
    0. Print value
    1. Increment
    2. Decrement
    3. Change username
    4. Divide
    5. Multiply
    6. Remainder
    7. Stop the operation
  ''');

    tempInput = stdin.readLineSync();

    if (tempInput != null && tempInput.isNotEmpty) {
      function = int.parse(tempInput);
    } else {
      function = -1;
    }

    print('starting counter with value: ${mohnishCounter.count}');

    switch (function) {
      case 0:
        print(mohnishCounter.count);
        break;
      case 1:
        incrementCounter(counter: mohnishCounter, incrementValue: operationValue);
        break;
      case 2:
        decrementCounter(counter: mohnishCounter, decrementValue: operationValue);
        break;
      case 3:
        changeUserName(counter: mohnishCounter);
        break;
      case 4:
        divideCounter(counter: mohnishCounter, divideValue: operationValue);
        break;
      case 5:
        multiplyCounter(counter: mohnishCounter, multiplyValue: operationValue);
        break;
      case 6:
        remainderCounter(counter: mohnishCounter, remainderValue: operationValue);
        break;
      case 7:
        stop = true;
        break;
      default:
        print('Kuch bhi nahi hua');
    }
    print(
        'Current value of count is ${mohnishCounter.count} by ${mohnishCounter.userName}');
  }

  print(
      'Final value of count is ${mohnishCounter.count} ${mohnishCounter.userName}');
}

void changeUserName({required MohnishCounter counter}) {
  String? tempInput = stdin.readLineSync();
  if (tempInput != null && tempInput.isNotEmpty) {
    print('New user is :$tempInput');
    counter.userName = tempInput;
  }
}

void incrementCounter(
    {required MohnishCounter counter, required double incrementValue}) {
  counter.count = counter.count + incrementValue;
}

void decrementCounter(
    {required MohnishCounter counter, required double decrementValue}) {
  counter.count = counter.count + decrementValue;
}

void divideCounter({required MohnishCounter counter, required double divideValue}) {
  if (counter.count == 0) {
    print('Divide by zero');
  } else {
    counter.count = counter.count / divideValue;
  }
}
void multiplyCounter({required MohnishCounter counter, required double multiplyValue}) {
 {
    counter.count = counter.count * multiplyValue;
  }
}
void remainderCounter({required MohnishCounter counter, required double remainderValue}) {
 {
    counter.count = counter.count % remainderValue;
  }
}
class MohnishCounter {
  double count;
  String userName;

  MohnishCounter({required this.count, required this.userName});
}
