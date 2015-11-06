package silver.web.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import silver.web.vo.LoginVO;

public class LoginDAO {
	
	private SqlSessionTemplate template;
	
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
		//System.out.println("^^::::::::::::::::::::::::");
	}

	// 로그인 기능
	public LoginVO login(Map<String, String> m){
		
		return template.selectOne("silver.login", m);
		
	}
	
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