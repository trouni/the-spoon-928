import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="side-info"
export default class extends Controller {
  static targets = ['details', 'form']

  connect() {
    console.log(this.element);
  }

  edit() {
    this.detailsTarget.classList.add('d-none')
    this.formTarget.classList.remove('d-none')
  }

  update(event) {
    event.preventDefault()
    console.log(new FormData(this.formTarget))

    const url = this.formTarget.action
    fetch(
      url,
      {
        method: 'PATCH',
        headers: { Accept: 'text/plain' },
        // headers: { Accept: 'application/json' },
        body: new FormData(this.formTarget)
      }
    ).then(response => response.text())
    .then(data => {
      this.element.outerHTML = data
    })
  }
}
