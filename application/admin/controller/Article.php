<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-20
 * Time: 上午10:32
 */
 namespace app\admin\controller;
 use app\admin\model\ArticleModel;
 use app\admin\model\ArticleCModel;
 use think\Request;
 use think\Controller;

 class Article extends Controller{
     //图片上传
     public function uploadImg(){
         if(request()->isPost()){
           $file = input('param.image');
           $url = explode(',', $file);
           $filename = md5(time()).'.png';//自定义图片名
           $imgurl = '/public/static/artImg/' . $filename;
           $filepath = ROOT_PATH . $imgurl;
           $url[1] = base64_decode(str_replace(" ","+",$url[1]));
           if(file_put_contents($filepath,$url[1])){
             return json(["errcode"=>0, "msg"=>'图片上传成功', "filepath"=>$imgurl]);
           }else{
             return json(['errcode'=>2, "msg"=>"图片上传失败"]);
           }
         }else{
           return json(['errcode'=>1, "msg"=>'提交方式不正确']);
         }
     }

     /*
      * 新增文章
      */
     public function addArticle(){
       if(request()->isPost()){
         $data = input('param.');
         $data['a_ip'] = request()->ip();
         $data['a_system'] = 'Win 7';
         $art = new ArticleModel();
         if($art->addArt($data)){
            return json(['errcode'=>0, "msg"=>"新增文章成功"]); 
         }else{
            return json(['errcode'=>2, "msg"=>"新增文章失败"]); 
         } 
       }else{
         return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
     }

     /*
      * 文章删除
      */
     public function delArticle(){
       if(request()->isPost()){
         $id = input('param.id');
         $art = new ArticleModel();
         if($art->deleteArt($id)){
           return json(['errcode'=>0, "msg"=>"删除成功"]);
         }else{
           return json(['errcode'=>1, "msg"=>"删除失败"]);
         }
       }
     }

     /*
      * 获取单条文章
      */
     public function getOneData(){
        if(request()->isPost()){
          $id = input('param.id');
          $art = new ArticleModel();
          $data = $art->getOneArt($id);
          if($data){
             return json(["errcode"=>0, "msg"=>"获取成功", "data"=>$data]);
          }else{
             return json(["errcode"=>2, "msg"=>"获取失败"]);
          }
        }else{
          return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
     }

     /*
      * 修改文章
      */
     public function updateArticle(){
        if(request()->isPost()){
           //$search = array(" ","　","\n","\r","\t");
           //$replace = array("","","","","");
           $data = input('param.');
           //$data['a_content'] = str_replace($search, $replace, $data['a_content']);
           $data['a_ip'] = request()->ip();
           $data['a_system'] = 'Win 7';
           $art = new ArticleModel();
           if($art->updateArt($data)){
              return json(['errcode'=>0, "msg"=>"修改成功"]); 
           }else{
              return json(['errcode'=>2, "msg"=>"修改失败"]); 
           }  
        }else{
          return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
     }

     /*
      *获取文章列表
      */
     public function selectArticle(){
       if(request()->isPost()){
          $num = input('param.num');
          $page = input('param.page');
          $art = new ArticleModel();
          $data = $art->selectArt($num, $page);
          $total = $art->artNum();
          if($data != null){
             return json(['errcode'=>0, "msg"=>"获取成功", "data"=>$data, 'total'=>$total]);
          }else{
             return json(['errcode'=>2, "msg"=>"获取失败"]);
          }   
       }else{
          return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
     }
     
     /* 评论区 */

     /*
      * 用户评论
      */
     public function userArtComment(){
        if(request()->isPost()){
          $data = input('param.');
          $data['ac_time'] = time();
          $data['ac_ip'] = request()->ip();
          $url='http://ip.taobao.com/service/getIpInfo.php?ip='.$data['ac_ip'];
          $result = json_decode(file_get_contents($url),true);
          if($result['code'] == 0){
            $data['ac_city'] = $result['data']['city'];
          }
          $data['ac_system'] = 'win 7';
          $artc = new ArticleCModel();
          $art = new ArticleModel();
          if($artc->addUserComment($data)){
             if($art->addNum(input("param.ac_pid"))){
                return json(['errcode'=>0, "msg"=>"回复成功"]);
             }
          }else{
             return json(['errcode'=>2, "msg"=>"回复失败"]);
          }
        }else{
          return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
     }

     /*
      * 获取文章所有用户评论
      */
     public function getAllUser(){
        if(request()->isPost()){
           $id = input('param.id');
           $art = new ArticleCModel();
           $data = $art->getAllUser($id);
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
      * 获取文章评论列表
      */
     public function getArtComment(){
       if(request()->isPost()){
           $artc = new ArticleModel();
           $data = $artc->getArtComment();
           if($data != null){
              return json(['errcode'=>0, 'msg'=>'获取成功', 'data'=>$data]);
           }else{
              return json(['errcode'=>2, "msg"=>"获取失败"]);
           }
       }else{
           return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
     }
     
     /*
      * 获取单个用户评论
      */
     public function getOneArtComment(){
        if(request()->isPost()){
           $id = input('param.id');
           $artc = new ArticleModel();
           $data = $artc->getOneArtComment($id);
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
      * 回复评论
      */
     public function replyArt(){
       if(request()->isPost()){
          $data = input('param.');
          $artc = new ArticleCModel();
          if($artc->replyArts($data)){
             return json(['errcode'=>0, "msg"=>"回复成功", 'data'=>$data]);
          }else{
            return json(['errcode'=>0, "msg"=>"回复失败"]);
          }     
       }else{
          return json(['errcode'=>1, "msg"=>"提价方式不正确"]);
       }
     }
     
     /*
      * 用户进入浏览量增一
      */
     public function addHit(){
        if(request()->isPost()){
           $id = input("param.id");
           $art = new ArticleModel();
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
            $pathfile = ROOT_PATH . '/public/uploadImg/article/';
            $info = $file->move($pathfile);
            if($info){
              $imgUrl = '/public/uploadImg/article/' . $info->getSaveName();
              return json(['errcode'=>0, 'url'=>$imgUrl, "msg"=>"图片上传成功"]);
            }
          }else{
            return json(['errcode'=>2, "msg"=>"图片上传失败"]);
          }
        }else{
          return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
        }
     }
     
 }

// 参考案例: https://www.jianshu.com/p/c4e1c8475a60





