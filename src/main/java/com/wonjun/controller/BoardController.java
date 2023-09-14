package com.wonjun.controller;

import com.wonjun.model.NoticeboardDto;
import com.wonjun.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {
    Logger logger = LoggerFactory.getLogger("com.wonjun.controller.BoardController");
    @Autowired
    private BoardService boardService;
    @Autowired
    private NoticeboardDto noticeboardDto;

    @RequestMapping({"/list", "/"})
    public String getArticleList(Model model) {
        List<NoticeboardDto> articleList = boardService.listArticles();
        model.addAttribute("dataList", articleList);
        return "list";
    }

    @GetMapping("/add")
    public String writeArticle() {
        return "write";
    }

    @PostMapping("/addarticle")
    public String addArticle(@RequestParam(value = "i_title") String title,
                             @RequestParam(value = "i_content") String content) {
        noticeboardDto.setTitle(title);
        noticeboardDto.setContent(content);
        noticeboardDto.setWrite_id("admin");
        // DB에 저장하는 서비스 호츌
        boardService.addArticle(noticeboardDto);
        return "redirect:list";
    }

    @GetMapping("/view")
    public ModelAndView viewArticle(@RequestParam(value = "no") String articleNo) {
        logger.debug("=====L=O=G=G=E=R===T=E=S=T=====>>  " + articleNo);
        noticeboardDto = boardService.viewArticle(Integer.parseInt(articleNo));
        ModelAndView mv = new ModelAndView();
        mv.setViewName("view");
        mv.addObject("article", noticeboardDto);
        return mv;
    }

    @PostMapping("/edit")
    public String editArticle(@RequestParam(value = "articleNo") String articleNo,
                              @RequestParam(value = "title") String title,
                              @RequestParam(value = "content") String content,
                              RedirectAttributes attr) {
        noticeboardDto.setArticle_no(Integer.parseInt(articleNo));
        noticeboardDto.setTitle(title);
        noticeboardDto.setContent(content);
        boardService.editArticle(noticeboardDto);
        attr.addAttribute("no", articleNo); // view 에 no 번호 넘겨줌
        return "redirect:view";
    }

    @PostMapping("/delete")
    public String deleteArticle(@RequestParam(value = "articleNo") String articleNo) {
        noticeboardDto.setArticle_no(Integer.parseInt(articleNo));
        boardService.deleteArticle(noticeboardDto);
        return "redirect:list";
    }

    @GetMapping("/info")
    @ResponseBody
    public Map<String, String> getInfo() {
        Map<String, String> map = new HashMap<>();

        map.put("name", "sku Project");
        map.put("version", "1.0");
        map.put("author", "WONJUN");
        return map;
    }
}
