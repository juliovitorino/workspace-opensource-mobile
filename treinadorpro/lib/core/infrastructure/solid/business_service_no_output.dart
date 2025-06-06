abstract class IBusinessServiceNoOutput<Input> {
  void execute(String processId, Input input);
}