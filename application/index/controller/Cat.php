<?php
namespace app\index\controller;
use app\index\model\CatModel;
use think\Controller;

class Cat extends Controller
{
    /*
     * 获取栏目
     */
    public function getCat(){
       if(request()->isPost()){
          $log = new CatModel();
          $data = $log->getCat();
          if(is_array($data)){
             return json(['errcode'=>0, 'msg'=>'栏目获取成功', 'data'=>$data]); 
          }else{
             return json(['errcode'=>2, 'msg'=>'栏目获取失败']); 
          }
       }else{
          return ['errcode'=>1, "msg"=>'提交方式不正确'];
       }
    }  
}