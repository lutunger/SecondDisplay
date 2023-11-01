const categoryNo = $("#categoryNo").val();
const category1Val = categoryNo.charAt(0);
const category2Val = categoryNo.slice(1);

$("#category1").val(category1Val)
$("#category2").val(category2Val)

$("#category1").on("input", function() {
    const category1Val = $('#category1').val()
    const category2Val = $('#category2').val()
    const categoryNo = category1Val + category2Val
    $("#categoryNo").val(categoryNo)
});

$("#category2").on("input", function() {
    const category1Val = $('#category1').val()
    const category2Val = $('#category2').val()
    const categoryNo = category1Val + category2Val
    $("#categoryNo").val(categoryNo)
});