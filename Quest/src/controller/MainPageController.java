package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import service.IQuestService;


@Controller
public class MainPageController {
	@Autowired
	IQuestService service;
}
