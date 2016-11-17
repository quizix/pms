import java.util.Date;

import com.pms.utils.TimeUtil;

public class Application {

	public static void main(String[] args){
		Date date = TimeUtil.getNormalizedDate(new Date());
		
		System.out.println(date);
	}
}
