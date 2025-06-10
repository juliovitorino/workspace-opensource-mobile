import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/models/page_result_response_model.dart';
import 'package:treinadorpro/core/domain/entities/training_pack.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/training_pack_provider.dart';
import 'package:treinadorpro/core/viewmodel/training_pack_page_result_view_model.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_alert_dialog.dart';
import 'package:treinadorpro/features/trainingpackage/presentation/widgets/pro_widget_card_pack_training.dart';

import '../../../../core/data/models/training_pack_model.dart';

class TrainingPackagePage extends ConsumerStatefulWidget {
  const TrainingPackagePage({super.key});

  @override
  ConsumerState<TrainingPackagePage> createState() =>
      _TrainingPackagePageState();
}

class _TrainingPackagePageState extends ConsumerState<TrainingPackagePage> {
  late final AppConfig config;

  List<TrainingPack>? packTrainingEntityList;

  //controllers for infinite scroll
  late final ScrollController _scrollController;
  int _currentPage = 1;
  late final _pageSize;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    _pageSize = config.defaultPageSize;
    _scrollController = ScrollController()..addListener(_onScroll);

    Future.microtask(() {
      _loadPage();
    });
    // copy from mocked if environment is dev
    packTrainingEntityList = TrainingPack.trainingPacks.toList();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_isLoadingMore && _hasMoreData) {
        _loadPage();
      }
    }
  }

  Future<PageResultResponseModel<TrainingPackModel>?> _loadPage() async {
    final response = await ref
        .read(trainingPackPageResultViewModelProvider.notifier)
        .findAllTrainingPackByPersonalExternalId(
          '39c0fd19-dbd2-4c74-8104-7105ca159c7b',
          _currentPage,
          _pageSize,
        );

    if (response != null && response.content.length < _pageSize) {
      _hasMoreData = false;
    }

    _currentPage++;
    _isLoadingMore = false;

    return null;
  }

  Widget _buildListView(PageResultResponseModel pageResultResponseModel) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(12),
      itemCount: pageResultResponseModel.content.length,
      itemBuilder: (context, index) {
        final trainingPackItem = pageResultResponseModel.content[index];
        return ProWidgetCardPackTraining(pkg: trainingPackItem);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final trainingPackPageResultState = ref.watch(
      trainingPackPageResultViewModelProvider,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacotes de Treino'),
        actions: [
          if (config.isDebugMode)
            ProWidgetInfoAlertDialog(
              title: "Page",
              text: "training_packages_page.dart",
            ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navegar para AddTrainingPackagePage (a ser implementado)
            },
          ),
        ],
      ),
      body: trainingPackPageResultState.when(
        data: (pageResult) => _buildListView(pageResult),
        error: (e, _) => Center(child: Text('Error: $e')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Adicionar novo pacote',
        child: Icon(Icons.add),
      ),
    );
  }
}
