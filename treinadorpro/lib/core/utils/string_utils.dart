
String removeDiacritics(String str) {
  final withDia = 'áàãâäéèêëíìîïóòõôöúùûüçÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇ';
  final withoutDia = 'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';

  for (int i = 0; i < withDia.length; i++) {
    str = str.replaceAll(withDia[i], withoutDia[i]);
  }
  return str;
}

String getFirstString(String text){
  return text.split(' ')[0];
}

String? getContractStatus(String status) {
  Map<String, String> mapStatus = {
    'A': 'ATIVO',
    'B': 'BLOQUEADO',
    'V': 'VENCIDO',
    'D': 'DELETADO',
    'I': 'INATIVO'
  };
  return mapStatus[status];
}
