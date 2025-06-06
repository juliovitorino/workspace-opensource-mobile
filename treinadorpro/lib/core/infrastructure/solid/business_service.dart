abstract class IBusinessService<Input, Output> {
  Output execute(String processId, Input input);
}