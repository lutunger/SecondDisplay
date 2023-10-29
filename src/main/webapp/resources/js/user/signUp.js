const checkObj = {
    "userId": false,
    "userPw": false,
    "userPwConfirm": false,
    "nickname": false,
};

const userId = document.getElementById("signUpId");
const userIdMessage = document.getElementById("idMessage");
userId.addEventListener("input", () => {

    if (userId.value.trim().length == 0) {
        userId.value = "";
        userIdMessage.innerText = "영문자 또는 숫자 4~20글자 아이디를 입력해주세요";
        userIdMessage.classList.remove("confirm", "error");
        checkObj.userId = false;
        return
    }
    const regEx = /^[a-zA-Z0-9]{4,20}$/;

    if (regEx.test(userId.value)) {
        fetch('/check/id?id=' + userId.value)
            .then(response => response.text())
            .then(count => {
                if (count == 0) {
                    userIdMessage.innerText = "사용 가능한 아이디 입니다";
                    userIdMessage.classList.add("confirm");
                    userIdMessage.classList.remove("error");
                    checkObj.userId = true;
                } else {
                    userIdMessage.innerText = "이미 사용중인 아이디 입니다";
                    userIdMessage.classList.add("error");
                    userIdMessage.classList.remove("confirm");
                    checkObj.userId = false;
                }
            }
            )
    } else {
        userIdMessage.innerText = "아이디 형식이 유효하지 않습니다"
        userIdMessage.classList.add("error");
        userIdMessage.classList.remove("confirm");
        checkObj.userId = false;
    }
})



const userPw = document.getElementById("signUpPw");
const userPwConfirm = document.getElementById("signUpPwConfirm");
const pwMessage = document.getElementById("pwMessage");

userPw.addEventListener("input", () => {
    if (userPw.value.trim().length == 0) {
        userPw.value = "";
        pwMessage.innerText = "영어,숫자,특수문자(!,@,#,-,_) 4~20글자 사이로 입력해주세요.";
        pwMessage.classList.remove("confirm", "error"); 
        checkObj.userPw = false;  
        return;
    }

    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{4,20}$/;
    if (regEx.test(userPw.value)) {
        checkObj.userPw = true;
        if (userPwConfirm.value.trim().length == 0) {
            pwMessage.innerText = "유효한 비밀번호 형식입니다."
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
        } else {
            if (userPw.value == userPwConfirm.value) {
                pwMessage.innerText = "비밀번호가 일치합니다";
                pwMessage.classList.add("confirm");
                pwMessage.classList.remove("error");
                checkObj.userPwConfirm = true;
            } else { 
                pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
                pwMessage.classList.add("error");
                pwMessage.classList.remove("confirm");
                checkObj.userPwConfirm = false;
            }
        }
    } else { 
        pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다"
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        checkObj.userPw = false;
    }
});

userPwConfirm.addEventListener('input', () => {
    if(checkObj.userPw){ 
        if(userPw.value == userPwConfirm.value) {
            pwMessage.innerText = "비밀번호가 일치합니다";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
            checkObj.userPwConfirm = true;
        } else { 
            pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
            pwMessage.classList.add("error");
            pwMessage.classList.remove("confirm");
            checkObj.userPwConfirm = false;
        }
    } else{ 
        checkObj.userPwConfirm = false;
    }
});

const userNickname = document.getElementById("signUpNickname");
const nickMessage = document.getElementById('nickMessage');

userNickname.addEventListener("input", () => {
    if(userNickname.value.trim() == ""){
        nickMessage.innerText = "한글,영어,숫자로만 2~10글자";
        nickMessage.classList.remove("confirm", "error");
        checkObj.nickname = false;
        userNickname.value="";    
        return;
    }
    const regEx = /^[가-힣\w\d]{2,10}$/;
    if(regEx.test(userNickname.value)){ 
        fetch("/check/nickname?nickname="+userNickname.value)
        .then(resp => resp.text())  
        .then(count => {
            if(count == 0){ 
                nickMessage.innerText = "사용 가능한 닉네임 입니다";
                nickMessage.classList.add("confirm");
                nickMessage.classList.remove("error");
                checkObj.nickname = true;
            }else{ 
                nickMessage.innerText = "이미 사용중인 닉네임 입니다";
                nickMessage.classList.add("error");
                nickMessage.classList.remove("confirm");
                checkObj.nickname = false;
            }
        })
        .catch(err => console.log(err));
    } else{ 
        nickMessage.innerText = "닉네임 형식이 유효하지 않습니다";
        nickMessage.classList.add("error");
        nickMessage.classList.remove("confirm");
        checkObj.nickname = false;
    }
});

document.getElementById("signUpFrm").addEventListener("submit", e => {
    for(let key in checkObj){
        if(!checkObj[key]){
            switch(key){
            case "userId" : 
                alert("아이디가 유효하지 않습니다"); break;
            case "userPw" :
                alert("비밀번호가 유효하지 않습니다"); break;
            case "userPwConfirm" :
                alert("비밀번호가 확인되지 않았습니다."); break;
            case "userNickname" :
                alert("닉네임이 유효하지 않습니다."); break;
            }
            document.getElementById(key).focus;
            e.preventDefault();
            return; 
        }
    }
});