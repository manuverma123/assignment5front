package com.nagarro.training.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nagarro.training.entity.Author;
import com.nagarro.training.entity.User;
import com.nagarro.training.services.Service;


@Controller
public class BookManagementController {
	@Autowired
	private Service service;

	
	@RequestMapping("/login")
	public ModelAndView add(@RequestParam("uname")String name,@RequestParam("pass") String pass,HttpServletRequest request,HttpServletResponse response) {
		
		
		boolean k=this.service.checkUnameAndPass(name, pass);
		ModelAndView mView=new ModelAndView();
		if(!k) {
			
			  List<Author> tlist=service.findAll();
			  
			  HttpSession newSession = request.getSession();
	          newSession.setAttribute("user", name);
	          
	          mView.addObject("books", tlist);
				
		mView.setViewName("home");
		
		}
		else {
			mView.setViewName("login");
			mView.addObject("message","Invalid Credentials");
		}
		return mView;
	}
	@RequestMapping("/register")
	public ModelAndView register(@RequestParam("newUname")String uname,@RequestParam("newPass")String nPass,
			@RequestParam("conPass")String conPass,HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mView=new ModelAndView();
		User user=new User();
		user.setUsername(uname);
		user.setPassword(nPass);
		
		
		
		boolean k2=this.service.checkUname(uname, nPass);
		if(k2) {
		mView.addObject("message", "Registered Succesfully");
		this.service.addUser(user);
		}
		else if(!(nPass.equals(conPass))) {
			mView.addObject("message","Passwords Don't Match");
		}
		else {
			mView.addObject("message","username alredy present, create another username");
		}
		mView.setViewName("register");
		
		return mView;
	}
	
	@RequestMapping("/add")
	public ModelAndView add(@RequestParam("code")String id,@RequestParam("bookName")String bName,
			@RequestParam("bookAuthor")String author) {
		ModelAndView mView=new ModelAndView();
		 Author author2=  this.service.findAuthor(Integer.parseInt(id));
		 if(author2!=null) {
		this.service.addBook(id,bName,author);
		
		List<Author> tlist=service.findAll();
		mView.addObject("books", tlist);
		mView.setViewName("home");
		}
		 else {
			 mView.addObject("error","Book code is already taken, give unique code");
			 mView.setViewName("add");
		 }
		 
		return mView;
	}
	@RequestMapping("/Cancel")
	public ModelAndView cancel() {
		ModelAndView mView=new ModelAndView();
		List<Author> tlist=service.findAll();
		mView.addObject("books", tlist);
		mView.setViewName("home");
		return mView;
	}
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public ModelAndView update(@RequestParam("id")String id,@RequestParam("upAuthor")String author,
			@RequestParam("upBook")String book) {
		Author author2=this.service.findAuthor(Integer.parseInt(id));
		author2.setAuthor(author);
		author2.setBook(book);
		this.service.updateBook(author2);
		ModelAndView mView=new ModelAndView();
		List<Author> tlist=service.findAll();
		mView.addObject("books", tlist);
		mView.setViewName("home");
		return mView;
	}
	
	@GetMapping("/Edit")
	public ModelAndView edit(@RequestParam("id") int id) {
		Author author= this.service.findAuthor(id);
		ModelAndView mView=new ModelAndView();
		mView.addObject("books",author);
		mView.setViewName("edit");
		return mView;
	}
	@GetMapping("/Delete")
	public ModelAndView delete(@RequestParam("id")int id) {
		Author author=this.service.findAuthor(id);
		this.service.deleteBook(author);
		ModelAndView mView=new ModelAndView();
		List<Author> tlist=service.findAll();
		mView.addObject("books", tlist);
		mView.setViewName("home");
		return mView;
	}
	
	
	
	
	@RequestMapping("/logout")
    public String logout(HttpSession session ) {
		session.removeAttribute("user");
       session.invalidate();
       
       return "login";
    }
}
