import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/add_training_pack_request_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_pack_repository.dart';
import 'package:treinadorpro/core/provider/training_pack_provider.dart';
import 'package:treinadorpro/core/widgets/pro_widget_text_form_field.dart';
import 'package:treinadorpro/features/trainingpackage/presentation/blocs/add_training_package_cubit.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/data/models/modality_model.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/provider/modality_provider.dart';
import '../../../../core/states/handler_state.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../../../../core/widgets/pro_widget_searchable_dropdown.dart';
import '../../../woukoutsheet/presentation/blocs/build_workout_sheet_cubit.dart';

class AddTrainingPackagePage extends ConsumerStatefulWidget {
  const AddTrainingPackagePage({super.key});

  @override
  ConsumerState<AddTrainingPackagePage> createState() => _AddTrainingPackagePageState();
}

class _AddTrainingPackagePageState extends ConsumerState<AddTrainingPackagePage> {
  late final ITrainingPackRepository _trainingPackRepository;
  late final AppConfig config;
  late ModalityModel? _modality;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _durationDaysController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();

  String _selectedCurrency = 'BRL';

  // Currency list (ISO 4217) with English names in comments
  List<String> currencies = [
    'AED', // United Arab Emirates Dirham
    'ARS', // Argentine Peso
    'AUD', // Australian Dollar
    'BRL', // Brazilian Real
    'CAD', // Canadian Dollar
    'CHF', // Swiss Franc
    'CLP', // Chilean Peso
    'CNY', // Chinese Yuan
    'COP', // Colombian Peso
    'DKK', // Danish Krone
    'EGP', // Egyptian Pound
    'EUR', // Euro
    'GBP', // British Pound Sterling
    'HKD', // Hong Kong Dollar
    'IDR', // Indonesian Rupiah
    'ILS', // Israeli New Shekel
    'INR', // Indian Rupee
    'JPY', // Japanese Yen
    'KRW', // South Korean Won
    'MXN', // Mexican Peso
    'MYR', // Malaysian Ringgit
    'NOK', // Norwegian Krone
    'NZD', // New Zealand Dollar
    'PEN', // Peruvian Sol
    'PLN', // Polish Zloty
    'RUB', // Russian Ruble
    'SAR', // Saudi Riyal
    'SEK', // Swedish Krona
    'SGD', // Singapore Dollar
    'THB', // Thai Baht
    'TRY', // Turkish Lira
    'TWD', // New Taiwan Dollar
    'USD', // United States Dollar
    'UYU', // Uruguayan Peso
    'VND', // Vietnamese Dong
    'ZAR', // South African Rand
  ];

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    _trainingPackRepository = ref.read(trainingPackRepositoryProvider);

    Future.microtask(() async {
      ref.read(modalityViewModelProvider.notifier).findAllActiveModalities();
    });
  }

  Widget _buildModalitySearchable(List<ModalityModel> modalityList) {
    final sortedList = [...modalityList]..sort((a, b) => a.getName().compareTo(b.getName()));

    final initial = null;

    return ProWidgetSearchableDropdown<ModalityModel>(
      items: sortedList,
      hintTextSearch: "Pesquisar Modalidade...",
      hintTextItem: 'Selecione uma modalidade',
      initialValue: initial,
      onChanged: (value) => setState(() => _modality = value!),
    );
  }

  Widget _buildFormArea(HandlerState state, BuildContext context, AppConfig config) {
    final modalityState = ref.watch(modalityViewModelProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modality
            Text('Modalidade'),
            modalityState.when(
              data: (modalityList) => _buildModalitySearchable(modalityList),
              error: (e, _) => Center(child: Text('Error: $e')),
              loading: () => Center(child: CircularProgressIndicator()),
            ),

            // description
            SizedBox(height: 16),
            ProWidgetTextFormField(controller: _descriptionController, label: 'Descrição'),

            // duration days
            SizedBox(height: 16),
            ProWidgetTextFormField(
              controller: _durationDaysController,
              label: 'Duração (dias)',
              keyboardType: TextInputType.number,
            ),

            // week frequency days
            SizedBox(height: 16),
            ProWidgetTextFormField(
              controller: _frequencyController,
              label: 'Frequência semanal (dias)',
              keyboardType: TextInputType.number,
            ),

            // Price
            SizedBox(height: 16),
            Text('Preço'),
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(prefixIcon: Icon(Icons.attach_money)),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),

            // Currency
            SizedBox(height: 16),
            Text('Moeda'),
            DropdownButton<String>(
              value: _selectedCurrency,
              items: currencies
                  .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) => setState(() => _selectedCurrency = value!),
            ),

            // notes
            SizedBox(height: 16),
            TextFormField(
              controller: _noteController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Notas',
                hintText: 'Escreva sua nota aqui...',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),

            // action button
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                onPressed: () {
                  final AddTrainingPackRequestModel request = AddTrainingPackRequestModel(
                    modalityId: _modality?.id,
                    description: _descriptionController.text,
                    durationDays: int.parse(_durationDaysController.text),
                    weeklyFrequency: int.parse(_frequencyController.text),
                    price: double.parse(_priceController.text),
                    currency: _selectedCurrency,
                    notes: _noteController.text,
                  );

                  // call cubit
                  context.read<AddTrainingPackageCubit>().addTrainingPack(request);
                },
                icon: Icon(Icons.save),
                label: Text('Salvar Novo Pacote'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size.fromHeight(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, HandlerState state, AppConfig config) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: _buildFormArea(state, context, config),
      ),
    );
  }

  Future<void> _processFormListenerFromCubitStateChanged(
    BuildContext context,
    HandlerState state,
  ) async {
    if (state.errorMessage != null) {
      final ExceptionApiModel exceptionApiModel = state.objectResponse as ExceptionApiModel;

      print("statusCode = ${exceptionApiModel.statusCode}");
      print("msgcode = ${exceptionApiModel.msgcode}");
      print("message = ${exceptionApiModel.message}");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
    } else if (!state.isLoading && state.errorMessage == null) {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(title: Text('Sucesso'), content: Text("Plano Salvo")),
      );
      Navigator.of(context).pop();

      // Navigator.popAndPushNamed(context, AppRoutes.workoutSheetDetailPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddTrainingPackageCubit(_trainingPackRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ADICIONAR PACOTE'),
          actions: [ProWidgetInfoAlertDialog(title: 'page', text: 'add_training_package_page.dart')],
        ),
        body: BlocConsumer<AddTrainingPackageCubit, HandlerState>(
          builder: (context, state) => _buildForm(context, state, config),
          listener: (context, state) => _processFormListenerFromCubitStateChanged(context, state),
        ),
      ),
    );
  }
}
