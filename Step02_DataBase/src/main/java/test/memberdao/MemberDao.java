package test.memberdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.memberdto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		//변화된 row 갯수를 저장할 변수를 0 을 대입해서 미리 만들어 둔다.
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 
			String sql = "Update member"
					+ " set name=?, addr=?"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문이 미완성이라면 여기서 값 바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			//sql 문 실행하고 변화된 row 의 갯수를 변수에 담는다.  
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}		
	
	// 회원 정보 DB에서 삭제 
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		//변화된 row 갯수를 저장할 변수를 0 을 대입해서 미리 만들어 둔다.
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 
			String sql = "DELETE FROM MEMBER"
							+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			//sql 문이 미완성이라면 여기서 값 바인딩
			pstmt.setInt(1, num);
			//sql 문 실행하고 변화된 row 의 갯수를 변수에 담는다.  
			rowCount = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			//변화된 rowCount 를 이용해서 작업의 성공 여부를 리턴해 준다.
			if (rowCount > 0) {
				return true;
			} else {
				return false;
			}
	}
	
	
	
	// 회원 정보를 DB에 저장하고 작성 성곡 여부를 리턴하는 메소드
	public boolean insert(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		//변화된 row 갯수를 저장할 변수를 0 을 대입해서 미리 만들어 둔다.
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 
			String sql = "INSERT INTO member"
							+ " (num, name, addr)"
							+ " VALUES(member_seq.NEXTVAL, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			//sql 문이 미완성이라면 여기서 값 바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			//sql 문 실행하고 변화된 row 의 갯수를 변수에 담는다.  
			rowCount = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			//변화된 rowCount 를 이용해서 작업의 성공 여부를 리턴해 준다.
			if (rowCount > 0) {
				return true;
			} else {
				return false;
			}
	}
	
	
	
	// 회원 목록을 리턴하는 메소드 
	public List<MemberDto> getList() {
		// 회원 정보를 누적할 ArrayList 객체 생성
		List<MemberDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		try {
			//Connectiopn 객체의 참조값
			conn = new DbcpBean().getConn();
			String sql = "SELECT num, name, addr"
							+ " from member"
							+ " ORDER BY num asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				// select 된 회원 정보를 MemberDto 객체에 담는다.
				MemberDto dto = new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				// MemberDto 객체를 list에 누적 시킨다.
				list.add(dto);
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		return list;
	}
	
	
	
	
}
