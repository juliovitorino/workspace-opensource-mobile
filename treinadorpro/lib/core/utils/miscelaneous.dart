
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/models/contract_response_model.dart';
import '../widgets/pro_widget_info_row.dart';
import '../widgets/pro_widget_section_title.dart';

Widget buildDays(ContractResponseModel contract) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        Icon(Icons.access_time),
        SizedBox(width: 8),
        ProWidgetSectionTitle(title: 'Agenda de Treino'),
      ],
    ),
    if (contract.monday != null) ProWidgetInfoRow(label: 'Segunda', value: contract.monday!),

    if (contract.tuesday != null) ProWidgetInfoRow(label: 'Terça', value: contract.tuesday!),

    if (contract.wednesday != null) ProWidgetInfoRow(label: 'Quarta', value: contract.wednesday!),

    if (contract.thursday != null) ProWidgetInfoRow(label: 'Quinta', value: contract.thursday!),

    if (contract.friday != null) ProWidgetInfoRow(label: 'Sexta', value: contract.friday!),

    if (contract.saturday != null) ProWidgetInfoRow(label: 'Sábado', value: contract.saturday!),

    if (contract.sunday != null) ProWidgetInfoRow(label: 'Domingo', value: contract.sunday!),
  ],
);
