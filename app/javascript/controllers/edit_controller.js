import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["showEdit", "obj1", "obj2", "obj3", "obj4"]
  connect() {
    // console.log("Edit Controller")
  }
  click() {
    console.log("Edit Click")
    this.showEditTarget.classList.remove("hidden")
    this.obj1Target.classList.add("hidden")
    this.obj2Target.classList.add("hidden")
    this.obj3Target.classList.add("hidden")
    this.obj4Target.classList.add("hidden")
  }
}