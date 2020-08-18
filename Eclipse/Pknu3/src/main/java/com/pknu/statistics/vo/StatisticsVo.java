package com.pknu.statistics.vo;

public class StatisticsVo {

		//	Fields
		
		// 수강신청
		//	members : mid, mpwd, mname, memail, mbirth, mgender, mtel, maddr
		private String mid;
		private String mpwd;
		private String mname;
		private String memail;
		private String mbirth;
		private String mgender;
		private String mtel;
		private String maddr;
		
		//	classroom : rid, rname
		private String rid;
		private String rname;
		
		//	trainers : tid, tname
		private String tid;
		private String tname;
		
		//	grpcommons : grid, grname
		private String grid;
		private String grname;
		
		//  commons  : cid, grid, cname, clvl, cparent_id
		private String cid;
		private String cname;
		private int    clvl;
		private String cparent_id;
		
		//	products : pid, pname, pcost, ptot, cid
		private String pid;
		private String pname;
		private String pcost;
		private String ptot;
		
		//	lectures : lid, lname, pid, rid, tid
		private String lid;
		private String lname;

		//	dlectures : did, lid, pid, dsdate, dday, dtime, dhours
		private String did;
		private String dsdate;
		private String dday;
		private String dtime;
		private String dhours;
		
		//	lsales : lsid, lid, mid, lsdate
		private String lsid;
		private String lsdate;
		
		//	운동 향상량
		//	bimp : pid bid imp
		private String bid;
		private int imp;
		
		//	bpart : bid, bname
		private String bname;
		
		//	Constructor
		public StatisticsVo() {	}
		
		public StatisticsVo(String mid, String mpwd, String mname, String memail, String mbirth, String mgender, String mtel,
				String maddr, String rid, String rname, String tid, String tname, String grid, String grname, String cid,
				String cname, int clvl, String cparent_id, String pid, String pname, String pcost, String ptot, String lid,
				String lname, String did, String dsdate, String dday, String dtime, String dhours, String lsid,
				String lsdate, String bid, int imp, String bname) {
			
			this.mid = mid;
			this.mpwd = mpwd;
			this.mname = mname;
			this.memail = memail;
			this.mbirth = mbirth;
			this.mgender = mgender;
			this.mtel = mtel;
			this.maddr = maddr;
			this.rid = rid;
			this.rname = rname;
			this.tid = tid;
			this.tname = tname;
			this.grid = grid;
			this.grname = grname;
			this.cid = cid;
			this.cname = cname;
			this.clvl = clvl;
			this.cparent_id = cparent_id;
			this.pid = pid;
			this.pname = pname;
			this.pcost = pcost;
			this.ptot = ptot;
			this.lid = lid;
			this.lname = lname;
			this.did = did;
			this.dsdate = dsdate;
			this.dday = dday;
			this.dtime = dtime;
			this.dhours = dhours;
			this.lsid = lsid;
			this.lsdate = lsdate;
			this.bid = bid;
			this.imp = imp;
			this.bname = bname;
		}
		
		//	Getter / Setter
		public String getMid() {
			return mid;
		}

		public void setMid(String mid) {
			this.mid = mid;
		}

		public String getMpwd() {
			return mpwd;
		}

		public void setMpwd(String mpwd) {
			this.mpwd = mpwd;
		}

		public String getMname() {
			return mname;
		}

		public void setMname(String mname) {
			this.mname = mname;
		}

		public String getMemail() {
			return memail;
		}

		public void setMemail(String memail) {
			this.memail = memail;
		}

		public String getMbirth() {
			return mbirth;
		}

		public void setMbirth(String mbirth) {
			this.mbirth = mbirth;
		}

		public String getMgender() {
			return mgender;
		}

		public void setMgender(String mgender) {
			this.mgender = mgender;
		}

		public String getMtel() {
			return mtel;
		}

		public void setMtel(String mtel) {
			this.mtel = mtel;
		}

		public String getMaddr() {
			return maddr;
		}

		public void setMaddr(String maddr) {
			this.maddr = maddr;
		}

		public String getRid() {
			return rid;
		}

