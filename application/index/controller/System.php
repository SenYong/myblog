<?php
namespace app\index\controller;
use app\index\model\SystemModel;
use think\Controller;
use think\File;

class System extends Controller
{
   /*
    *  个人信息
    */
   public function getInfo(){
      if(request()->isPost()){ 
        $system = new SystemModel();
        $data = $system->getInfo();
        if(is_array($data)){
           return json(['errcode'=>0, "msg"=>"获取个人信息成功", 'data'=>$data]);
        }else{
           return json(['errcode'=>2, "msg"=>"获取个人信息失败"]);
        }
      }else{
        return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
      }
   }

   /*
    * 浏览量增加
    */
   public function addAboutHit(){
      if(request()->isPost()){
        $id = input('param.id');
        $system = new SystemModel();
        if($system->addHit($id)){
           return json(['errcode'=>0, "msg"=>"成功"]);
        }else{
           return json(['errcode'=>2, "msg"=>"失败"]);
        }
      }else{
        return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
      }
   }

   public function getUsers(){
      $data = input('param.');
      $file = request()->file('name');
      if($file != null){
        $imgurl = '/public/uploadImg/';
        $filepath = ROOT_PATH . $imgurl;
        $info = $file->move($filepath);
        return json(['errcode'=>0, 'info'=>$info->getSaveName()]);
      }else{
        return json(['errcode'=>1]);
      }
      
   }
}
