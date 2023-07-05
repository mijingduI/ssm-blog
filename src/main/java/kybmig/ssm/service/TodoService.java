package kybmig.ssm.service;


import com.mysql.cj.jdbc.MysqlDataSource;
import kybmig.ssm.Utility;
import kybmig.ssm.mapper.TodoMapper;
import kybmig.ssm.model.ModelFactory;
import kybmig.ssm.model.TodoModel;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class TodoService {
    private TodoMapper mapper;
    
    public TodoService(TodoMapper todoMapper) {
        this.mapper = todoMapper;
    }
    
    public TodoModel add(String content) {
        TodoModel m = new TodoModel();
        m.setContent(content);
        Utility.log("mapper add before <%s>", m);
        mapper.insertTodo(m);
        Utility.log("mapper add after <%s>", m);
        return m;
    }
    
    public  void update(Integer id, String content) {
        TodoModel m = new TodoModel();
        m.setId(id);
        m.setContent(content);
        mapper.updateTodo(m);
    }
    
    public void delete(Integer id) {
        mapper.deleteTodo(id);
    }

    public  TodoModel findById(Integer id) {
        return mapper.selectTodo(id);
    }
    
    public  List<TodoModel> all() {
        return mapper.selectAllTodo();
    }
}
