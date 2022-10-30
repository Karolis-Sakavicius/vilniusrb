// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "bootstrap"
import "@popperjs/core"
import "controllers"

(function () {
  'use strict'

  document.querySelector('#navbarSideCollapse').addEventListener('click', function () {
    document.querySelector('.offcanvas-collapse').classList.toggle('open')
  })
})()
