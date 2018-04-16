package kr.co.bit.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.handler.Command;

public class HandlerController extends HttpServlet {

	private HashMap<String, Command> map;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		map = new HashMap<String, Command>();
		String path = getServletContext().getRealPath("WEB-INF/file/commandList.txt");
		File file = new File(path);
		FileReader fr = null;
		BufferedReader br = null;
		String line = null;
		try {
			fr = new FileReader(file);
			br = new BufferedReader(fr);
			while ((line = br.readLine()) != null) {
			System.out.println(line);
			String[]temp=line.split("=");
			Object obj=Class.forName(temp[1]).newInstance(); //새로운 객체 생성 
			Command cmd=(Command)obj;
			map.put(temp[0], cmd);
			}
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String url = req.getServletPath();// 위에서 저장한 key값 /search.do
		System.out.println("in " + url);
        Command cmd=map.get(url); //key 값으로 get haspmap에서 꺼내는거 
     
        String toUrl=cmd.process(req);
	    RequestDispatcher rd=req.getRequestDispatcher(toUrl);
	    rd.forward(req, resp);
	    
	}

}
