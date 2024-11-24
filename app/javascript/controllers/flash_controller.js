import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  connect() {
    console.log("Flash Controller")
    setTimeout(() => {
      this.element.remove()
    }, 3000)
  }
}