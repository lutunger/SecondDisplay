
$("#category2").on("input", function() {
    const category1Val = $('#category1').val()
    const category2Val = $('#category2').val()
    const categoryNo = category1Val + category2Val
    $("#categoryNo").val(categoryNo)
});

const preview = document.getElementsByClassName("preview"); 

const inputImage = document.getElementsByClassName("inputImage"); 

const deleteImage = document.getElementsByClassName("delete-image"); 

const addIcon = document.getElementsByClassName("img-plus");

for(let i = 0 ; i < inputImage.length ; i ++){

    inputImage[i].addEventListener('change', e => {

        const file = e.target.files[0]; 

        if(file != undefined) { 
            
            const reader = new FileReader(); 

            reader.readAsDataURL(file);
        

            reader.onload = e => { 
                preview[i].setAttribute("src", e.target.result);
            }

            addIcon[i].classList.toggle("d-none");
            
        } else { 
            preview[i].removeAttribute("src");  
            
            addIcon[i].classList.toggle("d-none");
        }
        
    });
    
    deleteImage[i].addEventListener('click', () => {
        
        if(preview[i].getAttribute("src") != ""){
            
            preview[i].removeAttribute("src");
            
            inputImage[i].value = ""; 
            
            addIcon[i].classList.toggle("d-none");
        }

    });

}