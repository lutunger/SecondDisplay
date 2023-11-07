
let chatRoomNo;
let targetUserNo;

const chatRoom = document.getElementsByClassName("chatRoom")

for (const item of chatRoom) {
    item.addEventListener("click", (e) => {

        for (const room of chatRoom) {
            room.classList.remove("active");
        }

        item.classList.add("active");



        const messageList = document.getElementById("messageList");
		messageList.innerHTML = "";

        const listItem = e.target.closest('li[data-roomNo][data-goodsNo][data-thumbnail][data-title][data-price][data-user1No][data-user2No]');
        
        const user1No = listItem.getAttribute('data-user1No');
        const user2No = listItem.getAttribute('data-user2No');

        if(user1No == loginUserNo) targetUserNo = user2No;
        else targetUserNo = user1No;

        const roomNo = listItem.getAttribute('data-roomNo');

        chatRoomNo = roomNo;

        const goodsNo = listItem.getAttribute('data-goodsNo');
        const thumbnail = listItem.getAttribute('data-thumbnail');
        const title = listItem.getAttribute('data-title');
        const price = listItem.getAttribute('data-price');
        
        // console.log('방 번호:', roomNo);
        // console.log('상품 번호:', goodsNo);
        // console.log('썸네일:', thumbnail);
        // console.log('상품 제목:', title);
        // console.log('가격:', price);

        const card = $('<div>').addClass('card mb-5');
        const cardBody = $('<div>').addClass('card-body, d-flex align-items-center ps-3');
		
        const h100 = $('<div>').addClass('h-100');
        const img = $('<img>').attr('src', thumbnail).css({'width': '50px', 'height': '50px'});
		
        const ms3 = $('<div>').addClass('ms-3 w-50 me-5');
        const fs4 = $('<div>').addClass('fs-5 text-truncate').text(title);
        const fs6 = $('<div>').addClass('fs-6').text(price + '원');
		
        const detailLink = $('<a>').attr('href', 'detail/' + goodsNo).addClass('btn btn-primary me-2');
		const icon = $('<i>').addClass('fa-solid fa-shoe-prints');

		detailLink.append(icon);

		cardBody.append(h100);
        h100.append(img);

        cardBody.append(ms3);
        ms3.append(fs4);
        ms3.append(fs6);

        cardBody.append(detailLink);

        card.append(cardBody);

		
        const dFlexRowReverse = $('<div>').addClass('d-flex flex-row-reverse mb-3');
        const border1 = $('<div>').addClass('border rounded-3 p-2').css('max-width', '50%').text('ㅁㅁㅁㅁ');

        const dFlex = $('<div>').addClass('d-flex mb-3');
        const border2 = $('<div>').addClass('border rounded-3 p-2').css('max-width', '50%').text('ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇ');

        messageList.appendChild(card[0]);
        card.append(cardBody);

        messageList.appendChild(dFlexRowReverse[0]);
        dFlexRowReverse.append(border1);

        messageList.appendChild(dFlex[0]);
        dFlex.append(border2);
    });
}

if(enterRoomNo != ""){
    $(`[data-roomno="${enterRoomNo}"]`).click();
}




let chattingSock;

if(loginUserNo != ""){
	chattingSock = new SockJS("/chattingSock");
}


const send = document.getElementById("send");

const sendMessage = () => {
	const inputChatting = document.getElementById("inputChatting");

	if (inputChatting.value.trim().length == 0) {
		alert("채팅을 입력해주세요.");
		inputChatting.value = "";
	} else {
		var obj = {
			"senderUserNo": loginUserNo,
			"receiverUserNo": targetUserNo,
			"chatRoomNo": chatRoomNo,
			"message": inputChatting.value,
		};
		console.log(obj)

		// JSON.stringify() : 자바스크립트 객체를 JSON 문자열로 변환
		chattingSock.send(JSON.stringify(obj));

		inputChatting.value = "";
	}
}

inputChatting.addEventListener("keyup", e => {
	if(e.key == "Enter"){ 
		if (!e.shiftKey) {
			sendMessage();
		}
	}
})
