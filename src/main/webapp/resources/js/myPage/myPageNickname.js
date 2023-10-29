const changeNickname = document.getElementById("changeNickname");
const changeNicknameMessage = document.getElementById('ChangeNickMessage');
const OriginNicknameValue = changeNickname.value;
const nicknameFrm = document.getElementById("nicknameFrm")
let changePass = false;

changeNickname.addEventListener("input", () => {

    if (changeNickname.value == OriginNicknameValue) {
        changeNicknameMessage.innerText = "한글,영어,숫자로만 2~10글자";
        changeNicknameMessage.classList.remove("confirm", "error");
        changePass = false;
        return;
    }
    const regEx = /^[가-힣\w\d]{2,10}$/;
    if (regEx.test(changeNickname.value)) {
        fetch("/check/nickname?nickname=" + changeNickname.value)
            .then(resp => resp.text())
            .then(count => {
                if (count == 0) {
                    changeNicknameMessage.innerText = "사용 가능한 닉네임 입니다";
                    changeNicknameMessage.classList.add("confirm");
                    changeNicknameMessage.classList.remove("error");
                    changePass = true;
                } else {
                    changeNicknameMessage.innerText = "이미 사용중인 닉네임 입니다";
                    changeNicknameMessage.classList.add("error");
                    changeNicknameMessage.classList.remove("confirm");
                    changePass = false;
                }
            })
            .catch(err => console.log(err));
    } else {
        changeNicknameMessage.innerText = "닉네임 형식이 유효하지 않습니다";
        changeNicknameMessage.classList.add("error");
        changeNicknameMessage.classList.remove("confirm");
        changePass = false;
    }

});

nicknameFrm.addEventListener("submit", e => {
    if (!changePass) {
        e.preventDefault();
        alert("유효한 변경이 아닙니다.");
    }
})

