import 'package:flutter/material.dart';
import 'package:treinadorpro/core/utils/global.dart';
import 'package:treinadorpro/core/widgets/pro_widget_tag.dart';
import 'package:treinadorpro/features/trainingpackage/presentation/pages/training_package_page_detail.dart';

import '../../../../core/domain/entities/training_pack.dart';
import '../../../newstudent/presentation/pages/new_student_page.dart';

class ProWidgetCardPackTraining extends StatelessWidget {
  final TrainingPack pkg;

  const ProWidgetCardPackTraining({super.key, required this.pkg});

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      title: Text(pkg.description, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${pkg.modality?.namePt}'),
          Text('${pkg.durationDays} dias • ${pkg.weeklyFrequency}x/semana'),
          Text(pkg.notes),
          Text(
            '${pkg.currency}\$ ${pkg.price.toStringAsFixed(2)}',
            style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          getStatus(pkg.status),
          SizedBox(width: 8, height: 8),

          Wrap(
            children: [
              SizedBox(width: 8, height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TrainingPackagePageDetail(packTrainingEntity: pkg),
                    ),
                  );
                },
                icon: Icon(Icons.visibility),
                label: Text('Detalhes'),
              ),
            ],
          ),
        ],
      ),
      onTap: () {},
    ),
  );
}
