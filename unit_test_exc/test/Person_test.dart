import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test_exc/Person.dart';

class MockPerson extends Mock implements Person{}

void main() {
  Person person = Person("ayam", [1, 2, 3], -20);
  MockPerson mp = MockPerson();
// favnum ga 3
// namenya bukan ayam
// data type yang diinput ga sesuai
// data yang diisi kosong
// height negatif

  test("test name", () {
    expect(person.name, equals("ayam"));
    expect(person.name, isNotEmpty);
    expect(person.name, isA<String>());
  });

  test("test height", () {
    expect(person.getHeight, equals(0));
    expect(person.getHeight, isNotNull);
    expect(person.getHeight, isNonNegative);
    person.setHeight = -20;
    expect(person.getHeight, isNonNegative);
    expect(person.getHeight, isA<int>());
  });

  test("test age", () {
    expect(person.getAge(), equals(20));
    expect(person.getAge(), isNotNull);
    expect(person.getAge(), isPositive);
    person.setAge(-20);
    expect(person.getAge(), isPositive);
    expect(person.getAge(), isA<int>());
  });

  test("test favNum", () {
    expect(person.favNum, allOf([hasLength(3)]));
    person.addFavNum(-1);
    expect(person.favNum, allOf([hasLength(4), isNot(anyElement(isNegative))]));
  });

  test("test mock", () async{
    when(mp.getFuture()).thenAnswer((realInvocation) => Future.value(true));
    bool res = await mp.getFuture();
    expect(res, equals(true));
  });
}
