package com.pknu.statistics.vo;

public class StatisticsVo {

		//	Fields
		
		//	chart
		private String	str;
		private String  pname;
		private int	 	agecnt;
		private String  mgender;
		private int	 	gencnt;
		private String  tname;
		private int	 	trncnt;
		
		//	Constructor
		public StatisticsVo() {	}

		public StatisticsVo(String str, String pname, int agecnt, String mgender, int gencnt, String tname,
				int trncnt) {
			this.str = str;
			this.pname = pname;
			this.agecnt = agecnt;
			this.mgender = mgender;
			this.gencnt = gencnt;
			this.tname = tname;
			this.trncnt = trncnt;
		}

		public String getStr() {
			return str;
		}

		public void setStr(String str) {
			this.str = str;
		}

		public String getPname() {
			return pname;
		}

		public void setPname(String pname) {
			this.pname = pname;
		}

		public int getAgecnt() {
			return agecnt;
		}

		public void setAgecnt(int agecnt) {
			this.agecnt = agecnt;
		}

		public String getMgender() {
			return mgender;
		}

		public void setMgender(String mgender) {
			this.mgender = mgender;
		}

		public int getGencnt() {
			return gencnt;
		}

		public void setGencnt(int gencnt) {
			this.gencnt = gencnt;
		}

		public String getTname() {
			return tname;
		}

		public void setTname(String tname) {
			this.tname = tname;
		}

		public int getTrncnt() {
			return trncnt;
		}

		public void setTrncnt(int trncnt) {
			this.trncnt = trncnt;
		}

		@Override
		public String toString() {
			return "StatisticsVo [str=" + str + ", pname=" + pname + ", agecnt=" + agecnt + ", mgender=" + mgender
					+ ", gencnt=" + gencnt + ", tname=" + tname + ", trncnt=" + trncnt + "]";
		}
		
		
		
		
}
