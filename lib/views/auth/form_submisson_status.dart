abstract class FormSubmissionStatus {
  FormSubmissionStatus();
}

 class InitialFormStatus extends FormSubmissionStatus{
    InitialFormStatus();
 }

 class FormSubmitting extends FormSubmissionStatus{}

 class SubmissionSuccess extends FormSubmissionStatus{}

 class SubmissonFailed extends FormSubmissionStatus{
  final Object exception ;

  SubmissonFailed(this.exception);
 }