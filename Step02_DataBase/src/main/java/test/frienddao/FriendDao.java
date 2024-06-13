package test.frienddao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.frienddto.FriendDto;
import test.memberdto.MemberDto;
import test.util.DbcpBean;

public class FriendDao {
	
	public boolean update(FriendDto dto) {
		Connection conn = null;
		PreparedStatement pstmt =null;
		int rowCount = 0;
			
			try {
				//Connectiopn 객체의 참조값
				conn = new DbcpBean().getConn();
				String sql = "UPDATE friends"
							+ " set name=?, phonenum=?"
							+ " where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getPhonenum());
					pstmt.setInt(3, dto.getNum());
					rowCount = pstmt.executeUpdate();
					
				
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(pstmt!=null)pstmt.close();
						if(conn!=null)conn.close();
					}catch(Exception e) {}
				}
			if (rowCount > 0) {
				return true;
			} else {
				return false;
			}
	}
		
	
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt =null;
		int rowCount = 0;
				
			try {
				//Connectiopn 객체의 참조값
				conn = new DbcpBean().getConn();
				String sql = "delete from friends"
							+ " where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rowCount = pstmt.executeUpdate();
								
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(pstmt!=null)pstmt.close();
						if(conn!=null)conn.close();
					}catch(Exception e) {}
				} 
			if (rowCount > 0) {
				return true;
			} else {
				return false;
			}
	}

	
	public boolean insert(FriendDto dto) {
		Connection conn = null;
		PreparedStatement pstmt =null;
		int rowCount = 0;
			
		try {
			//Connectiopn 객체의 참조값
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO Friends"
					+ " (num, name, phonenum)"
					+ " VALUES(friend_seq.NEXTVAL, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhonenum());
			rowCount = pstmt.executeUpdate();
		
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {}
			}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
		
		}
	
	public List<FriendDto> getList(){
		List<FriendDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
	
		try {
			conn = new DbcpBean().getConn();
			String sql =  "SELECT num, name, phonenum"
							+ " from friends"
							+ " ORDER BY num asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FriendDto dto = new FriendDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setPhonenum(rs.getString("phonenum"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				
			} catch (Exception e) {
				
			}
		}
		return list;
	
	}
}	
	
	
