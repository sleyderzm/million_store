import debounce from 'debounce';
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {

  initialize(){
    this.submit = debounce(this.submit.bind(this), 1000);
  }
  submit() {
    this.element.form.requestSubmit();
  }
  selectedCategory(event) {
    event.preventDefault();
    var categoryIdElement = document.getElementById("category_id")
    categoryIdElement.value = this.element.dataset.categoryId;
    for(var domElement of document.getElementsByClassName("button-category-id")){
      domElement.classList.remove("bg-black")
      domElement.classList.remove("text-white")
      domElement.classList.add("bg-gray-100")
      domElement.classList.add("text-gray-600")
    }

    this.element.classList.add("bg-black")
    this.element.classList.add("text-white")
    this.element.classList.remove("bg-gray-100")
    this.element.classList.remove("text-gray-600")
    this.element.form.requestSubmit();
  }
}
