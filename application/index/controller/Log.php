<?php
namespace app\index\controller;
use app\index\model\LogModel;
use app\index\model\LogCModel;
use think\Controller;

class Log extends Controller
{
    /*
     * 最新日志
     */
    public function newLog(){
       if(request()->isPost()){
          $log = new LogModel();
          $data = $log->newLog();
          if(is_array($data)){
            return json(['errcode'=>0, 'msg'=>'最新日志成功', 'data'=>$data]);
          }else{
            return json(['errcode'=>0, 'msg'=>'最新日志失败']);
          }        
       }else{
          return ['errcode'=>1, "msg"=>'提交方式不正确'];
       }
    }  
    
     /*
     * 日志详情
     */
    public function logDetail(){
      if(request()->isPost()){
          $id = input('param.id');
          $log = new LogModel();
          $data = $log->logDetail($id);
          if($data){
             return json(['errcode'=>0, 'msg'=>'查询文章详情成功', 'data'=>$data]);
          }else{
             return json(['errcode'=>2, 'msg'=>'查询文章详情失败']); 
          }
       }else{
          return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
       }
    }

    /*
     * 上一篇日志
     */
    public function prevLog(){
        if(request()->isPost()){
           $id = input('param.id');
           $art = new LogModel(); 
           $data = $art->prevLog($id);
           return json(['errcode'=>0, 'msg'=>'获取上一篇文章成功', 'data'=>$data]);
        }else{
           return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
        }
    }

    /*
     * 下一篇文章
     */
    public function nextLog(){
       if(request()->isPost()){
          $id = input('param.id');
          $art = new LogModel(); 
          $data = $art->nextLog($id);
          return json(['errcode'=>0, 'msg'=>'获取下一篇文章成功', 'data'=>$data]);
       }else{
          return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
       }
    }
    
    /*
     * 获取用户评论
     */
    public function getAllLogUser(){
      if(request()->isPost()){
        $id = input('param.id');
        $art = new LogCModel();
        $data = $art->getAllLogUser($id);
        if(is_array($data)){
          return json(['errcode'=>0, "msg"=>"获取成功", 'data'=>$data]);
        }else{
          return json(['errcode'=>2, "msg"=>"获取失败"]);
        }
      }else{
        return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
      }
    }

    /*
      * 用户评论
      */
     public function userLogComment(){
        if(request()->isPost()){
          $data = input('param.');
          $data['lc_time'] = time();
          $data['lc_ip'] = request()->ip();
          $url='http://ip.taobao.com/service/getIpInfo.php?ip='.$data['lc_ip'];
          $result = json_decode(file_get_contents($url),true);
          if($result['code'] == 0){
            $data['lc_city'] = $result['data']['city'];
          }
          $data['lc_system'] = 'win 7';
          $log = new LogModel();
          $logc = new LogCModel();
          if($logc->userLogComment($data)){
             if($log->addNum(input("param.lc_pid"))){
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
