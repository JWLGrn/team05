package com.eeit147.groupfive.recipe.controller;



import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit147.groupfive.recipe.model.Campaign;
import com.eeit147.groupfive.recipe.model.CampaignDao;
import com.eeit147.groupfive.recipe.model.CampaignDto;
import com.eeit147.groupfive.recipe.model.Event;
import com.eeit147.groupfive.recipe.model.EventDao;
import com.eeit147.groupfive.recipe.model.EventDto;
import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.RecipeStepDao;
import com.eeit147.groupfive.users.model.Favorite;
import com.eeit147.groupfive.users.model.FavoriteDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;


@Controller
public class EventController {

	@Autowired
	private UsersDao uDao;
	@Autowired
	private RecipeDao rDao;
	@Autowired
	private EventDao eDao;
	@Autowired
	private CampaignDao cDao;
	@Autowired
	private FavoriteDao fDao;
	
	Integer userId=1;//管理員模式
	//Integer userId=3;//使用者模式
	Integer eventId=1;
	//活動主頁
	@GetMapping("/event/page")
	public String recipepage(Model m) {
		m.addAttribute("userId", userId);	
		//m.addAttribute("eventId",eventId);	//insert
		return "event";
	}
	//顯示食譜
	@ResponseBody
	@GetMapping("/event/showrecipe")
	public List<Recipe> recipeShow() {
		List<Recipe> recipe=rDao.findAllRecipeByUser(userId);
		return recipe;
	}
	//顯示活動
	@ResponseBody
	@GetMapping("/event/showevent")
	public List<Event> eventShow() {
		List<Event> allevent=eDao.findAll();		
		return allevent;
	}
	//修改
	@ResponseBody
	@PostMapping(value="/event/update", produces = { "application/json; charset=UTF-8" })
	public EventDto eventUpdate(@RequestBody Integer eventId, Model m){
		Optional<Event> e=eDao.findById(eventId);
		Event event=e.get();
		EventDto eventdto=new EventDto();
		eventdto.setEventId(event.getEventId());
		eventdto.setEventTitle(event.getEventTitle());
		eventdto.setEventContext(event.getEventContext());
		eventdto.setEventPhoto(event.getEventPhoto());
		eventdto.setTimeStart(event.getTimeStart().toString());
		eventdto.setTimeEnd(event.getTimeEnd().toString());
		return eventdto;
	}
	//新增活動
	@ResponseBody
	@PostMapping(value="/event/insert", produces = { "application/json; charset=UTF-8" })
	public List<Event> eventInsert(@RequestBody EventDto eventdto, Model m) throws Exception {
		boolean updatejudge=true;
		Event event=new Event();//建一個空的event
		Integer eventId=eventdto.getEventId();
		boolean update=true;//新增
		if(eventId==1) {   //新增時先存一次,取得id <新增時id設1>
				eDao.save(event);
				eventId=event.getEventId();
				update=false;//刪除

		}

		event.setEventId(eventId);
		event.setEventTitle(eventdto.getEventTitle());
		event.setEventContext(eventdto.getEventContext());
		//時間設定
		SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd");//設定格式
		Date datestart = dateParser.parse(eventdto.getTimeStart());
		Date dateend = dateParser.parse(eventdto.getTimeEnd());
		event.setTimeStart(datestart);
		event.setTimeEnd(dateend);
		//設定照片
System.out.println("@@@@"+eventdto.getEventPhoto());
		
		String imgPath="event"+eventId+".jpg";//路徑儲存
		
		if(eventdto.getEventPhoto()==null) {	
			if(update==false) {//新增
				imgPath="noimg.jpg";//預設圖片
			}
		}else{
			//存圖片
			String pfile=eventdto.getEventPhoto().substring(eventdto.getEventPhoto().indexOf(",") + 1);
			byte[] a = Base64.getDecoder().decode(pfile);
			FileOutputStream out = new FileOutputStream("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\event\\"+imgPath);
			out.write(a);
			out.close();
		}
		event.setEventPhoto(imgPath);
		eDao.save(event);//存檔
		//顯示
		List<Event> newEvent=eDao.findAll();		
		return newEvent;
		
	}
	@ResponseBody	@PostMapping(value="/event/delete", produces = { "application/json; charset=UTF-8" })
	public void eventDelete(@RequestBody Integer eventId, Model m){
		eDao.deleteById(eventId);

	}
	@ResponseBody	@PostMapping(value="/event/choice", produces = { "application/json; charset=UTF-8" })
	public Event eventchoice(@RequestBody Integer eventId, Model m){
		Optional<Event> e=eDao.findById(eventId);
		Event event=e.get();
	    return event;
	}
//Campaign
	@ResponseBody	@PostMapping(value="/event/participate", produces = { "application/json; charset=UTF-8" })
	public void participate(@RequestBody String recipelist, Model m){		
		String[] data=recipelist.replace("\"","").split("-");//切割字串,data[0]為eventId,data[n]為recipeId
		int eventId=Integer.parseInt(data[0]);
		Optional<Event> e=eDao.findById(eventId);
		Event event=e.get();
		for(int i=1;i<data.length;i++) {
			int recipeId=Integer.parseInt(data[i]);				
			Optional<Recipe> r=rDao.findById(recipeId);
			Recipe recipe=r.get();
			System.out.println(i+"_"+recipe.getRecipeId()+"_"+event.getEventId());
			Campaign campaign=new Campaign();
			campaign.setEvent(event);
			campaign.setRecipe(recipe);
			cDao.save(campaign);
		}	
	}
	@ResponseBody	@PostMapping(value="/event/participatecheck", produces = { "application/json; charset=UTF-8" })
	public boolean participateCheck(@RequestBody CampaignDto campaignDto,Model m){
		//System.out.println(campaignDto.getEventId());
		//System.out.println(campaignDto.getRecipeId());		
		Optional<Event> e=eDao.findById(campaignDto.getEventId());
		Event event=e.get();
		Optional<Recipe> r=rDao.findById(campaignDto.getRecipeId());
		Recipe recipe=r.get();
		boolean campaignslist=cDao.existsByEventAndRecipe(event, recipe);
		return campaignslist;
	}
//顯示參加活動的名單
		 
	 @GetMapping("/campaign/list/{eventId}")
	 public List<CampaignDto> campaignAlllist(@PathVariable("eventId") Integer eventId,Model m){
		 System.out.println(eventId);
		 Optional<Event> e=eDao.findById(eventId);
		 Event event=e.get();
		 List<CampaignDto> cDto=new ArrayList<CampaignDto>();
	     List<Campaign> campaignlist=cDao.findAllRecipeByEventId(eventId);
		 for(int i = 0; i < campaignlist.size(); i++) {
	          Integer resipeId=campaignlist.get(i).getRecipe().getRecipeId();
	          Optional<Recipe> r=rDao.findById(resipeId);
	          Recipe recipe=r.get();
	          CampaignDto campaigndto=new CampaignDto();
	          campaigndto.setCookTitle(recipe.getCookTitle());
	          campaigndto.setCookPhoto(recipe.getCookPhoto());
	          campaigndto.setUserName(recipe.getUserName()) ;
	          campaigndto.setUserPhoto(recipe.getUserPhoto());
	          //取得按讚數
	          Integer recipeOfFavorite=cDao.findFavoriteByRecipeId(resipeId);
	          System.out.println("aaa"+recipeOfFavorite);
	          campaigndto.setFavoritenum(recipeOfFavorite);
	          
	          cDto.add(campaigndto);
	     }
	
		 return cDto;		
	 }
//----------------------------------------------------------------------------------------------
	  
}
