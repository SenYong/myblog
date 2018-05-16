<?php
namespace app\index\controller;
use app\index\model\ArticleModel;
use think\Controller;

class Article extends Controller
{
    /*
     * 技术文章
     */
    public function getArtList(){
       if(request()->isPost()){
         $num = input('param.num');
         $page = input('param.page');
         $art = new ArticleModel();
         $data = $art->getArtList($num, $page);
         $total = $art->artNum();
         if(is_array($data)){
           return json(['errcode'=>0, "msg"=>"查询成功", "data"=>$data, "total"=>$total]);
         }else{
           return json(['errcode'=>2, "msg"=>"查询失败"]);
         }
       }else{
         return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
    }  

    /*
     * 技术文章分类
     */
    public function artCatList(){
       if(request()->isPost()){
         $id = input('param.id');
         $num = input('param.num');
         $page = input('param.page');
         $art = new ArticleModel();
         $data = $art->artCatList($id,$num,$page);
         if(is_array($data)){
           return json(['errcode'=>0, "msg"=>"查询成功", "data"=>$data]);
         }else{
           return json(['errcode'=>2, "msg"=>"查询失败"]);
         }
       }else{
         return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
    }

    /*
     * 获取最新文章评论
     */
    public function newArtComment(){
      if(request()->isPost()){
        $art = new ArticleModel();
        $data = $art->newComment();
        if(is_array($data)){
          return json(['errcode'=>0, "msg"=>"成功", "data"=>$data]);
        }else{
          return json(['errcode'=>2, "msg"=>"失败"]);
        }
      }else{
        return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
      }
    }
}