enum FieldValidationError { fieldIsEmpty }

class DefaultValidator {
  Set<FieldValidationError> validate(String data) {
    final errors = Set<FieldValidationError>();

    if (data.isEmpty) {
      errors.add(FieldValidationError.fieldIsEmpty);
    }

    return errors;
  }
}
