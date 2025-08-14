import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]
  static values = { saveUrl: String, submitUrl: String, approveUrl: String, rejectUrl: String }

  save() {
    if(this.saveUrlValue !== "#") {
      this.formTarget.action = this.saveUrlValue
      this.formTarget.requestSubmit()
    }
  }

  submit() {
    if(this.submitUrlValue !== "#") {
      this.formTarget.action = this.submitUrlValue
      this.formTarget.requestSubmit()
    }
  }

  approve() {
    if(this.approveUrlValue !== "#") {
      this.formTarget.action = this.approveUrlValue
      this.formTarget.requestSubmit()
    }
  }

  reject() {
    if(this.rejectUrlValue !== "#") {
      this.formTarget.action = this.rejectUrlValue
      this.formTarget.requestSubmit()
    }
  }
}
