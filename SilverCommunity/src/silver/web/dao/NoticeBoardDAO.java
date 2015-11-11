package silver.web.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


import silver.web.vo.NoticeBoardVO;

public class NoticeBoardDAO {
	
	private SqlSessionTemplate template;

	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	//공지사항 로직
	
	//원하는 공지사항의 게시물 수를 반환
	public int getTotalCount(){
		return template.selectOne("silver.notice_totalCount");
	}
	//표현할 게시물 목록을 반환
	public NoticeBoardVO[] getList(Map<String, String> m){
		List<NoticeBoardVO> list = template.selectList("silver.notice_list", m);
		
		// 받은 list 구조를 다시 배열로 변환 
		NoticeBoardVO[] ar = null;
		if(list != null && list.size()>0){
			ar= new NoticeBoardVO[list.size()];
			//list의 요소들을 배열에 복사해 넣는다. 
			list.toArray(ar);
		}
		return ar;
	}
	//공지사항 글저장
	public boolean writeBbs(NoticeBoardVO vo){
		int cnt = template.insert("silver.notice_write",vo);
		if(cnt >0 ){
			return true;
			}
		else{
			return false;
			}
		}
	//게시글보기
	public NoticeBoardVO getBoard(String b_idx){
		return template.selectOne("silver.notice_getBoard", b_idx);
	}
	
	public void editBbs(NoticeBoardVO vo){
		template.update("silver.notice_edit", vo);
	}
	public void delBbs(NoticeBoardVO vo){
		template.update("silver.notice_del",vo);
	}
}
