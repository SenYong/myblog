<?php
  /**
 * Created by PhpStorm.
 * User: root
 * Date: 18-2-1
 * Time: 下午3:40
 */
 namespace app\admin\controller;
 use app\admin\model\BoardModel;
 use think\Controller;

 class Board extends Controller
 {
    
    /*
     * 获取日志评论列表
     */
    public function getBoardComment(){
      if(request()->isPost()){
        $board = new BoardModel();
        $data = $board->getBoardComment();
        if($data != null){
          return json(['errcode'=>0, 'msg'=>'获取成功', 'data'=>$data]);
        }else{
          return json(['errcode'=>2, "msg"=>"获取失败"]);
        }
      }else{
        return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
      }
    }

    /*
      * 获取单个用户评论
      */
     public function getOneBoardComment(){
        if(request()->isPost()){
           $id = input('param.id');
           $artc = new BoardModel();
           $data = $artc->getOneBoardComment($id);
           if($data){
              return json(['errcode'=>0, "msg"=>"获取成功", 'data'=>$data]);
           }else{
              return json(['errcode'=>2, "msg"=>"获取失败"]);
           }
        }else{
           return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
     }

     /*
      * 留言板回复
      */
    public function replyBoard(){
       if(request()->isPost()){
          $data = input('param.');
          $board = new BoardModel();
          if($board->replyBoards($data)){
            return json(['errcode'=>0,"msg"=>"回复成功"]);
          }else{
            return json(['errcode'=>2, 'msg'=>'回复失败']);
          }
       }else{
          return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
       }
    }
 }
?>


