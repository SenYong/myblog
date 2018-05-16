<?php
  /**
 * Created by PhpStorm.
 * User: root
 * Date: 18-2-1
 * Time: 下午3:40
 */
 namespace app\admin\controller;
 use app\admin\model\LogModel;
  use app\admin\model\LogCModel;
 use think\Controller;

 class Log extends Controller
 {
    /*
     * 图片上传
     */
    public function uploadImg(){
       if(request()->isPost()){
          $file = input('param.image');
          $url = explode(",", $file);
          strpos($url[0], 'png') ? $filename = md5(time()) . '.png' : $filename = md5(time()) . '.jpg';
          $imgurl = '/public/static/logImg/' . $filename;
          $filepath = ROOT_PATH . $imgurl;
          $url[1] = base64_decode(str_replace(" ", "+",$url[1]));
          if(file_put_contents($filepath, $url[1])){
            return json(['errcode'=>0, "msg"=>"图片上传成功", "filename"=>$imgurl]);
          }else{
            return json(['errcode'=>2, "msg"=>"图片上传不成功"]); 
          }
          
       }else{
          return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
    }

    /*
     * 添加日志
     */
    public function addLog(){
       if(request()->isPost()){
         $data = input('param.');
         $data['l_system'] = 'win 7';
         $data['l_ip'] = request()->ip(); 
         $log = new LogModel();
         if($log->addLog($data)){
            return json(['errcode'=>0, "msg"=>"添加日志成功"]);
         }else{
            return json(['errcode'=>2, "msg"=>"添加日志失败"]);
         }
       }else{ 
         return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
    }

    /*
     * 获取所有日志
     */
    public function selectLog(){
        if(request()->isPost()){
           $log = new LogModel();
           $num = input("param.num");
           $page = input("param.page");
           $data = $log->selectLog($num, $page);
           $total = $log->LogNum();
           if($data != null){
              return json(['errcode'=>0, "msg"=>"获取日志成功", "data"=>$data, "total"=>$total]);
           }else{
              return json(['errcode'=>2, "msg"=>"获取日志失败"]);
           } 
        }else{
           return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
    }

    /*
     * 获取单条日志
     */
    public function getOneLog(){
       if(request()->isPost()){
         $id = input('param.id');
         $log = new LogModel();
         $data = $log->getOneLog($id);
         if($data){
            return json(['errcode'=>0, "msg"=>"获取日志成功", "data"=>$data]);
         }else{
            return json(['errcode'=>2, "msg"=>"获取日志失败"]);
         }
       }else{
         return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
    }

    /*
     *修改日志 
     */
    public function updateLog(){
      if(request()->isPost()){
        $data = input('param.');
        $log = new LogModel();
        if($log->updateLog($data)){
           return json(['errcode'=>0, "msg"=>"修改日志成功"]);
        }else{
           return json(['errcode'=>2, 'msg'=>'修改日志失败']);
        }
      }else{
        return json(['errcode'=>1, "msg"=>'提交方式不正确']);
      }
    }

    /*
     * 删除日志
     */
    public function deleteLog(){
      if(request()->isPost()){
        $id = input('param.id');
        $log = new LogModel();
        if($log->delLog($id)){
          return json(['errcode'=>0, 'msg'=>'删除日志成功']);
        }else{
          return json(['errcode'=>2, 'msg'=>'删除日志失败']);
        }
      }else{
        return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
      }
    }
     
    /*
     * 获取日志评论列表
     */
    public function getLogComment(){
      if(request()->isPost()){
        $logc = new LogModel();
        $data = $logc->getLogComment();
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
     public function getOneLogComment(){
        if(request()->isPost()){
           $id = input('param.id');
           $logc = new LogModel();
           $data = $logc->getOneLogComment($id);
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
      * 日志回复
      */
     public function replyLog(){
        if(request()->isPost()){
            $data = input('param.');
            $logc = new LogCModel();
            if($logc->replyLogs($data)){
                return json(['errcode'=>0, 'msg'=>'回复成功']);
            }else{
                return json(['errcode'=>2, 'msg'=>'回复失败']);
            }
        }else{
            return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
        }
     }

     /*
      * 用户进入浏览量增一
      */
    public function addLogHit(){
        if(request()->isPost()){
           $id = input("param.id");
           $art = new LogModel();
           if($art->addHit($id)){
              return json(['errcode'=>0, "msg"=>'成功']);
           }else{
              return json(['errcode'=>2, "msg"=>'失败']);
           }
        }else{
           return json(['errcode'=>1, "msg"=>"提价方式不正确"]);
        }
    }

    //内容编辑图片上传
    public function editor(){
        if(request()->isPost()){
          $file = request()->file('img');
          if($file){
            $pathfile = ROOT_PATH . '/public/uploadImg/log/';
            $info = $file->move($pathfile);
            if($info){
              $imgUrl = '/public/uploadImg/log/' . $info->getSaveName();
              return json(['errcode'=>0, 'url'=>$imgUrl, "msg"=>"图片上传成功"]);
            }
          }else{
            return json(['errcode'=>2, "msg"=>"图片上传不成功"]);
          }
        }else{
          return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
    }
 }
?>


