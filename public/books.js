var uri = window.location.search.substring(1);
var params = new URLSearchParams(uri);
var format = params.get('format') || 'xml';
function fetchCategories(callback) {
