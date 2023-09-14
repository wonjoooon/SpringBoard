package com.wonjun.service;

import com.wonjun.model.BoardDao;
import com.wonjun.model.NoticeboardDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BoardService {
    @Autowired
    private BoardDao boardDao;

    public List<NoticeboardDto> listArticles(){
        return boardDao.selectAllArticles();
    }

    public void addArticle(NoticeboardDto article) {
        // DB에 저장하는 DAO 메소드 호출
        boardDao.insertArticle(article);
    }

    public NoticeboardDto viewArticle(int articleNo) {
        return boardDao.selectArticle(articleNo);
    }

    public void editArticle(NoticeboardDto article) {
        boardDao.updateArticle(article);
    }

    public void deleteArticle(NoticeboardDto article){
        boardDao.deleteArticle(article);
    }

}
