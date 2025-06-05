enum ExecutionMethod {
  circuito,
  serie,
  biSet,
  triSet,
  dropSet,
  piramide,
  cluster,
  livre,
  tempoCorrente,
  isometrico,
  isocinetico,
  pliometrico,
  emom,
  amrap,
  tabata,
  descansoAtivo,
  intervalo,
  tempoAlvo,
  repMaxima,
  combinado,
  funcional,
  resistido,
  semCarga,
}

extension ExecutionMethodExtension on ExecutionMethod {
  String get name {
    switch (this) {
      case ExecutionMethod.circuito:
        return 'CIRCUITO';
      case ExecutionMethod.serie:
        return 'SÉRIE';
      case ExecutionMethod.biSet:
        return 'BI-SET';
      case ExecutionMethod.triSet:
        return 'TRI-SET';
      case ExecutionMethod.dropSet:
        return 'DROP-SET';
      case ExecutionMethod.piramide:
        return 'PIRÂMIDE';
      case ExecutionMethod.cluster:
        return 'CLUSTER';
      case ExecutionMethod.livre:
        return 'LIVRE';
      case ExecutionMethod.tempoCorrente:
        return 'TEMPO CORRENTE';
      case ExecutionMethod.isometrico:
        return 'ISOMÉTRICO';
      case ExecutionMethod.isocinetico:
        return 'ISOCINÉTICO';
      case ExecutionMethod.pliometrico:
        return 'PLIOMÉTRICO';
      case ExecutionMethod.emom:
        return 'EMOM';
      case ExecutionMethod.amrap:
        return 'AMRAP';
      case ExecutionMethod.tabata:
        return 'TABATA';
      case ExecutionMethod.descansoAtivo:
        return 'DESCANSO ATIVO';
      case ExecutionMethod.intervalo:
        return 'INTERVALO';
      case ExecutionMethod.tempoAlvo:
        return 'TEMPO ALVO';
      case ExecutionMethod.repMaxima:
        return 'REPETIÇÃO MÁXIMA';
      case ExecutionMethod.combinado:
        return 'COMBINADO';
      case ExecutionMethod.funcional:
        return 'FUNCIONAL';
      case ExecutionMethod.resistido:
        return 'RESISTIDO';
      case ExecutionMethod.semCarga:
        return 'SEM CARGA';
    }
  }
  //
  // static ExecutionMethod? fromString(String value) {
  //   return ExecutionMethod.values.firstWhere(
  //         (e) => e.name.toLowerCase() == value.toLowerCase(),
  //     orElse: () => null,
  //   );
  // }
}
