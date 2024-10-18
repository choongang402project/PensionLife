$(function(){
	//1:1문의 select 부분
	$(".qa_part > li").click(function(){
		$n = $(this).index();
		$(".qa_part > li").attr("class","");
		$(".qa_part > li").eq($n).attr("class","onselect");
	});
	
	//햄버거 버튼 부분
	$("#menu_slide").click(function(){
		$("#menus_bar").fadeToggle();
	});
});


//로그인 팝업
function login_pop(){
	autologin()
	var pop = document.getElementById("popup");


		if(pop.style.display=="none"){
		pop.style.display = "flex";
		
	}
	else{
		pop.style.display = "none";
	}
}
//로그인 팝업 닫기
function pop_close(){
	var pop = document.getElementById("popup");
	pop.style.display = "none";
	
}

//페이지 이동
function page_location(n){
	if(n!=3){
	var url = "";
	if(n==1){
		url = "./m_idsearch.jsp";
	}
	else if(n==2){
		url = "./m_join.jsp";
	}
	location.href = url;
	}
	else {
		let ok1=document.getElementById("ok1");
		let ok2=document.getElementById("ok2");
		let ok3=document.getElementById("ok3");
		let ok4=document.getElementById("ok4");
	if(ok1.checked==false){
		alert("이용약관의 동의는 필수입니다.");
	}
	else if(ok2.checked==false){
		alert("개인정보수집 동의는 필수입니다.");	
	}
	else if(ok3.checked==false){
		alert("개인정보 제3자 제공 동의는 필수입니다.");	
	}
	else if(ok4.checked==false){
		alert("개인정보 위탁제공 동의는 필수입니다.");	
	}
	else{	
	frm2.method= "POST";
	frm2.action= "./m_join.do";
	frm2.submit();
	}
	}
}
function ok_all(){
	let w=1;
	let ok6=document.getElementById("ok6");
	while(w<6){

		document.getElementById("ok"+w).checked=ok6.checked;
		w++;
	}
}
function ok_one(z){
	let count=0;
	const ok6=document.getElementById("ok6");
	let w=1;
	while(w<6){
		if(count!=5){
			ok6.checked=false;
		}
		if(document.getElementById("ok"+w).checked==true){
			count++;
		}
		if(count==5){
			ok6.checked=true;
		}
		w++;
	}	
}
function autologin(){
var ck=localStorage.getItem("autologin");
var id=localStorage.getItem("mid");
var pass=localStorage.getItem("mpass");
console.log(id);
if(id!=null&&pass!=null&&ck!=null){
	boolean="";
	frm_top_login.mid.value=id;
	var sp=pass.split("/");
	if(sp[1]=="auto"){
		frm_top_login.mpass.value=sp[0];
		frm_top_login.auto_login.checked=true;
		frm_top_login.method="post";
		frm_top_login.action="./login.do";
		frm_top_login.submit();
	}
}
}