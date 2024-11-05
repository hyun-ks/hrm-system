package com.hrm.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	@RequestMapping("/info/profile")
    public String showInfoProfileForm() {
        return "/info/profile";
    }
	@RequestMapping("/info/edit")
    public String showInfoEditForm() {
        return "/info/edit";
    }
	@RequestMapping("/info/updateUserInfo")
	public String showInfoupdateUserInfoForm() {
		return "/info/updateUserInfo";
	}

}
