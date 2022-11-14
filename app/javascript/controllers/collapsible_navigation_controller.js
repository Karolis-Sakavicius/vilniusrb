import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  open() {
    document.querySelector('.offcanvas-collapse').classList.toggle('open')
  }
}
