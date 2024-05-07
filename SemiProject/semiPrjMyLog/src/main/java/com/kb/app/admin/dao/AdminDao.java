package com.kb.app.admin.dao;

import static com.kb.app.admin.db.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kb.app.admin.vo.AdminVo;
import com.kb.app.admin.vo.BoardVo;
import com.kb.app.admin.vo.MemberVo;

public class AdminDao {

	public AdminVo login(Connection conn, AdminVo adminVo) throws Exception {
		String sql = "SELECT * FROM MEMBER WHERE EMAIL = ? AND PASSWORD = ? AND AUTHORITY = 'Y'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, adminVo.getEmail());
		pstmt.setString(2, adminVo.getPassword());

		ResultSet rs = pstmt.executeQuery();

		AdminVo newAdminVo = null;
		if (rs.next()) {
			String adminEmailId = rs.getString("EMAIL");
			String adminPwd = rs.getString("PASSWORD");
			String adminNick = rs.getString("NICK");

			newAdminVo = new AdminVo();
			newAdminVo.setEmail(adminEmailId);
			newAdminVo.setPassword(sql);
			newAdminVo.setNick(adminNick);
		}
		close(rs);
		close(pstmt);
		return newAdminVo;
	}

	public List<BoardVo> selectBoardList(Connection conn) throws Exception {
		String sql = "SELECT * FROM BOARD ORDER BY NO DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		List<BoardVo> boardVoList = new ArrayList<BoardVo>();
		while (rs.next()) {
			String no = rs.getString("NO");
			String writer = rs.getString("WRITER");
			String categoryNo = rs.getString("CATEGORY_NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String createDate = rs.getString("CREATE_DATE");
			String secretYn = rs.getString("SECRET_YN");
			String hits = rs.getString("HITS");
			String recommend = rs.getString("RECOMMEND");
			String noticeYn = rs.getString("NOTICE_YN");

			BoardVo vo = new BoardVo();
			vo.setNo(no);
			vo.setWriter(writer);
			vo.setCategoryNo(categoryNo);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setSecretYn(secretYn);
			vo.setCreateDate(createDate);
			vo.setHits(hits);
			vo.setRecommend(recommend);
			vo.setNoticeYn(noticeYn);

			boardVoList.add(vo);
		}
		close(pstmt);
		close(rs);
		return boardVoList;
	}

	public BoardVo detailBoard(Connection conn, String getTitle) throws Exception {
		String sql = "SELECT * FROM BOARD WHERE TITLE = ? ORDER BY NO DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, getTitle);
		System.out.println(getTitle);
		ResultSet rs = pstmt.executeQuery();
		BoardVo boardVo = null;

		if (rs.next()) {
			String no = rs.getString("NO");
			String writer = rs.getString("WRITER");
			String categoryNo = rs.getString("CATEGORY_NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String createDate = rs.getString("CREATE_DATE");
			String secretYn = rs.getString("SECRET_YN");
			String hits = rs.getString("HITS");
			String recommend = rs.getString("RECOMMEND");
			String noticeYn = rs.getString("NOTICE_YN");

			boardVo = new BoardVo();
			boardVo.setNo(no);
			boardVo.setWriter(writer);
			boardVo.setCategoryNo(categoryNo);
			boardVo.setTitle(title);
			boardVo.setContent(content);
			boardVo.setSecretYn(secretYn);
			boardVo.setCreateDate(createDate);
			boardVo.setHits(hits);
			boardVo.setRecommend(recommend);
			boardVo.setNoticeYn(noticeYn);

		}
		System.out.println(boardVo);
		close(pstmt);
		close(rs);
		return boardVo;
	}

	public List<BoardVo> selectDelBoardList(Connection conn) throws Exception {
		String sql = "SELECT * FROM DEL_BOARD ORDER BY NO DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		List<BoardVo> delBoardVoList = new ArrayList<BoardVo>();
		while (rs.next()) {
			String no = rs.getString("NO");
			String writer = rs.getString("WRITER");
			String categoryNo = rs.getString("CATEGORY_NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String createDate = rs.getString("CREATE_DATE");
			String secretYn = rs.getString("SECRET_YN");
			String hits = rs.getString("HITS");
			String recommend = rs.getString("RECOMMEND");
			String noticeYn = rs.getString("NOTICE_YN");

			BoardVo vo = new BoardVo();
			vo.setNo(no);
			vo.setWriter(writer);
			vo.setCategoryNo(categoryNo);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setSecretYn(secretYn);
			vo.setCreateDate(createDate);
			vo.setHits(hits);
			vo.setRecommend(recommend);
			vo.setNoticeYn(noticeYn);

			delBoardVoList.add(vo);
		}
		close(pstmt);
		close(rs);
		return delBoardVoList;
	}

	public BoardVo detailDelBoard(Connection conn, String getTitle) throws Exception {
		String sql = "SELECT * FROM DEL_BOARD WHERE TITLE = ? ORDER BY NO DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, getTitle);
		System.out.println(getTitle);
		ResultSet rs = pstmt.executeQuery();
		BoardVo delBoardVo = null;

		if (rs.next()) {
			String no = rs.getString("NO");
			String writer = rs.getString("WRITER");
			String categoryNo = rs.getString("CATEGORY_NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String createDate = rs.getString("CREATE_DATE");
			String secretYn = rs.getString("SECRET_YN");
			String hits = rs.getString("HITS");
			String recommend = rs.getString("RECOMMEND");
			String noticeYn = rs.getString("NOTICE_YN");

			delBoardVo = new BoardVo();
			delBoardVo.setNo(no);
			delBoardVo.setWriter(writer);
			delBoardVo.setCategoryNo(categoryNo);
			delBoardVo.setTitle(title);
			delBoardVo.setContent(content);
			delBoardVo.setSecretYn(secretYn);
			delBoardVo.setCreateDate(createDate);
			delBoardVo.setHits(hits);
			delBoardVo.setRecommend(recommend);
			delBoardVo.setNoticeYn(noticeYn);

		}
		System.out.println(delBoardVo);
		close(pstmt);
		close(rs);
		return delBoardVo;
	}

	public List<MemberVo> selectMemberList(Connection conn) throws Exception {
		String sql = "SELECT * FROM MEMBER ORDER BY EMAIL DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		List<MemberVo> memberVoList = new ArrayList<>();
		while (rs.next()) {
			String email = rs.getString("EMAIL");
			String password = rs.getString("PASSWORD");
			String nick = rs.getString("NICK");
			String enrollDate = rs.getString("ENROLL_DATE");
			String modifyDate = rs.getString("MODIFY_DATE");
			String introduction = rs.getString("INTRODUCTION");
			String followers = rs.getString("FOLLOWERS");
			String following = rs.getString("FOLLOWING");
			String warnigPoint = rs.getString("WARNIG_POINT");
			String authority = rs.getString("AUTHORITY");

			MemberVo vo = new MemberVo();

			vo.setEmail(email);
			vo.setPassword(password);
			vo.setNick(nick);
			vo.setEnrollDate(enrollDate);
			vo.setModifyDate(modifyDate);
			vo.setIntroduction(introduction);
			vo.setFollowers(followers);
			vo.setFollowing(following);
			vo.setWarnigPoint(warnigPoint);
			vo.setAuthority(authority);

			memberVoList.add(vo);
		}
		close(pstmt);
		close(rs);
		return memberVoList;
	}

	public MemberVo detailMember(Connection conn, String getEmail) throws Exception {
		String sql = "SELECT * FROM MEMBER WHERE EMAIL = ? ORDER BY EMAIL DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, getEmail);
		ResultSet rs = pstmt.executeQuery();
		MemberVo  memberVo = null;
		
		if (rs.next()) {
			String email = rs.getString("EMAIL");
			String password = rs.getString("PASSWORD");
			String nick = rs.getString("NICK");
			String enrollDate = rs.getString("ENROLL_DATE");
			String modifyDate = rs.getString("MODIFY_DATE");
			String introduction = rs.getString("INTRODUCTION");
			String followers = rs.getString("FOLLOWERS");
			String following = rs.getString("FOLLOWING");
			String warnigPoint = rs.getString("WARNIG_POINT");
			String authority = rs.getString("AUTHORITY");
			
			memberVo = new MemberVo();
			
			memberVo.setEmail(email);
			memberVo.setPassword(password);
			memberVo.setNick(nick);
			memberVo.setEnrollDate(enrollDate);
			memberVo.setModifyDate(modifyDate);
			memberVo.setIntroduction(introduction);
			memberVo.setFollowers(followers);
			memberVo.setFollowing(following);
			memberVo.setWarnigPoint(warnigPoint);
			memberVo.setAuthority(authority);
		}
		close(pstmt);
		close(rs);
		return memberVo;
	}

	public List<MemberVo> selectDelMemberList(Connection conn) throws Exception {
		String sql = "SELECT * FROM DEL_MEMBER ORDER BY EMAIL DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		List<MemberVo> delMemberVoList = new ArrayList<>();
		while (rs.next()) {
			String email = rs.getString("EMAIL");
			String password = rs.getString("PASSWORD");
			String nick = rs.getString("NICK");
			String enrollDate = rs.getString("ENROLL_DATE");
			String modifyDate = rs.getString("MODIFY_DATE");
			String introduction = rs.getString("INTRODUCTION");
			String followers = rs.getString("FOLLOWERS");
			String following = rs.getString("FOLLOWING");
			String warnigPoint = rs.getString("WARNIG_POINT");
			String authority = rs.getString("AUTHORITY");

			MemberVo vo = new MemberVo();

			vo.setEmail(email);
			vo.setPassword(password);
			vo.setNick(nick);
			vo.setEnrollDate(enrollDate);
			vo.setModifyDate(modifyDate);
			vo.setIntroduction(introduction);
			vo.setFollowers(followers);
			vo.setFollowing(following);
			vo.setWarnigPoint(warnigPoint);
			vo.setAuthority(authority);

			delMemberVoList.add(vo);
		}
		close(pstmt);
		close(rs);
		return delMemberVoList;
	}

	public MemberVo detailDelMember(Connection conn, String getEmail) throws Exception {
		String sql = "SELECT * FROM DEL_MEMBER WHERE EMAIL = ? ORDER BY EMAIL DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, getEmail);
		ResultSet rs = pstmt.executeQuery();
		MemberVo delMemberVo = null;
		
		if (rs.next()) {
			System.out.println("123");
			String email = rs.getString("EMAIL");
			String password = rs.getString("PASSWORD");
			String nick = rs.getString("NICK");
			String enrollDate = rs.getString("ENROLL_DATE");
			String modifyDate = rs.getString("MODIFY_DATE");
			String introduction = rs.getString("INTRODUCTION");
			String followers = rs.getString("FOLLOWERS");
			String following = rs.getString("FOLLOWING");
			String warnigPoint = rs.getString("WARNIG_POINT");
			String authority = rs.getString("AUTHORITY");
			
			delMemberVo = new MemberVo();
			
			delMemberVo.setEmail(email);
			delMemberVo.setPassword(password);
			delMemberVo.setNick(nick);
			delMemberVo.setEnrollDate(enrollDate);
			delMemberVo.setModifyDate(modifyDate);
			delMemberVo.setIntroduction(introduction);
			delMemberVo.setFollowers(followers);
			delMemberVo.setFollowing(following);
			delMemberVo.setWarnigPoint(warnigPoint);
			delMemberVo.setAuthority(authority);
		}
		close(pstmt);
		close(rs);
		return delMemberVo;
	}

	public int warning(Connection conn, String warningNo, String email) throws Exception {
		System.out.println("dao 넘어옴");
		System.out.println("dao 넘어옴" + email + ", " + warningNo);
		String sql = "INSERT INTO WARNING_NUM(NO, EMAIL, WARNING_NO, WARNING_NUM) VALUES(SEQ_WARNING_NUM.NEXTVAL, ?, ?, 1)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, warningNo);
		System.out.println("쿼리문 통과");
		int result = pstmt.executeUpdate();
		
		close(pstmt);
		System.out.println("dao 리턴" + result);
		return result;
	}

}
