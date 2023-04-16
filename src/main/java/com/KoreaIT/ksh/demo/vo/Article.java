package com.KoreaIT.ksh.demo.vo;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.Data;

@Controller
public class Article {
	
	private int id;
	private LocalDateTime regDate;
	private LocalDateTime updateDate;
	private String title;
	private String body;
	
}