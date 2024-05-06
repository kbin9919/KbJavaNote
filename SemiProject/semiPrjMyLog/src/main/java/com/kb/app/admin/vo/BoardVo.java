package com.kb.app.admin.vo;

public class BoardVo {
	private String no;
	private String writer;
	private String categoryNo;
	private String title;
	private String content;
	private String createDate;
	private String secretYn;
	private String hits;
	private String recommend;
	private String noticeYn;

	public BoardVo() {
		super();
	}

	public BoardVo(String no, String writer, String categoryNo, String title, String content, String createDate,
			String secretYn, String hits, String recommend, String noticeYn) {
		super();
		this.no = no;
		this.writer = writer;
		this.categoryNo = categoryNo;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.secretYn = secretYn;
		this.hits = hits;
		this.recommend = recommend;
		this.noticeYn = noticeYn;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getSecretYn() {
		return secretYn;
	}

	public void setSecretYn(String secretYn) {
		this.secretYn = secretYn;
	}

	public String getHits() {
		return hits;
	}

	public void setHits(String hits) {
		this.hits = hits;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	public String getNoticeYn() {
		return noticeYn;
	}

	public void setNoticeYn(String noticeYn) {
		this.noticeYn = noticeYn;
	}

	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", writer=" + writer + ", categoryNo=" + categoryNo + ", title=" + title
				+ ", content=" + content + ", createDate=" + createDate + ", secretYn=" + secretYn + ", hits=" + hits
				+ ", recommend=" + recommend + ", noticeYn=" + noticeYn + "]";
	}

}
