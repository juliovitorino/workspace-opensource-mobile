import 'package:treinadorpro/core/data/models/modality_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

abstract class IModalityRepository extends Repository<ModalityModel, int>{
  Future<List<ModalityModel>> findAllActiveModalities();
}