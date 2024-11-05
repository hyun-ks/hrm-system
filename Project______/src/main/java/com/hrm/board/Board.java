package com.hrm.board;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int num;
    private int userid;
    private String title;
    private String content;
    private Date regdate;
    private int readcount;
    private String keyword;
	private String type;
}