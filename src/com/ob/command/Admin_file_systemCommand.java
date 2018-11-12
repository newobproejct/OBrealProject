package com.ob.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ob.command.Command;
import com.ob.dao.DAO;
import com.ob.vo.BoardplusVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Admin_file_systemCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {


		// Multipart 사용되었으므로 MultipartRequest 사용처리
		// 파일의 저장할 위치값 확인
	//	String path = request.getServletContext().getRealPath("/imgs");
	//	String path = request.getSession().getServletContext().getRealPath("/imgs");  
	//	String path = request.getSession().getServletContext().getRealPath("C:/Users/hb5016/git/newobproject/WebContent/imgs");
		String path = "C:/Users/hb5016/git/newobproject/WebContent/imgs";
		MultipartRequest mr = null;
		try {

			mr = new MultipartRequest(request, path, (10 * 1024 * 1024), "UTF-8", new DefaultFileRenamePolicy());

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		BoardplusVO bvo = new BoardplusVO();
		bvo.setBoard_id(mr.getParameter("board_id"));

		// 첨부파일 처리
		if (mr.getFile("filename") != null) {
			bvo.setFilename(mr.getFilesystemName("filename"));
			bvo.setSaved_filename(mr.getOriginalFileName("filename"));
		} else {
			bvo.setFilename(""); // 실제 저장시 사용된 파일명
			bvo.setSaved_filename(""); // 원본 파일명
		}

		// DB에 저장하기
		int result = DAO.insert(bvo);

		if (result >= 1) {
			System.out.println("정상 처리 되었습니다.");
		}

		return "main.jsp";
	}

}
