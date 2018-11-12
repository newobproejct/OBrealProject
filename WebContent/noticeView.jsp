<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeView.jsp</title>
<style>
#bbs_view table {
    width:580px;
    margin-left:10px;
    border:1px solid black;
    border-collapse:collapse;
    font-size:14px;
}
#bbs_view table caption {
    font-size:20px;
    font-weight:bold;
    margin-bottom:10px;
}
#bbs_view table th {
    text-align:center;
    border:1px solid black;
    padding:4px 10px;
    width: 30%;
    background-color: lightsteelblue;
}
#bbs_view table td {
    text-align:left;
    border:1px solid black;
    padding:4px 10px;
}
</style>
<script>
      function modify_go() {
         frm.action = "controller?type=noticeModi&board_type=1&id=${BPVO.id}";
         frm.submit();
      }
      function delete_go() {
         var isDeleteOk = confirm("정말 삭제하시겠습니까?");
         
         if (isDeleteOk) {
            frm.action = "controller?type=noticeDel&board_type=1&id=${BPVO.id}";
            frm.submit();
         } else {
            alert("취소되었습니다.");
         }
      } 
      function list_go() {
         frm.action = "controller?type=notice&board_type=1";
         frm.submit();
      }
      
</script>
</head>
<body>
   <jsp:include page="header.jsp"></jsp:include>
   <header>
      <h2>공지사항</h2>
   </header>
   <section>
      <nav>
         <ul>
            <li id="li1">공지사항</li>
            <li><a href="controller?type=moreQue">자주 묻는 질문</a></li>
            <li><a href="controller?type=que&board_type=3">문의사항</a></li>
            <li><a href="controller?type=premium&board_type=4">프리미엄 후기</a></li>
            <li><a href="controller?type=agree">약관 및 동의사항</a></li>
         </ul>
      </nav>

      <article>
         <div id="bbs_view">
            <%-- 게시글 내용 표시 --%>
            <form method="post" name="frm">
               <table>
                  <caption>공지사항 상세보기</caption>
                  <tbody>
                     <tr>
                        <th>제목</th>
                        <td>${BPVO.title }</td>
                     </tr>
                     <tr>
                        <th>작성자</th>
                        <td><b>관리자(admin)</b></td>
                     </tr>
                     <tr>
                        <th>내용</th>
                        <td><pre>${BPVO.content}</pre></td>
                     </tr>
                     <tr>
                        <td colspan="2">
                        <input type="button" value="수  정" onclick="modify_go()"> 
                        <input type="button" value="삭  제" onclick="delete_go()"> 
                        <input type="button" value="목  록" onclick="list_go()"> 
                        
                        <input type="hidden" name="delete_chk" value="chk">
                        <input type="hidden" name="delete_id" value="${BPVO.id}">
                        </td>
                     </tr>
                  </tbody>
               </table>
            </form>
         </div>
      </article>
   </section>
   
   <footer>
      <jsp:include page="footer.jsp"></jsp:include>
   </footer>
</body>
</html>