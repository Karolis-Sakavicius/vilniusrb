import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    let target = this.element

    this.observer = new MutationObserver(mutations => {
      target.classList.remove('ugly-animation')
      setTimeout(() => {
        target.classList.add('ugly-animation')
      }, 0)
    });

    this.observer.observe(target, {
      childList:     true,
      characterData: true,
      subtree: true
    });
  }

  disconnect() {
    this.observer.disconnect()
  }
}
