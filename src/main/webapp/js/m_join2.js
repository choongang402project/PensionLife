var sec= document.getElementById("securitycode");
var result="";
var w=0;
while(w<6){
	let a=Math.ceil(Math.random()*9);
	result+=a;
	w++;
}
sec.value = result;
	
function signup(){
	const nmck=/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\s]/;
	const idck=/^[A-Za-z0-9]{5,17}/;
	const psck=/^[A-Za-z0-9]{5,13}/;
	const hpck=/^[0-9]/;
	const spaceck="";
	if(spaceck.match(frm2.mid.value,spaceck)){
		alert("아이디를 입력해주세요");
	}
	else if(spaceck.match(frm2.mname.value,spaceck)){
		alert("이름을 입력해주세요");
	}
	else if(spaceck.match(frm2.mpass.value,spaceck)){
		alert("비밀번호를 입력해주세요");
	}
	else if(frm2.mpassok.value!=frm2.mpass.value){
		alert("비밀번호가 일치하지 않습니다.");
	}
	else if(spaceck.match(frm2.memail.value,spaceck)){
		alert("이메일을 입력해주세요.");
	}
	else if(spaceck.match(frm2.mhp.value,spaceck)){
		alert("휴대전화 번호를 입력해주세요.");
	}
	else if(frm2.securitycode.value!=frm2.sec2.value){
		alert("보안코드가 일치하지 않습니다.");
	}
	else if(!idck.test(frm2.mid.value)){
		alert("아이디는 영문숫자6~16자리만 가능합니다.");	
	}
	else if(!nmck.test(frm2.mname.value)){
		alert("이름은 영문/한글만 입력 가능합니다.");
	}
	else if(!psck.test(frm2.mpass.value)){
		alert("패스워드는 영문/숫자 6~12자리만 입력가능합니다.");
	}
	else if(!/@/.test(frm2.memail.value)){
		alert("이메일을 정확히 입력해주세요.");
	}
	else if(!hpck.test(frm2.mhp.value) || frm2.mhp.value.length!=11){
		alert("연락처는 숫자만 입력해주세요.");
	}
	
	else{
	const f = document.getElementById("frm2");
	f.method="post";
	f.action="./m_index.do";
	f.submit();
	}
}



let duplicate_idck="";
console.log("test1");
function duplicate_id_ck(){
	const duplicate_check=document.getElementById("duplicate_check");
		var http,result;
	http=new XMLHttpRequest();
	http.onreadystatechange=function(){
		if(http.readyState==4&&http.status==200){
		duplicate_idck=this.response;	
		setTimeout(Duplicate,2000);
		}
	}
	http.open("post","./duplicate_check.do",true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded");
	http.send("mid="+duplicate_check);
}
	

function Duplicate(){
	    const d_id = document.querySelector(".duplicate_id");
		const id_d=document.getElementById("ck_idduplicate");
    if (d_id) {
        if (duplicate_idck == "사용중인 아이디입니다.") {
            id_d.style.display = 'block';
            id_d.innerHTML =duplicate_idck; 
        }   	
		else if (duplicate_idck == "사용 가능한 아이디입니다.") {
            id_d.style.display = 'block';
            id_d.innerHTML =duplicate_idck; 
        }  
}
}