const changePw = document.getElementById("changePw");
const changePwConfirm = document.getElementById("changePwConfirm");
const changePwMessage = document.getElementById("changePwMessage");
let confirmPass = false;
let changePass = false;
const passwordFrm = document.getElementById("passwordFrm")

changePw.addEventListener("input", () => {
    if (changePw.value.trim().length == 0) {
        changePw.value = "";
        changePwMessage.innerText = "영어,숫자,특수문자(!,@,#,-,_) 4~20글자 사이로 입력해주세요.";
        changePwMessage.classList.remove("confirm", "error"); 
        changePass = false;  
        return;
    }

    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{4,20}$/;
    if (regEx.test(changePw.value)) {
        changePass = true;
        if (changePwConfirm.value.trim().length == 0) {
            changePwMessage.innerText = "유효한 비밀번호 형식입니다."
            changePwMessage.classList.add("confirm");
            changePwMessage.classList.remove("error");
        } else {
            if (changePw.value == changePwConfirm.value) {
                changePwMessage.innerText = "비밀번호가 일치합니다";
                changePwMessage.classList.add("confirm");
                changePwMessage.classList.remove("error");
                confirmPass = true;
            } else { 
                changePwMessage.innerText = "비밀번호가 일치하지 않습니다.";
                changePwMessage.classList.add("error");
                changePwMessage.classList.remove("confirm");
                confirmPass = false;
            }
        }
    } else { 
        changePwMessage.innerText = "비밀번호 형식이 유효하지 않습니다"
        changePwMessage.classList.add("error");
        changePwMessage.classList.remove("confirm");
        changePass = false;
    }
});

changePwConfirm.addEventListener('input', () => {
    if(changePass){ 
        if(changePw.value == changePwConfirm.value) {
            changePwMessage.innerText = "비밀번호가 일치합니다";
            changePwMessage.classList.add("confirm");
            changePwMessage.classList.remove("error");
            confirmPass = true;
        } else { 
            changePwMessage.innerText = "비밀번호가 일치하지 않습니다.";
            changePwMessage.classList.add("error");
            changePwMessage.classList.remove("confirm");
            confirmPass = false;
        }
    } else{ 
        confirmPass = false;
    }
});

passwordFrm.addEventListener("submit", e => {
    if (!confirmPass || !changePass) {
        e.preventDefault();
        alert("변경할 비밀번호를 다시 확인해주세요");
        changePw.value = "";
        changePwConfirm.value = "";
        changePwMessage.innerText = "영어,숫자,특수문자(!,@,#,-,_) 4~20글자 사이로 입력해주세요.";
        changePwMessage.classList.remove("confirm", "error"); 
    }
})


document.getElementById("sidePassword").classList.add("active");

