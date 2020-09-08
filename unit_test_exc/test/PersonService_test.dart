import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:unit_test_exc/Person.dart';
import 'package:unit_test_exc/PersonService.dart';
import 'package:flutter_test/flutter_test.dart';

class MockPersonService extends Mock implements http.Client {}

void main() {
  http.Client client = MockPersonService();
  test("test mock api", () async {
    String id = "1";
    when(client.get(".../person/"+id)).thenAnswer((realInvocation) async{
      return Future.value(http.Response('''{
        "name": "Angga",
        "id": $id,
        "height": 180,
        "favNum": [1,2,3]
      }''',200));
    });
    Person person = await PersonService.getPersonbyId(id, client);
    expect(person, equals(Person("Angga", [1,2,3], 180)));
  });
  test("test mock api", () async {
    String id = "1";
    when(client.get(".../person/"+id)).thenAnswer((realInvocation) async{
      return Future.value(http.Response('''{
        "name": "Angga",
        "id": $id,
        "height": 180,
        "favNum": [1,2,3]
      }''',400));
    });
    Person person = await PersonService.getPersonbyId(id, client);
    expect(person, throwsException);
  });
}
