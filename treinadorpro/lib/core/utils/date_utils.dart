
import '../data/models/contract_response_model.dart';

String getCorrectTime(ContractResponseModel contract) {
  Map<int, String?> mapDOW = {
    1: contract.monday,
    2: contract.tuesday,
    3: contract.wednesday,
    4: contract.thursday,
    5: contract.friday,
    6: contract.saturday,
    7: contract.sunday,
  };
  DateTime now = DateTime.now();
  int dayOfWeek = now.weekday;
  return mapDOW[dayOfWeek] ?? 'Unavailable time';
}