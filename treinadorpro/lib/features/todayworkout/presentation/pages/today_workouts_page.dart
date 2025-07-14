import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/contract_response_model.dart';
import 'package:treinadorpro/core/provider/contract_provider.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/workout_sheet_page.dart';

class TodayWorkoutPage extends ConsumerStatefulWidget {
  const TodayWorkoutPage({super.key});

  @override
  ConsumerState<TodayWorkoutPage> createState() => _TodayWorkoutPageState();
}

class _TodayWorkoutPageState extends ConsumerState<TodayWorkoutPage> {
  @override
  void initState() {
    Future.microtask(() async {
      ref
          .read(findAllContractTodayWorkoutViewModelProvider.notifier)
          .findAllActiveContracts();
    });
  }

  String _getCorrectTime(ContractResponseModel contract) {
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

  Widget _buildCard(ContractResponseModel contract){
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_getCorrectTime(contract)} - ${contract.studentUser.name}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Icon(
                //   workout.confirmed
                //       ? Icons.check_circle
                //       : Icons.help_outline,
                //   color: workout.confirmed ? Colors.green : Colors.orange,
                // ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              '${contract.description} • ${contract.trainingPack.description}',
            ),
            Text('📍 SMV360'),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.chat),
                  label: Text('WhatsApp'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => WorkoutSheetPage()),
                    );
                  },
                  icon: Icon(Icons.assignment),
                  label: Text('Abrir Ficha'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(List<ContractResponseModel> data) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _buildCard(data[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final contractState = ref.watch(
      findAllContractTodayWorkoutViewModelProvider,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Treinos de Hoje')),
      body: contractState.when(
        data: (data) => _buildListView(data.objectResponse),
        error: (e, _) => Center(child: Text('error: $e')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
