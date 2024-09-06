import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/unit_test/counter/counter_controller.dart';
void main(){

  test('initial value', (){
    var counter = CounterController();
    expect(counter.value.value, 0);
  });

  test('increment by 1 value', (){
    var counter = CounterController();
    counter.increment();
    expect(counter.value.value, 1);
  });
  test('decrement by 1 value', (){
    var counter = CounterController();
    counter.increment();
    counter.decrement();
    expect(counter.value.value, 0);
  });
}