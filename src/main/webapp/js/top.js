


function login(){
	let id=document.getElementById("mid");
	let pass=document.getElementById("mpass");
	if(id.value==""){
		alert("아이디를 입력해주세요.");
		return false;
	}
	else if(pass.value==""){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	else{
	frm_top_login.method="post";
	frm_top_login.action="./login.do";
	return true;
	}
}
function logout(){
	let id=localStorage.getItem("mid");
let pass=localStorage.getItem("mpass");
let ck=localStorage.getItem("autologin");
if(id!=null&&pass!=null&&ck!=null){
	localStorage.removeItem("mid");
	localStorage.removeItem("mpass");
	localStorage.removeItem("autologin");
}
	location.href="./logout.jsp";

}


function gopage(z){
	if(z==1){
		location.href="./index.jsp";
	}
}