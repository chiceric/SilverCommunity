package silver.web.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import silver.web.vo.LoginVO;

public class LoginDAO {
	
	private SqlSessionTemplate template;
	
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}

	// 로그인 기능
	/*public static LoginVO login(
			String tel, String pwd){
		
		//인자로 넘어온 id와 pwd를
		//mapper에 전달하기 위해 Map구조를
		// 생성한다.
		HashMap<String, String> map =
			new HashMap<>();
		map.put("tel", tel);
		map.put("pwd", pwd);
		
		//mapper를 호출하기 위해 필요한
		//SqlSession을 구한다.
		SqlSession ss = FactoryService.getFactory().openSession();
		
		LoginVO vo = ss.selectOne(
				"silver.login", map);
		
		ss.close();
		
		return vo;//만약! id와 pwd가 
		//다르다면 null이 반환된다.
	}*/
	
	// 회원가입 기능
	public boolean add(
		LoginVO vo){
		
		//받은 인자들을 mem.add가 원하는
		//MemberVO에 저장하여 보낸다.
		int cnt =  template.insert("silver.add", vo);
		
		if(cnt > 0)
			return true;
		else
			return false;
	}
}