import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tennis-schools"
export default class extends Controller {
  static targets = ["hideable"];

  showInactiveClubs(event) {
    if (event.target.checked) {
      this.hideableTargets.forEach(element => {
        element.classList.remove('d-none');
      });
    } else {
      this.hideableTargets.forEach(element => {
        element.classList.add('d-none');
      });
    }
  }
}
