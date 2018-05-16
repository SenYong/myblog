<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-31
 * Time: 下午14:00
 */
 namespace app\admin\controller;
 use app\admin\model\SayModel;
 use app\admin\model\SayCModel;
 use think\Request;
 use think\Controller;

 class Say extends Controller
 {
    /*
     * 图片上传
     */
    public function uploadImg(){
        if(request()->isPost()){
            $file = input('param.image');
            $url = explode(",", $file);
            strpos($url[0], 'png') ? $filename = md5(time()) . '.png' : $filename = md5(time()) . '.jpg';
            $imgurl = '/public/static/sayImg/' . $filename;
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
     * 新增说说
     */
    public function addSay(){
       if(request()->isPost()){
         $data = input('param.');
         $data['s_ip'] = request()->ip();
         $data['s_system'] = 'Win 7';
         $say = new SayModel();
         if($say->addSay($data)){
            return json(['errcode'=>0, 'msg'=>"新增说说成功"]);
         }else{
            return json(['errcode'=>2, "msg"=>"新增说说失败"]);
         }
       }else{
         return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
    }

    /*
     * 获取说说列表
     */
    public function selectSay(){
        if(request()->isPost()){
           $say = new SayModel();
           $data = $say->selectSay(input('param.num'),input('param.page'));
           $total = $say->sayNum();
           if(is_array($data)){
              return json(['errcode'=>0, 'msg'=>'查询成功', 'data'=>$data, 'total'=>$total]);
           }else{
              return json(['errcode'=>2, 'msg'=>'查询失败']);
           } 
        }else{
           return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
    }

    /*
     * 获取单条说说
     */
    public function getOneSay(){
        if(request()->isPost()){
           $id = input('param.id');
           $say = new SayModel();
           $data = $say->getOneSay($id);
           if($data){
              return json(['errcode'=>0, "msg"=>"获取说说成功", "data"=>$data]);
           }else{
              return json(['errcode'=>2, "msg"=>"获取说说失败"]);
           }
        }else{
            return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
    }

    /*
     * 修改说说
     */
    public function updateSay(){
      if(request()->isPost()){
        $data = input('param.');
        $say = new SayModel();
        if($say->updateSay($data)){
          return json(['errcode'=>0, "msg"=>"修改成功"]);
        }else{
          return json(['errcode'=>2, "msg"=>"修改失败"]);
        }
      }else{
        return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
      }
    }

    /*
     * 删除说说
     */
    public function deleteSay(){
      if(request()->isPost()){
        $id = input('param.id');
        $say = new SayModel();
        if($say->delSay($id)){
           return json(['errcode'=>0, 'msg'=>'删除成功']);
        }else{
           return json(['errcode'=>2, 'msg'=>'删除失败']);
        }
      }else{
        return json(['errcode'=>1, "msg"=>'提交方式不正确']);
      }
    }

    /**评论区**/
    /*
     * 获取说说评论列表
     */
    public function getSayComment(){
      if(request()->isPost()){
        $sayc = new SayModel();
        $data = $sayc->getArtComment();
        if($data){
          return json(['errcode'=>0, "msg"=>"获取成功", 'data'=>$data]);
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
    public function getOneSayComment(){
      if(request()->isPost()){
        $id = input('param.id');
        $sayc = new SayModel();
        $data = $sayc->getOneArtComment($id);
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
     * 说说回复
     */
    public function replySay(){
        if(request()->isPost()){
            $data = input('param.');
            $sayc = new SayCModel();
            if($sayc->replySays($data)){
              return json(['errcode'=>0, 'msg'=>'回复成功']);
            }else{
              return json(['errcode'=>2, 'msg'=>'回复失败']);
            }
        }else{
            return json(['errcode'=>1, 'msg'=>"提交方式不正确"]);
        }
    }
 }
?>