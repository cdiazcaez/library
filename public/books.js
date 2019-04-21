var uri = window.location.search.substring(1);
var params = new URLSearchParams(uri);
var format = params.get('format') || 'xml';
function fetchCategories(callback) {

//  Set up our HTTP request	
    var xhr = new XMLHttpRequest();
    var query = new URLSearchParams({
        format: format,
        type: 'categories',
    }).toString();

    xhr.open('GET', 'booklist.php?' + query)
// Setup our listener to process completed requests
    xhr.onload = function () {
        // Process our return data
        if (xhr.status === 200) {
            // Runs when the request is successful
            return callback(
                    parse(xhr, format, 'category')
                    );
        }
        // Runs when it's not
        console.log('Request failed: ' + xhr.status);
    };

    xhr.send();

}