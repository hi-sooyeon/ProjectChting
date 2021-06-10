package com.team1.chting.service;

import com.sun.tools.javac.main.OptionHelper;
import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.PostDto;
import com.team1.chting.utils.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class GroupService {

    @Autowired
    private SqlSession sqlsession;



//    @Override
//    public List<GroupDto> listAll() throws Exception{
//        return sqlsession.selectList("board.listAll");
//    }

    // 내가가입한모임 - 게시글 리스트
    public List<PostDto> getPostList(){
        List<PostDto> postlist = new ArrayList<PostDto>();
        GroupDao groupDao = sqlsession.getMapper(GroupDao.class);
        postlist = groupDao.getPostList();
        return postlist;
    }


    // 게시판 글쓰기
    public void postWrite(PostDto postDto){

    }

    public List<GroupDto> randomGroup() {
        List<GroupDto> list = new ArrayList<GroupDto>();
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        list = dao.randomGroup();
        return list;
    }

    public List<GroupDto> areaGroup(String first_area, String second_area) {
        List<GroupDto> list = new ArrayList<GroupDto>();
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        list = dao.areaGroup(first_area,second_area);
        return list;
    }

    public List<GroupDto> catecodeGroup(String userid) {
        List<GroupDto> list = new ArrayList<GroupDto>();
        GroupDao dao = sqlsession.getMapper(GroupDao.class);
        list = dao.catecodeGroup(userid);
        return list;
    }

}
