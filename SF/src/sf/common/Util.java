package sf.common;

import org.json.JSONException;
import org.json.JSONObject;

import sf.pojo.Info;

public class Util {

	public static JSONObject convertObjectToJSONObject(Info info) {
		JSONObject json = new JSONObject();		
		try {
			json.accumulate("id", info.getId());
			json.accumulate("serverName", info.getServerName());
			json.accumulate("serverIP", info.getServerIP());
			json.accumulate("timeText", info.getTimeText());
			json.accumulate("website", info.getWebsite());
			json.accumulate("serviceQQ", info.getServiceQQ());
			json.accumulate("versionDesc",info.getVersionDesc());
			json.accumulate("areaLine", info.getAreaLine());
			json.accumulate("type", info.getType());
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return json;
	}
	
}
