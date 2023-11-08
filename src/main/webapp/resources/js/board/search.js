let currentPage = 1;
const board = $(".board");

window.addEventListener('scroll', function () {
    let scrollPosition = window.scrollY || document.documentElement.scrollTop;

    let pageTriggerHeight = document.documentElement.scrollHeight - 20;

    let viewportHeight = window.innerHeight;

    if (scrollPosition + viewportHeight >= pageTriggerHeight) {
        currentPage++;
        $.ajax({
            url: "/search?val=" + searchValue + "&cp=" + currentPage, 
            type: "POST", 
            success: function (data) {
                
                const resqString = JSON.stringify(data);
                const resqData = JSON.parse(resqString);
                console.log(resqData);
                resqData.forEach((item) => {

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
                                }).append(
                                    $("<div>",{
                                        "class" : "d-flex justify-content-between"
                                    }).append(
                                    $("<span>", {
                                        "class": "card-text",
                                        "html": "<b>" + item.goodsPrice + "</b>원"
                                    }),
                                    $("<span>", {
                                        "class": "badge text-bg-primary",
                                        "text": "판매중"
                                    })
                                )
                            )
                        )
                    ))

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
                console.error("데이터 불러오기 실패: " + error);
            }
        });
    }
});
