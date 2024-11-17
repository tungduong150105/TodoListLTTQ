import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("update complete")
  }
  update() {
    console.log("update completed22222")
  }
}