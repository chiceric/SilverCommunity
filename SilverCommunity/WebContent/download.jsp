<%@page import="java.io.FileInputStream"%>
<%@page import="javax.imageio.stream.FileImageInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//파라미터 값 받기
	String cPath = request.getParameter("cPath");
	String fname = request.getParameter("f_name");

	//파일은 서버에 존재하고 그것을 원격에 있는
	//클라이언트에게 전달한다는 것은
	//서버에 있는 파일과 연결된 스트림을
	//클라이언트에게 주는 것이라고 생각하자!

	//우선 선택된 파일의 절대경로가 필요하다.
	String path = application.getRealPath("/members/" + cPath + "/" + fname);

	//위의 절대경로를 File객체로 생성하자
	File f = new File(path);

	//파일 존재여부 확인
	if (f.exists()) {
		long f_size = f.length();//파일 크기

		// 버퍼기능
		//byte[] buf = new byte[(int)f_size];
		byte[] buf = new byte[2048];

		int size = -1;

		// 다운로드에 필요한 스트림들 준비
		BufferedInputStream bis = null;
		InputStream in = null;
		BufferedOutputStream bos = null;
		ServletOutputStream sos = null;

		//서버를 요청할 때 클라이언트에게
		// 파일을 보내기 위해 필요한 스트림은
		// response객체를 통해서 얻어낸다.
		// 그것이 바로 
		// ServletOutputStream이다.

		try {
			//화면에 대화창 보여준다.
			//http프로토콜의 헤더 값을
			//변경하면 된다.
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition",
					"attachment;filename=" + new String(fname.getBytes(), "utf-8"));
			
			in = new FileInputStream(f);
			bis = new BufferedInputStream(in);
			
			//output스트림을 만들 때 문제가 될만한 것이 있다. 보통 화면에 표현하기 위해 쓰는 코드가 바로 out.println("a");
			//이것은 PrintWriter객체가 이미 응답객체에 준비된 스트림이다.
			//그러므로 이것을 쓰지 않겠다고 삭제해야한다.
			out.clear();
			out = pageContext.pushBody();
			
			//***************중		요********************
			sos = response.getOutputStream();
			bos = new BufferedOutputStream(sos);
			
			while((size = bis.read(buf)) != -1)
			{
				bos.write(buf, 0, size);
				bos.flush();//스트림 비우기				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			
			try{
				
				if(in != null)
					in.close();
				if(bis != null)
					bis.close();
				if(sos != null)
					sos.close();
				if(bos != null)
					bos.close();			
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}
	}
%>