package kybmig.ssm.service;


import kybmig.ssm.model.ModelFactory;
import kybmig.ssm.model.WeiboModel;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class WeiboService {
    public WeiboModel add(String content) {
        WeiboModel m = new WeiboModel();
        m.setContent(content);
        m.setUserId(-1);

        ArrayList<WeiboModel> ms = load();
        if (ms.size() == 0) {
            m.setId(1);
        } else {
            m.setId(ms.get(ms.size() - 1).getId() + 1);
        }
        
        ms.add(m);
        save(ms);
        return m;
    }


    public  void update(Integer id, String content) {
        ArrayList<WeiboModel> ms = load();
        for (int i = 0; i < ms.size(); i++) {
            WeiboModel e = ms.get(i);
            if (e.getId().equals(id)) {
                e.setContent(content);
            }
        }
        save(ms);
    }


    public void deleteById(Integer id) {
        ArrayList<WeiboModel> ms = load();

        for (int i = 0; i < ms.size(); i++) {
            WeiboModel e = ms.get(i);
            if (e.getId().equals(id)) {
                ms.remove(e);
            }
        }
        save(ms);
    }


    public  WeiboModel findById(Integer id) {
        ArrayList<WeiboModel> ms = load();
        for (int i = 0; i < ms.size(); i++) {
            WeiboModel e = ms.get(i);
            if (e.getId().equals(id)) {
                return e;
            }
        }
        return null;
    }


    public  ArrayList<WeiboModel> all() {
        return load();
    }

    public ArrayList<WeiboModel> load() {
        String className = WeiboModel.class.getSimpleName();

        ArrayList<WeiboModel> ms = ModelFactory.load(className, 3, modelData -> {
            Integer id = Integer.valueOf(modelData.get(0));
            String content = modelData.get(1);
            Integer userId = Integer.valueOf(modelData.get(2));

            WeiboModel m = new WeiboModel();
            m.setId(id);
            m.setContent(content);
            m.setUserId(userId);
            return m;
        });
        return ms;
    }

    public static void save(ArrayList<WeiboModel> list) {
        String className = WeiboModel.class.getSimpleName();
        ModelFactory.save(className, list, model -> {
            ArrayList<String> lines = new ArrayList<>();
            lines.add(model.getId().toString());
            lines.add(model.getContent());
            lines.add(model.getUserId().toString());
            return lines;
        });
    }
}
