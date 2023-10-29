const secessionPw = document.getElementById("secessionPw");
const secessionPwConfirm = document.getElementById("secessionPwConfirm");
const secessionPwMessage = document.getElementById("secessionPwMessage");
const secessionFrm = document.getElementById("secessionFrm");
let secessionPass = false;

secessionPw.addEventListener('input', () => {
    if (secessionPw.value.trim().length == 0) {
        secessionPw.value = "";
        secessionPwMessage.innerText = "비밀번호를 입력해주세요";
        secessionPwMessage.classList.remove("confirm", "error"); 
        secessionPass = false;
        return;
    }
})

secessionPwConfirm.addEventListener('input', () => {
    if (secessionPwConfirm.value.trim().length == 0) {
        secessionPwConfirm.value = "";
        secessionPwMessage.innerText = "비밀번호를 입력해주세요";
        secessionPwMessage.classList.remove("confirm", "error"); 
        secessionPass = false;
        return;
    }

    if (secessionPw.value == secessionPwConfirm.value) {
        secessionPwMessage.innerText = "비밀번호가 일치합니다";
        secessionPwMessage.classList.add("confirm");
        secessionPwMessage.classList.remove("error");
        secessionPass = true;
    } else {
        secessionPwMessage.innerText = "비밀번호가 일치하지 않습니다.";
        secessionPwMessage.classList.add("error");
        secessionPwMessage.classList.remove("confirm");
        secessionPass = false;
    }
});



secessionFrm.addEventListener("submit", (e) => {
    if (!secessionPass) {
        alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
        e.preventDefault();
        secessionPw.value = "";
        secessionPwConfirm.value = "";
        secessionPwMessage.innerText = "비밀번호를 입력해주세요";
        changePwMessage.classList.remove("confirm", "error");
    }
})


document.getElementById("sideSecession").classList.add("active");