package com.wonjun.config;

import com.wonjun.controller.BoardController;
import com.wonjun.controller.RestSvcController;
import com.wonjun.model.BoardDao;
import com.wonjun.model.NoticeboardDto;
import com.wonjun.service.BoardService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BoardConfig {
    @Bean
    public NoticeboardDto noticeboardDto(){
        return new NoticeboardDto();
    }

    @Bean
    public BoardDao boardDao() {
        return new BoardDao();
    }

    @Bean
    public BoardService boardService() {
        return new BoardService();
    }

    @Bean
    public BoardController boardController() {
        return new BoardController();
    }

    @Bean
    public RestSvcController restSvcController(){
        return new RestSvcController();
    }
}
