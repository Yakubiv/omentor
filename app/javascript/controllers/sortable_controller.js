// import { Controller } from "stimulus"
// import Sortable from 'sortablejs/modular/sortable.core.esm.js';
// import Rails from '@rails/ujs'

// export default class extends Controller {
//   connect() {
//     this.initializeSortable()
//   }

//   disconnect() {
//     this.sortable.destroy()
//   }

//   initializeSortable() {
//     const sortableList = this

//     this.sortable = Sortable.create(this.element, {
//       handle: ".js-drag-handle",
//       animation: 100,
// 	    easing: "cubic-bezier(1, 0, 0, 1)",
//       ghostClass: sortableList.data.get("ghostClass"),
//       dragClass: sortableList.data.get("dragClass"),

//       onSort: function(e) {
//         if (sortableList.data.get("url")) {
//           Rails.ajax({
//             url: sortableList.data.get("url"),
//             type: "PUT",
//             data: new URLSearchParams({ task_ids: this.toArray() }).toString()
//           })
//         } else {
//           document.getElementById(sortableList.data.get("target")).value = this.toArray()
//         }
//       }
//     });
//   }
// }