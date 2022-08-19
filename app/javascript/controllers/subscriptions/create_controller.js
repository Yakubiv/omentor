import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
  }

  resetFormFields() {
    document.getElementById('news_subscriber_email').value = '';
  }
}
