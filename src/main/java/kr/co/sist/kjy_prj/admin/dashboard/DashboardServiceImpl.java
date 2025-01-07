package kr.co.sist.kjy_prj.admin.dashboard;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.kjy_prj.admin.movie.MovieDomain;

@Service
public class DashboardServiceImpl implements DashboardService {
	
	@Autowired(required = false)
	private DashboardDAOImpl dDAO;
	
	@Override
	public String searchDataType(String type) {
		JSONObject jsonObj = new JSONObject();
		
		try {
			if("books".equals(type)) {
				System.out.println("-----------------------type: books");
				int[] bookedTickets = dDAO.selectBookedTickets();
				int[] canceledTickets = dDAO.selectCanceledTickets();
				
				JSONArray bookedArray = new JSONArray();
				JSONArray canceledArray = new JSONArray();
				
				for(int i = 0; i < bookedTickets.length; i++) {
					System.out.println("--------------------------bookedTickets: " + bookedTickets[i]);
					System.out.println("--------------------------canceledTickets: " +canceledTickets[i]);
				}//end for
				
				for(int i = 0; i < bookedTickets.length; i++) {
					bookedArray.add(bookedTickets[i]);
					canceledArray.add(canceledTickets[i]);
				}//end for
				
				jsonObj.put("bookedTickets", bookedArray);
				jsonObj.put("canceledTickets", canceledArray);
			} else if("members".equals(type)) {
				System.out.println("-----------------------type: members");
				int[] joins = dDAO.selectJoinMember();
	            int[] withdraws = dDAO.selectWithdrawMember();

	            JSONArray joinArray = new JSONArray();
	            JSONArray withdrawArray = new JSONArray();

	            for(int i = 0; i < joins.length; i++) {
	            	System.out.println("--------------------------joins: " +joins[i]);
	            	System.out.println("--------------------------withdraws: " +withdraws[i]);
	            }
	            
	            for(int i = 0; i < joins.length; i++) {
	                joinArray.add(joins[i]);
	                withdrawArray.add(withdraws[i]);
	            }

	            jsonObj.put("joins", joinArray);
	            jsonObj.put("withdraws", withdrawArray);

			}//end else
			
		} catch(Exception e) {
			jsonObj.put("error", e.getMessage());
		}//end catch
		
		return jsonObj.toJSONString();
	}//searchDataType



	@Override
	public List<DashMovieDomain> searchAllMovie() {
		List<DashMovieDomain> list = new ArrayList<DashMovieDomain>();
		
		try {
			dDAO = DashboardDAOImpl.getInstance();
			list = dDAO.selectAllMovie();
			System.out.println("-----------------------service: " + list);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchAllMovie
	
	
	
}//class
