let currentPage = 0;
const board = $(".board");

window.addEventListener('scroll', function () {
    let scrollPosition = window.scrollY || document.documentElement.scrollTop;

    let pageTriggerHeight = document.documentElement.scrollHeight - 80;

    let viewportHeight = window.innerHeight;

    if (scrollPosition + viewportHeight >= pageTriggerHeight) {
        currentPage++;
        $.ajax({
            url: "/category/" + categoryNo + "/?cp=" + currentPage, // 데이터를 가져올 URL
            type: "POST", // HTTP 요청 메서드 (GET, POST 등)

            success: function (data) {
                const resqString = JSON.stringify(data);
                const resqData = JSON.parse(resqString)
                resqData.goodsList.forEach((item) => {

                    const divElement = $("<div>", {
                        "class": "col"
                    });

                    divElement.append(
                        $("<div>", { "class": "card" }).append(
                            $("<img>", {
                                "class": "card-img-top",
                                "style": "width: 100%;",
                                "src": "/resources/images/board/dummy3.png"
                            }),
                            $("<div>", { "class": "card-body" }).append(
                                $("<p>", {
                                    "class": "card-text mb-1 text-truncate",
                                    "text": item.goodsTitle
                                }),
                                $("<span>", {
                                    "class": "card-text",
                                    "html": "<b>" + item.goodsPrice + "</b>원"
                                })
                            )
                        )
                    );

                    board.append(
                        $("<a>", {
                            "class": "link-underline link-underline-opacity-0",
                            "href": "/detail/" + item.goodsNo
                        }).append(divElement)
                    );

                })
                if (resqData.length < 20) {
                    $(".spinner-border").remove();
                }

            },

            error: function (xhr, status, error) {
                // AJAX 요청이 실패했을 때 실행되는 콜백 함수
                console.error("데이터 불러오기 실패: " + error);
            }
        });
    }
});
