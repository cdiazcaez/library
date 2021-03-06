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

function fetchBooks(category, callback) {

    var xhr = new XMLHttpRequest();
    var query = new URLSearchParams({
        format: format,
        type: 'filter',
        category: category
    }).toString()

    xhr.open('GET', 'booklist.php?' + query)

    xhr.onload = function () {
        if (xhr.status === 200) {
            return callback(
                    parse(xhr, format, 'book')
                    );
        }
        console.log('Request failed: ' + xhr.status);
    };

    xhr.send();

}

function parse(xhr, format, tagName) {

    if (format === 'json')
        return JSON.parse(xhr.responseText);

    var items = xhr.responseXML.getElementsByTagName(tagName);
    var result = [];
    for (i = 0; i < items.length; i++) {
        var item = {};
        items[i].childNodes.forEach(function (tag) {
            console.log(tag.tagName);
            item[tag.tagName] = tag.textContent;
        })
        result.push(item);
    }

    return result;
}

fetchCategories(function (data) {

    var html = '';
    data.forEach(item => {
        
	console.log(item);
        var categoryHTML = '<label>';
        categoryHTML += '<input type="radio" name="category" value="' + item.name + '"/>'
        categoryHTML += item.name + '</label>';

        html += categoryHTML;
    })

    document.getElementById('categories').innerHTML = html;

})

document.getElementById('filter').addEventListener('click', function () {
    var category = document.querySelector('input:checked');
    fetchBooks(category.value, function (data) {

        var html = '<h3>Books in category "' + category.value + '"</h3><ul>';
        data.forEach(item => {
            console.log(item);
            var text = item.title + ', by ' + item.author + ' (' + item.year + ')';

            html += '<li>' + text + '</li>';
        })
        html += '</ul>';
        document.getElementById('books').innerHTML = html;


    })

})
