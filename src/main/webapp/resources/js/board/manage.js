const pageCount = Math.ceil(goodsListCount / 10);
const paginationElement = $('.pagination');

const currentPage = new URLSearchParams(window.location.search).get('cp');

for (let i = 1; i <= pageCount; i++) {
    const li = $('<li>').addClass('page-item');
    const a = $('<a>').addClass('page-link').attr('href', '/manage?cp='+ i ).text(i).attr('data-cp', i);

    if (parseInt(currentPage) === i) {
        a.addClass('active');
    }

    li.append(a);
    paginationElement.append(li);
}

$('.delete').on("click", (e) => {
    const target = e.target.dataset.target
    if(confirm("정말 삭제하시겠습니까?")){
        location.replace('/delete/' + target);
    }
})

