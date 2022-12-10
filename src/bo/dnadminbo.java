package bo;

import bean.dnadminbean;
import dao.dnadmindao;

public class dnadminbo {
	  dnadmindao dndao= new dnadmindao();
	  public dnadminbean ktdn(String tendn, String pass) {
		  return dndao.ktdn(tendn, pass);
	  }
}
