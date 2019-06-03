# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(() ->
  $('#main-table').DataTable({
    serverSide: true,
    processing: true,
    ajax: {
      url: '/api/load_users',
      dataSrc: 'users'
    }
    columns: [
      { data: 'first_name' },
      { data: 'last_name' },
      { data: 'birthday' },
      { data: 'address' }
    ]
  })
)