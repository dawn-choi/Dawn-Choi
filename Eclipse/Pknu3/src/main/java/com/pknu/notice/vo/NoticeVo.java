package com.pknu.notice.vo;

public class NoticeVo {

	//Fields
		private int idx;
		private String menu_id;
		private String title;
		private String cont;
		private String mid;
		// MEMBERS테이블의 이름
		private String mname;
		private String regdate;
		private int readcount;
		
		
		
		// 답글 
		// 답글 처리
		private   int       bnum;  // 글번호
		private   int       lvl;   // 답변단계
		private   int       step;  // 출력순서
		private   int       nref;  // 글 그룹번호
			
		private   int       delnum;  // 글 삭제 여부

		public int getIdx() {
			return idx;
		}

		public void setIdx(int idx) {
			this.idx = idx;
		}

		public String getMenu_id() {
			return menu_id;
		}

		public void setMenu_id(String menu_id) {
			this.menu_id = menu_id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getCont() {
			return cont;
		}

		public void setCont(String cont) {
			this.cont = cont;
		}

		public String getMid() {
			return mid;
		}

		public void setMid(String mid) {
			this.mid = mid;
		}

		public String getMname() {
			return mname;
		}

		public void setMname(String mname) {
			this.mname = mname;
		}

		public String getRegdate() {
			return regdate;
		}

		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}

		public int getReadcount() {
			return readcount;
		}

		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}

		public int getBnum() {
			return bnum;
		}

		public void setBnum(int bnum) {
			this.bnum = bnum;
		}

		public int getLvl() {
			return lvl;
		}

		public void setLvl(int lvl) {
			this.lvl = lvl;
		}

		public int getStep() {
			return step;
		}

		public void setStep(int step) {
			this.step = step;
		}

		public int getNref() {
			return nref;
		}

		public void setNref(int nref) {
			this.nref = nref;
		}

		public int getDelnum() {
			return delnum;
		}

		public void setDelnum(int delnum) {
			this.delnum = delnum;
		}

		@Override
		public String toString() {
			return "NoticeVo [idx=" + idx + ", menu_id=" + menu_id + ", title=" + title + ", cont=" + cont + ", mid="
					+ mid + ", mname=" + mname + ", regdate=" + regdate + ", readcount=" + readcount + ", bnum=" + bnum
					+ ", lvl=" + lvl + ", step=" + step + ", nref=" + nref + ", delnum=" + delnum + "]";
		}
		
		

		

}
