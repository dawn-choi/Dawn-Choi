package com.pknu.notice.service.typehandler;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import org.springframework.jdbc.support.nativejdbc.CommonsDbcpNativeJdbcExtractor;

import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

public class ListMapTypeHandler implements TypeHandler<Object> {

	@Override
	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		if( cs.wasNull() ) {
			return null;
		} else {
			return cs.getString(columnIndex);
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public void setParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType) throws SQLException {
		
		List<String> list = (List<String>) parameter;
		
		//db연결
		CommonsDbcpNativeJdbcExtractor extractor 
	     = new CommonsDbcpNativeJdbcExtractor();
		
		Connection conn = extractor.getNativeConnection(ps.getConnection());
		
		ArrayDescriptor desc 
		= ArrayDescriptor.createDescriptor("FILE_ARRAY", conn); 
		
		//파일이 선택되지 않으면 list == null
		if(list == null || list.size() == 0) {
			ps.setArray(i, new ARRAY(desc, conn, new String[] {null}));
			
			System.out.println("파일이 없느데요");
			return;
		}
		
		int size = list.size();
		
		System.out.println(i + ":" + parameter);
		
		String[]     strings = new String[size];
		for (int j = 0; j < size; j++) {			
			strings[j] = list.get(j);
		}
		
		
		parameter = new ARRAY(desc, conn, strings);
		
		ps.setArray(i, (oracle.sql.ARRAY) parameter);
		
	}
	
	

}
