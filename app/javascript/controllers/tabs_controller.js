import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['tab', 'panel']

  connect() {
    this.activeTabClasses = (this.data.get('activeClass') || 'active').split(' ')
    this.inactiveTabClasses = (this.data.get('inactiveClass') || 'inactive').split(' ')

    this.enableTab()
  }

  enableTab() {
    this.tabTargets.forEach((tab, index) => {      
      const toggle = tab.dataset.toggle
      const panel = this.panelTargets[index]

      if (toggle === this.currentTab) {
        panel.classList.remove('hidden')
        tab.classList.remove(...this.inactiveTabClasses)
        tab.classList.add(...this.activeTabClasses)
        if (panel.dataset.remoteUrl && !panel.dataset.loaded) {
          fetch(panel.dataset.remoteUrl, {})
            .then(response => response.text())
            .then(html => {
              panel.innerHTML = html;
              panel.dataset.loaded = true
            }
          )
        }
      } else {
        panel.classList.add('hidden')
        tab.classList.remove(...this.activeTabClasses)
        tab.classList.add(...this.inactiveTabClasses)
      }
    })
  }

  switch(event) {
    this.currentTab = event.currentTarget.dataset.toggle
  }

  get currentTab() {
    return this.data.get('current')
  }

  set currentTab(value) {
    this.data.set('current', value)
    this.enableTab()
  }
}