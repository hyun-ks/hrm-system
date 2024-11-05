package com.hrm.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApprovalController {
	@RequestMapping("/approval/list")
    public String showApprovalListForm() {
        return "/approval/list";
    }
	@RequestMapping("/approval/request")
    public String showApprovalRequestForm() {
        return "/approval/request";
    }

}
