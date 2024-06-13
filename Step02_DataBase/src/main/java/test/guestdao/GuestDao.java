package test.guestdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.guestdto.GuestDto;
import test.util.DbcpBean;


/*
 * 		application 전역에서 GuestDao 객체는 오직 한개만 생성되어서 사용되도록 클래스를 설계한다.
 * 			- 한정된 자원인 Connection 객체를 좀 더 효율적으로 사용하기 위해
 */
public class GuestDao {
	// 자신의 참조값을 저장할 static 필드
	private static GuestDao dao;
	
	// static 초기화 블럭 (여기 클래스가 최초로 사용 될 때 오직 한번만 수행된다.)
	static {
		// 객체를 생성해서 static 필드에 담느다. 
		dao=new GuestDao();
		
		
		
	}
	// 외부에서 객체 생성하지 못하도록 생성자의 접근 지정자를 private로 설정
	private GuestDao() {
		
	}
	
	// static 필드에 저장된 GuestDao의 참조값을 리턴해주는 static 메소드
	public static GuestDao getInstance() {
		return GuestDao.dao;
	}
	
	// 글 수정하는 메소드
	public boolean update(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt =null;
		int rowCount =0;		
			try {
				//Connectiopn 객체의 참조값
				conn = new DbcpBean().getConn();
				String sql = "UPDATE board_guest"
							+ " set writer=?, content=?"
							+ " where num=? and pwd=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getContent());
				pstmt.setInt(3, dto.getNum());
				pstmt.setString(4, dto.getPwd());

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
	
	// 글 삭제하는 메소드
	public boolean delete(GuestDto dto) {
		Connection conn = null;
				PreparedStatement pstmt =null;
				int rowCount = 0;
				try {
					//Connectiopn 객체의 참조값
					conn = new DbcpBean().getConn();
					String sql = "DELETE FROM board_guest"
							+ " where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, dto.getNum());
					rowCount = pstmt.executeUpdate();
	
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(pstmt!=null)pstmt.close();
						if(conn!=null)conn.close();
					}catch(Exception e) {
						
					}
				}
				if (rowCount > 0) {
					return true;
				} else {
					return false;
				}
	}
	
	// 글 하나의 정보를 리턴하는 메소드
	public GuestDto getDate(int num) {
		GuestDto dto =null;
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;	
				try {
					//Connectiopn 객체의 참조값
					conn = new DbcpBean().getConn();
					String sql = "SELECT writer, content, pwd, regdate"
							+ " from  board_guest"
							+ " where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					rs = pstmt.executeQuery();
			
					if(rs.next()) {
						// GuestDto 객체를 생성해서 
						dto = new GuestDto();
						dto.setNum(num);
						// Select 된 정보를 담는다.
						dto.setWriter(rs.getString("writer"));
						dto.setContent(rs.getString("content"));
						dto.setPwd(rs.getString("pwd"));
						dto.setRegdate(rs.getString("regdate"));
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(rs!=null)rs.close();
						if(pstmt!=null)pstmt.close();
						if(conn!=null)conn.close();
					}catch(Exception e) {
				}
			}
			return dto;

		}
		
	
	
	// 글 목록을 리턴하는 메소드
	public List<GuestDto> getList(){
		List<GuestDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
				
			try {
				//Connectiopn 객체의 참조값
				conn = new DbcpBean().getConn();
				String sql = "SELECT num, writer, content, pwd, regdate"
							+ " from board_guest"
							+ " ORDER BY num asc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
					
				while(rs.next()) {
					// 커서가 위치한 곳의 글정보를 추출해서 GuestDto 객체에 담은 다음
					GuestDto dto = new GuestDto();
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setContent(rs.getString("content"));
					dto.setPwd(rs.getString("pwd"));
					dto.setRegdate(rs.getString("regdate")); // 날짜도 .getString() 하면된다.
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
	
	
	// 글정보를 DB에 저장하는 메소드
	public boolean insert(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt =null;
		int rowCount = 0;
			try {
				//Connectiopn 객체의 참조값
				conn = new DbcpBean().getConn();
				String sql = "INSERT INTO board_guest"
							+ " (num, writer, content, pwd, regdate)"
							+ " VALUES(board_guest_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,  dto.getWriter());
				pstmt.setString(2,  dto.getContent());
				pstmt.setString(3,  dto.getPwd());
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
}