		public void setRid(String rid) {
			this.rid = rid;
		}

		public String getRname() {
			return rname;
		}

		public void setRname(String rname) {
			this.rname = rname;
		}

		public String getTid() {
			return tid;
		}

		public void setTid(String tid) {
			this.tid = tid;
		}

		public String getTname() {
			return tname;
		}

		public void setTname(String tname) {
			this.tname = tname;
		}

		public String getGrid() {
			return grid;
		}

		public void setGrid(String grid) {
			this.grid = grid;
		}

		public String getGrname() {
			return grname;
		}

		public void setGrname(String grname) {
			this.grname = grname;
		}

		public String getCid() {
			return cid;
		}

		public void setCid(String cid) {
			this.cid = cid;
		}

		public String getCname() {
			return cname;
		}

		public void setCname(String cname) {
			this.cname = cname;
		}

		public int getClvl() {
			return clvl;
		}

		public void setClvl(int clvl) {
			this.clvl = clvl;
		}

		public String getCparent_id() {
			return cparent_id;
		}

		public void setCparent_id(String cparent_id) {
			this.cparent_id = cparent_id;
		}

		public String getPid() {
			return pid;
		}

		public void setPid(String pid) {
			this.pid = pid;
		}

		public String getPname() {
			return pname;
		}

		public void setPname(String pname) {
			this.pname = pname;
		}

		public String getPcost() {
			return pcost;
		}

		public void setPcost(String pcost) {
			this.pcost = pcost;
		}

		public String getPtot() {
			return ptot;
		}

		public void setPtot(String ptot) {
			this.ptot = ptot;
		}

		public String getLid() {
			return lid;
		}

		public void setLid(String lid) {
			this.lid = lid;
		}

		public String getLname() {
			return lname;
		}

		public void setLname(String lname) {
			this.lname = lname;
		}

		public String getDid() {
			return did;
		}

		public void setDid(String did) {
			this.did = did;
		}

		public String getDsdate() {
			return dsdate;
		}

		public void setDsdate(String dsdate) {
			this.dsdate = dsdate;
		}

		public String getDday() {
			return dday;
		}

		public void setDday(String dday) {
			this.dday = dday;
		}

		public String getDtime() {
			return dtime;
		}

		public void setDtime(String dtime) {
			this.dtime = dtime;
		}

		public String getDhours() {
			return dhours;
		}

		public void setDhours(String dhours) {
			this.dhours = dhours;
		}

		public String getLsid() {
			return lsid;
		}

		public void setLsid(String lsid) {
			this.lsid = lsid;
		}

		public String getLsdate() {
			return lsdate;
		}

		public void setLsdate(String lsdate) {
			this.lsdate = lsdate;
		}

		public String getBid() {
			return bid;
		}

		public void setBid(String bid) {
			this.bid = bid;
		}

		public int getImp() {
			return imp;
		}

		public void setImp(int imp) {
			this.imp = imp;
		}

		public String getBname() {
			return bname;
		}

		public void setBname(String bname) {
			this.bname = bname;
		}
		
		//	toString
		@Override
		public String toString() {
			return "ScheduleVo [mid=" + mid + ", mpwd=" + mpwd + ", mname=" + mname + ", memail=" + memail + ", mbirth="
					+ mbirth + ", mgender=" + mgender + ", mtel=" + mtel + ", maddr=" + maddr + ", rid=" + rid + ", rname="
					+ rname + ", tid=" + tid + ", tname=" + tname + ", grid=" + grid + ", grname=" + grname + ", cid=" + cid
					+ ", cname=" + cname + ", clvl=" + clvl + ", cparent_id=" + cparent_id + ", pid=" + pid + ", pname="
					+ pname + ", pcost=" + pcost + ", ptot=" + ptot + ", lid=" + lid + ", lname=" + lname + ", did=" + did
					+ ", dsdate=" + dsdate + ", dday=" + dday + ", dtime=" + dtime + ", dhours=" + dhours + ", lsid=" + lsid
					+ ", lsdate=" + lsdate + ", bid=" + bid + ", imp=" + imp + ", bname=" + bname + "]";
		}
		
	}

