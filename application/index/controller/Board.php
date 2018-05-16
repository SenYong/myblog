<?php
namespace app\index\controller;
use app\index\model\BoardModel;
use think\Controller;

class Board extends Controller
{
  /*
   * 用户留言
   */
  public function userBoardComment(){
    if(request()->isPost()){
      $data = input('param.');
      $data['b_time'] = time();
      $data['b_ip'] = request()->ip();
      $url='http://ip.taobao.com/service/getIpInfo.php?ip='.$data['b_ip'];
      $result = json_decode(file_get_contents($url),true);
      if($result['code'] == 0){
        $data['b_city'] = $result['data']['city'];
      }
      $data['b_system'] = 'win7';
      $board = new BoardModel();
      if($board->addComment($data)){
        return json(['errcode'=>0, "msg"=>"留言成功"]);
      }else{
        return json(['errcode'=>2, "msg"=>"留言失败"]);
      }
    }else{
      return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
    }
  }
  /*
    * 获取留言板评论
    */
  public function getUserComment(){
     if(request()->isPost()){
        $board = new BoardModel();
        $data = $board->getUserList();
        if(is_array($data)){
          return json(['errcode'=>0, "msg"=>"获取成功", 'data'=>$data]);
        }else{
          return json(['errcode'=>2, "msg"=>"获取失败"]);
        }
     }else{
        return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
     }
   }
}
