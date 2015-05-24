var readySort = function(){
    $('table').DataTable();
}
$(document).ready(readySort);
$(document).on('page:load', readySort);