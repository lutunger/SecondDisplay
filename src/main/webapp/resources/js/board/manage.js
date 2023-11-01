const pageCount = Math.ceil(goodsListCount / 10);
const paginationElement = $('.pagination');

for (let i = 1; i <= pageCount; i++) {
    let li = $('<li>').addClass('page-item');
    let a = $('<a>').addClass('page-link').attr('href', '/manage?cp='+ i ).text(i);
    li.append(a);
    paginationElement.append(li);
}



