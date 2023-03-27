import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sort"
export default class extends Controller {
  setOrder(event) {
    event.preventDefault();
    const sortByElement = document.getElementById("sort_by")
    sortByElement.value = this.element.dataset.sortBy;
    this.element.closest("form").requestSubmit();
  }
}
