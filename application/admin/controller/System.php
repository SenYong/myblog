<?php
  /**
 * Created by PhpStorm.
 * User: root
 * Date: 18-2-06
 * Time: 下午18:00
 */
 namespace app\admin\controller;
 use app\admin\model\SystemModel;
 use think\Controller;

 /**
 * 系统设置 
 */
 class System extends Controller
 {
     /*
     * 图片上传
     */
    public function uploadImg(){
        if(request()->isPost()){
            $file = input('param.image');
            $url = explode(",", $file);
            strpos($url[0], 'png') ? $filename = md5(time()) . '.png' : $filename = md5(time()) . '.jpg';
            $imgurl = '/public/static/systemImg/' . $filename;
            $filepath = ROOT_PATH . $imgurl;
            $url[1] = base64_decode(str_replace(" ", "+",$url[1]));
            if(file_put_contents($filepath,$url[1])){
               return json(['errcode'=>0, "msg"=>"图片上传成功", "filepath"=>$imgurl]);
            }else{
               return json(['errcode'=>2, 'msg'=>'图片上传失败']);
            }
        }else{
            return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
    }
   
    /*
     * 添加系统设置
     */
    public function addSystem(){
       if(request()->isPost()){ 
         $data = input('param.');
         $system = new SystemModel();
         if($system->addSystem($data)){
            return json(['errcode'=>0, "msg"=>"添加成功"]);
         }else{
            return json(['errcode'=>2, "msg"=>"添加失败"]);    
         }
       }else{
         return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
    }

    /*
     * 获取系统设置列表
     */
    public function getSystemList(){
        if(request()->isPost()){
            $system = new SystemModel();
            $data = $system->selectSystem();
            if($data != null){
               return json(['errcode'=>0, 'msg'=>'获取成功', 'data'=>$data]);
            }else{
               return json(['errcode'=>2, 'msg'=>'获取失败']);
            }
        }else{
            return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
        }
    }

    /*
     * 获取设置详情
     */
    public function getOneSystem(){
        if(request()->isPost()){
            $id = input('param.id');
            $system = new SystemModel();
            $info = $system->getOne($id);
            if($info){
               return json(['errcode'=>0, "msg"=>"获取详情成功", 'data'=>$info]);
            }else{
               return json(['errcode'=>2, "msg"=>'获取详情失败']);
            }
        }else{
            return json(['error'=>1, "msg"=>"提交方式不正确"]);
        }
    }

    /*
     * 修改系统详情
     */
    public function updateSystem(){
        if(request()->isPost()){
           $data = input('param.');
           $system = new SystemModel();
           if($system->updateSystem($data)){
             return json(['errcode'=>0, 'msg'=>'修改系统设置成功']);
           }else{
             return json(['errcode'=>2, 'msg'=>'修改系统设置失败']);
           }
        }else{
           return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
        }
    }

    /*
     * 删除详情
     */
    public function delSystem(){
        if(request()->isPost()){
            $id = input('param.id');
            $system = new SystemModel();
            if($system->delSystem($id)){
                return json(['errcode'=>0, 'msg'=>'删除成功']);
            }else{
                return json(['errcode'=>2, 'msg'=>'删除失败']);
            }
        }else{
            return json(['errcode'=>1, "msg"=>'提交方式不正确']);
        }
    }
 }
?>