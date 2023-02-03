$(document).ready(function() {
    var $select1 = $('#select1'),
        $select2 = $('#select2'),
        $options = $select2.find('option');
    $select1.on('change', function() {

        $select2.html($options.filter('[data-index-number="' + this.value + '|Activo"]'));
    }).trigger('change');
});


$(document).ready(function() {
    var $select1 = $('#select3'),
        $select2 = $('#select4'),
        $options = $select2.find('option');
    $select1.on('change', function() {

        $select2.html($options.filter('[data-index-number="' + this.value + '|Activo"]'));
    }).trigger('change');
});

$(document).ready(function() {
    var $select1 = $('#select5'),
        $select2 = $('#select6'),
        $options = $select2.find('option');
    $select1.on('change', function() {

        $select2.html($options.filter('[data-index-number="' + this.value + '|Activo"]'));
    }).trigger('change');
});

$(document).ready(function() {
    var $select1 = $('#select7'),
        $select2 = $('#select8'),
        $options = $select2.find('option');
    $select1.on('change', function() {

        $select2.html($options.filter('[data-index-number="' + this.value + '|Activo"]'));
    }).trigger('change');
});