package com.eeit147.groupfive.recipe.controller;



import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Event;
import com.eeit147.groupfive.recipe.model.EventDao;
import com.eeit147.groupfive.recipe.model.EventDto;
import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.RecipeStep;
import com.eeit147.groupfive.recipe.model.RecipeStepDao;
import com.eeit147.groupfive.recipe.service.RecipeService;
import com.eeit147.groupfive.recipe.service.RecipeSteptService;
import com.eeit147.groupfive.users.model.Reply;
import com.eeit147.groupfive.users.model.ReplyDto;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;


@Controller
public class EventController {

	@Autowired
	private UsersDao uDao;
	@Autowired
	private RecipeDao rDao;
	@Autowired
	private RecipeStepDao rsDao;
	@Autowired
	private EventDao eDao;
	
	Integer userId=1;//管理員模式
	//Integer userId=3;//使用者模式
	//Integer eventId=1;
	//主頁
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

		Event event=new Event();//建一個空的event
		Integer eventId=eventdto.getEventId();
		if(eventId==1) {   //新增時先存一次,取得id <新增時id設1>
			eDao.save(event);
			eventId=event.getEventId();
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
		String imgPath="event"+eventId+".jpg";//路徑儲存
		if(eventdto.getEventPhoto()==null) {
			imgPath="noimg.jpg";//預設圖片
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
}
