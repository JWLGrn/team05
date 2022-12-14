package com.eeit147.groupfive.controller;



import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.cfg.annotations.MapKeyColumnDelegator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eeit147.groupfive.admin.service.FoodsService;
import com.eeit147.groupfive.recipe.model.Foods;
import com.eeit147.groupfive.recipe.model.FoodsDao;
import com.eeit147.groupfive.recipe.model.Keyword;
import com.eeit147.groupfive.recipe.model.KeywordDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Controller
public class PageController {
	@Autowired
	private FoodsDao fDao;
	@Autowired
	private UsersDao uDao;
	@Autowired
	private KeywordDao kDao;
	

@Autowired
private FoodsService fService;

	// 首頁
	@GetMapping("/")
	public String goIndex() {
		return "index";
	}

	// 新增使用者
	@GetMapping("/Users")
	public String UsersIndex() {
		return "login/Usersindex";
	}

	// 驗證信
	@GetMapping("/setGmail")
	public String FindAllUsersById() {
		return "email/sendmail";
	}

	// 新增食譜(測試用)
	@GetMapping("/addpage")
	public String goAddRecipe() {
		return "test/addRecipeTest";
	}

	
	//新增食材
	@GetMapping("/addfoods")
	public String addFoods(Model model) {
		Foods food = new Foods(); 
		model.addAttribute("addfoodsAttribute", food);
		return "addfoods";
		}
	
	
		//顯示使用者
		@GetMapping("/showAllUsers")
		public String showAllUsers(Model model) {
			model.addAttribute("allUsers",uDao.findAll() );
			return "showAllUsers";
		}
		
		//食材列表分頁
		@GetMapping("/showAllFoods")
		public String viewFoodsPage(@RequestParam(name="p",defaultValue = "1") Integer pageNumber, Model model) {
			Set<String> data = new LinkedHashSet<String>(); 
			 List<Foods> foods=fDao.findAll();
			for(Foods food : foods ) { 
			 data.add(food.getFoodsType()); 
			}
			model.addAttribute("option", data);
			Page<Foods> page = fService.findByPage(pageNumber);
			model.addAttribute("page", page);
			return "showAllFoods";
		}	
		
		// 後台首頁
		@GetMapping("/adminIndex")
		public String goAdminIndex() {
			return "adminIndex";
		}
		
	//測試查詢頁面
	@GetMapping("/searchpage")
	public String searchpage() {
		return  "test/searchTest";
		
	}
	
	//測試按讚頁面
	@GetMapping("/favorpage")
	public String favorpage() {
		return "test/favorTest";
	}
	//測試登入頁面
	@GetMapping("/loginpage")
	public String login() {
		return "redirect:/user/login";
	}
	//測試追蹤頁面
	@GetMapping("/followpage")
	public String follow() {
		return "test/followTest";
	}
	
	//前往分類頁面
	@GetMapping("/categorypage")
	public String goToCategory(Model m) {
		List<Keyword> category = kDao.findAll();
		m.addAttribute(category);
		return "test/categoryPageTest";
	}	
	@GetMapping("/posts")
	public String goPostPage() {
		return "createpost";
	}
	//chart.js報表分析長條圖
	@GetMapping("/testchart")
	public String chartJs() {
		return "testchartjs";
	}
	@GetMapping("/collectpage")
	public String collectPage() {
		return "test/collectTest";
	}
	//chart.js報表分析圓餅圖
	@GetMapping("/testchart02")
	public String chartJs02() {
		return "testchartjss";
	}
	//管理者回覆檢舉
	@GetMapping("/adminReport")
	public String adminReport() {
		return "test/adminreport";
	}
	@GetMapping("/insertrecipe")
	public String insertrecipe() {
		return "insertrecipe";
	}
	//綠界測試
	@GetMapping("/testecPay")
	public String ecPay() {
		return "testecpay";
	}
	//活動個人
	@GetMapping("/showevent")
	public String eventshow(Model m) {
		
		
		return "eventshow";
	}
	//個人頁面資料呈現
	@GetMapping("/shownumberuser")
	public String showNumber() {
		return "user/shownumber";
	}
	//活動管理員
	@GetMapping("/showallevent")
	public String showallevent(Model m) {
		Integer userId=3;
		m.addAttribute("userId", userId);
		return "showAllEvent";
	}
	
		@GetMapping("/aboutus")
		public String showaboutus () {
			return "aboutus/aboutus";
			
		}
	
	//管理食譜分類頁面
	@GetMapping("/showAllKeywords")
	public String showAllKeywords(Model m) {
		List<Keyword> kList = kDao.findAll();
		m.addAttribute("allKeywords", kList);
		return "showAllKeywords";
	}
		
	//管理食譜分類頁面
	@GetMapping("/addkeyword")
	public String addkeyword() {
		return "addkeyword";
		
	}
	
	@GetMapping("/websocket")
	public String websocketMessage() {
		return "socket/chat";
	}
}
