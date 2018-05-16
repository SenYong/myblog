<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-16
 * Time: 下午5:41
 */
  namespace app\admin\controller;
  use app\admin\model\CatModel;
  use think\Controller;

  class Cat extends Controller{
      /*
       * 获取栏目
       */
      public function getCat(){
         if(request()->isPost()){
             $catModel = new CatModel();
             $result = $catModel->getCat();
             return json(["errcode"=>0, "msg"=>"成功", "data"=>$result]);
         }else{
             return json(["errcode"=>1, "msg"=>"提交方式不正确"]);
         }
      }
      
      /* 
       * 新增栏目
       */
      public function addCat(){
        if(request()->isPost()){
           $data = input('param.');
           $data['c_system'] = 'Win7';
           $data['c_ip'] = request()->ip();
           $catModel = new CatModel();
           if($catModel->addCat($data)){
             return json(['errcode'=>0, "msg"=>"新增栏目成功"]);
           }else{
             return json(['errcode'=>2, "msg"=>"新增栏目失败"]);
           }
        }else{
           return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
      } 

      /* 
       * 获取所有栏目
       */
      public function selectCat(){
        if(request()->isPost()){
          $catModel = new CatModel();
          $data = $catModel->selectCat();
          if($data != null){
            return json(['errcode'=>0, "msg"=>"获取成功", "data"=>$data]);
          }else{
            return json(['errcode'=>2, "msg"=>"获取失败"]);
          }
        }else{
          return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
      }

      /*
       * 获取指定id栏目 
       */
      public function getOneCat(){
        if(request()->isPost()){
          $id = input('param.id');
          $catModel = new CatModel();
          $data = $catModel->getOneCat($id);
          if($data){
            return json(['errcode'=>0, "msg"=>"获取成功", "data"=>$data]);
          }else{
            return json(['errcode'=>2, "msg"=>"获取失败"]);
          }
        }else{
          return json(["errcode"=>1, "msg"=>"提交方式不正确"]);
        }
      }

      /*
       * 删除指定id的栏目
       */
      public function deleteCat(){
        if(request()->isPost()){
          $id = input('param.id');
          $catModel = new CatModel();
          if($catModel->delCat($id)){
             return json(['errcode'=>0, "msg"=>"删除成功"]);
          }else{
             return json(['errcode'=>2, "msg"=>"删除失败"]);
          }
        }else{
          return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
      }
  }