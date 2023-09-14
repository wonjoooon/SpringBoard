package com.wonjun.controller;

import com.mysql.cj.protocol.x.Notice;
import com.wonjun.model.NoticeboardDto;
import com.wonjun.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/api")
public class RestSvcController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private NoticeboardDto noticeboardDto;

    @GetMapping("/hello")
    public String hello() {
        return "Hello, world!!";
    }

    @GetMapping("/article/{num}")
    public NoticeboardDto getArticle(@PathVariable("num") int articleNo) {
        noticeboardDto = boardService.viewArticle(articleNo);
        return noticeboardDto;
    }

    @GetMapping({"/list"})
    public List<NoticeboardDto> getArticleList(){
        return boardService.listArticles();
    }
}
