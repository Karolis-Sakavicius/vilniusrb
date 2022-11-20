import { Controller } from "@hotwired/stimulus"
import { createPicker } from 'picmo';
import { createPopup } from '@picmo/popup-picker';

export default class extends Controller {
  static targets = ["button", "input"]

  connect() {
    this.picker = createPopup({
      emojiSize: '1.5rem',
      position: 'bottom-end'
    }, {
      referenceElement: this.buttonTarget,
      triggerElement: this.buttonTarget,
      showCloseButton: false
    })

    this.picker.picker.addEventListener('emoji:select', e => {
      this.inputTarget.value = this.inputTarget.value + e.emoji
    })
  }

  disconnect() {
    this.picker.destroy()
  }

  toggle() {
    this.picker.toggle()
  }
}
