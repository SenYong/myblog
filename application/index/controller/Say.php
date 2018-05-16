<?php
namespace app\index\controller;
use app\index\model\SayModel;
use app\index\model\SayCModel;
use think\Controller;

class Say extends Controller
{
    /*
     * 最新日志
     */
    public function newSay(){
       if(request()->isPost()){
          $log = new SayModel();
          $data = $log->newSay();
          if(is_array($data)){
             return json(['errcode'=>0, 'msg'=>'最新说说成功', 'data'=>$data]);
          }else{
             return json(['errcode'=>0, 'msg'=>'最新说说失败']);
          }  
       }else{
          return ['errcode'=>1, "msg"=>'提交方式不正确'];
       }
    }  

    /*
     * 获取说说列表
     * @ $num: 起始位置, $page: 每次获取数量
     */
    public function getSayList(){
      if(request()->isPost()){
         $num = input('param.num');
         $page = input('param.page');
         $say = new SayModel();
         $data = $say->selectSay($num,$page);
         $total = $say->sayNum();
         if(is_array($data)){
            return json(['errcode'=>0, "msg"=>"获取成功", "data"=>$data, "total"=>$total]);
         }else{
            return json(['errcode'=>2, "msg"=>"获取失败"]);
         }
      }else{
         return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
      }
    }
    
    /*
     * 说说详情
     * @ id: 说说ID
     */
    public function sayDetail(){
      if(request()->isPost()){
        $id = input('param.id');
        $say = new SayModel();
        $data = $say->sayDetail($id);
        if($data){
          return json(['errcode'=>0, "msg"=>"查询成功", 'data'=>$data]);
        }else{
          return json(['errcode'=>2, "msg"=>"查询失败"]);
        }
      }else{
        return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
      }
    }

    /*
     * 上一条说说
     */
    public function prevSay(){
       if(request()->isPost()){
         $id = input('param.id');
         $say = new SayModel();
         $data = $say->prevSay($id);
         return json(['errcode'=>0, "msg"=>"查询上一条说说成功", "data"=>$data]);
       }else{
         return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
    }

    /*
     * 下一条说说
     */
    public function nextSay(){
      if(request()->isPost()){
         $id = input('param.id');
         $say = new SayModel();
         $data = $say->nextSay($id);
         return json(['errcode'=>0, "msg"=>"查询下一条说说成功", "data"=>$data]);
      }else{
         return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
      }
    }
    
    /*
     * 获取指定Id的所有用户评论
     */
    public function getAllSayUser(){
      if(request()->isPost()){
        $id = input('param.id');
        $sayc = new SayCModel();
        $data = $sayc->getAllUser($id);
        if(is_array($data)){
           return json(['errcode'=>0, "msg"=>"获取用户评论成功", 'data'=>$data]);
        }else{
           return json(['errcode'=>2, "msg"=>"获取用户评论失败"]);
        }
      }else{
        return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
      }
    }

    /*
     * 用户进入浏览器增加
     */
    public function addSayHit(){
      if(request()->isPost()){
        $id = input('param.id');
        $say = new SayModel();
        if($say->addHit($id)){
          return json(['errcode'=>0, "msg"=>"成功"]);
        }else{
          return json(['errcode'=>2, "msg"=>"失败"]);
        }
      }else{ 
        return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
      }
    }
    
    /*
     * 用户评论
     */
    public function userSayComment(){
        if(request()->isPost()){
          $data = input('param.');
          $data['sc_time'] = time();
          $data['sc_ip'] = request()->ip();
          $url='http://ip.taobao.com/service/getIpInfo.php?ip='.$data['sc_ip'];
          $result = json_decode(file_get_contents($url),true);
          if($result['code'] == 0){
            $data['sc_city'] = $result['data']['city'];
          }
          $data['sc_system'] = 'win 7';
          $say = new SayModel();
          $sayc = new SayCModel();
          if($sayc->userSayComment($data)){
             if($say->addNum(input("param.sc_pid"))){
                return json(['errcode'=>0, "msg"=>"回复成功"]);
             }
          }else{
             return json(['errcode'=>2, "msg"=>"回复失败"]);
          }
        }else{
          return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
    }
}
