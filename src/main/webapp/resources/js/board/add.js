
$("#category2").on("input", function() {
    const category1Val = $('#category1').val()
    const category2Val = $('#category2').val()
    const categoryNo = category1Val + category2Val
    $("#categoryNo").val(categoryNo)
});