package com.dxw.pms.dal;

import java.util.Date;
import java.util.List;
import com.dxw.pms.models.ShedLog;

public interface ShedLogDao {
	List<ShedLog> findByShedId(Long id);
	
	ShedLog findByShedIdAndDate(Long shedId, Date date);

	void addOrUpdate(ShedLog shedLog);
	
	void add(ShedLog shedLog);
}
