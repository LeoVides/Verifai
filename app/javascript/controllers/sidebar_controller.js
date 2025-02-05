import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menuItem"];

  connect() {
    this.setActiveItem();
  }

  setActive(event) {
    // Remove 'active' class from all items
    this.menuItemTargets.forEach(item => item.classList.remove("active"));

    // Add 'active' class to the clicked item
    event.currentTarget.classList.add("active");

    // Store the selected item in localStorage
    localStorage.setItem("activeSidebarItem", event.currentTarget.dataset.path);
  }

  setActiveItem() {
    const activePath = localStorage.getItem("activeSidebarItem");

    if (activePath) {
      const activeItem = this.menuItemTargets.find(
        item => item.dataset.path === activePath
      );

      if (activeItem) {
        activeItem.classList.add("active");
      }
    }
  }
}
