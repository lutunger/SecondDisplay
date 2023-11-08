
let chatRoomNo;
let targetUserNo;

const chatDisplay = document.getElementById("messageList");

const chatRoom = document.getElementsByClassName("chatRoom")

const selectMessageList = () => {

    $.ajax({
        url: "/chat/selectMessage?" + 'chatRoomNo=' + chatRoomNo,
        dataType : "JSON",
        success : messageList => {     
            console.log(messageList)

            const messageListDisplay = document.getElementById("messageList");

            for(const item of messageList){
                
                if(item.senderUserNo == loginUserNo){
                    const senderTextWrapper = $('<div>').addClass('d-flex flex-row-reverse mb-3');
                    const senderTextBox = $('<div>').addClass('border rounded-3 p-2').css('max-width', '50%').text(item.message);
            
                    messageListDisplay.appendChild(senderTextWrapper[0]);
                    senderTextWrapper.append(senderTextBox);
                    
                }else{
                    const receiverTextWrapper = $('<div>').addClass('d-flex mb-3');
                    const receiverTextBox = $('<div>').addClass('border rounded-3 p-2').css('max-width', '50%').text(item.message);
            
                    messageListDisplay.appendChild(receiverTextWrapper[0]);
                    receiverTextWrapper.append(receiverTextBox);
                }

            }

            messageListDisplay.scrollTop = messageListDisplay.scrollHeight;
        }
    })

}

const addRoomAction = () => {
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
            
            messageList.appendChild(card[0]);
            card.append(cardBody);

            selectMessageList()

        });
    }
}

addRoomAction();


if(enterRoomNo != ""){
    $(`[data-roomno="${enterRoomNo}"]`).click();
}


function selectRoomList() {

    $.ajax({
        url: "/chat/roomList",
        data : {"userNo" : loginUserNo},
        dataType : "JSON",
        success : roomList => {

            const listGroup = $(".list-group");

            listGroup.html('');

            for(let room of roomList){

                console.log(room)
                var li = $("<li>").addClass("chatRoom list-group-item d-flex align-items-center")
                .css("cursor", "pointer")
                .attr("data-user1No", room.user1No)
                .attr("data-user2No", room.user2No)
                .attr("data-roomNo", room.chatRoomNo)
                .attr("data-goodsNo", room.goodsNo)
                .attr("data-thumbnail", room.thumbNail)
                .attr("data-title", room.goodsTitle)
                .attr("data-price", room.goodsPrice);

                var imgDiv = $("<div>").addClass("h-100");
                var img = $("<img>").attr("src", room.thumbNail)
                    .css({ "width": "48px", "height": "48px" });
                imgDiv.append(img);

                var textDiv = $("<div>").addClass("ms-3");
                var fs4 = $("<div>").addClass("fs-4 text-truncate");
                var fs6 = $("<div>").addClass("fs-6 text-truncate");

                if (loginUserNo == room.user1No) {
                    fs4.text(room.user2Nickname + "님");
                } else {
                    fs4.text(room.user1Nickname + "님");
                }
                fs6.text(room.goodsTitle + " 상품");

                textDiv.append(fs4, fs6);

                li.append(imgDiv, textDiv);

                listGroup.append(li);

            }

            addRoomAction();

            $(`.list-group-item[data-roomNo=${chatRoomNo}]`).addClass("active");

        }
    })

}





// sockjs 설정

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

send.addEventListener("click", () => {
    sendMessage();
})

chattingSock.onmessage = function(e) {
	const msg = JSON.parse(e.data);
	console.log(msg);

    const messageListDisplay = document.getElementById("messageList");

	if(chatRoomNo == msg.chatRoomNo){

        if(msg.senderUserNo == loginUserNo){
            const senderTextWrapper = $('<div>').addClass('d-flex flex-row-reverse mb-3');
            const senderTextBox = $('<div>').addClass('border rounded-3 p-2').css('max-width', '50%').text(msg.message);
    
            messageListDisplay.appendChild(senderTextWrapper[0]);
            senderTextWrapper.append(senderTextBox);
            
        }else{
            const receiverTextWrapper = $('<div>').addClass('d-flex mb-3');
            const receiverTextBox = $('<div>').addClass('border rounded-3 p-2').css('max-width', '50%').text(msg.message);
    
            messageListDisplay.appendChild(receiverTextWrapper[0]);
            receiverTextWrapper.append(receiverTextBox);
        }

		messageListDisplay.scrollTop = messageListDisplay.scrollHeight; // 스크롤 제일 밑으로
	}

	selectRoomList();
    
}