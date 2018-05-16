<?php
namespace app\index\controller;
use app\index\model\ArticleModel;
use think\Controller;

class Index extends Controller
{
    public function index()
    {
      return $this->fetch();
    }
    
    /*
     * 首页文章列表
     */
    public function getArticle()
    {
       if(request()->isPost()){
           $num = input("param.num");
           $page = input("param.page");
           $art = new ArticleModel();
           $data = $art->selectArt($num, $page);
           if(is_array($data)){
             return json(['errcode'=>0, 'msg'=>'查询成功', 'data'=>$data]);
           }else{
             return json(['errcode'=>2, 'msg'=>'查询失败']);
           }
       }else{
          return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
       }
    }

    /*
     * 最新文章
     */
    public function newArt(){
       if(request()->isPost()){
         $art = new ArticleModel();
         $data = $art->newArt();
         if(is_array($data)){
            return json(['errcode'=>0, 'msg'=>'查询最新文章成功', 'data'=>$data]); 
         }else{
            return json(['errcode'=>2, 'msg'=>'查询最新文章失败']); 
         }
       }else{
         return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
       }
    }  

    /*
     * 文章详情
     */
    public function artDetail(){
       if(request()->isPost()){
          $id = input('param.id');
          $art = new ArticleModel();
          $data = $art->artDetail($id);
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
     * 上一篇文章
     */
    public function prevArt(){
        if(request()->isPost()){
           $id = input('param.id');
           $art = new ArticleModel(); 
           $data = $art->prevArt($id);
           return json(['errcode'=>0, 'msg'=>'获取上一篇文章成功', 'data'=>$data]);
        }else{
           return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
        }
    }
    
    /*
     * 下一篇文章
     */
    public function nextArt(){
       if(request()->isPost()){
          $id = input('param.id');
          $art = new ArticleModel(); 
          $data = $art->nextArt($id);
          return json(['errcode'=>0, 'msg'=>'获取下一篇文章成功', 'data'=>$data]);
       }else{
          return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
       }
    }

    /*
     * 文章点击排行
     */
    public function artHit(){
        if(request()->isPost()){
           $art = new ArticleModel();
           $data = $art->artHit();
           if(is_array($data)){
             return json(['errcode'=>0, 'msg'=>'查询点击排行成功', 'data'=>$data]);
           }else{
             return json(['errcode'=>2, 'msg'=>'查询点击排行失败']); 
           }   
        }else{
           return json(['errcode'=>1, 'msg'=>'提交方式不正确']);
        }      
    }
    
    /*
     * 播放随机音乐
     */
    public function getMusic(){
       if(request()->isPost()){
          $type = input("param.type");
          $url = "http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.billList&type=".$type."&size=1&offset=0";
          $billList = json_decode(file_get_contents($url));
          if($billList->error_code == 22000){
              $songUrl = "http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.song.playAAC&songid=" . $billList->song_list[0]->song_id;
              $play = json_decode(file_get_contents($songUrl));
              if($play->error_code == 22000){
                 return json(['errcode'=>0, 'file_link'=>$play->bitrate->file_link, 'songImgUrl'=>$play->songinfo->pic_small, "title"=>$play->songinfo->title, "author"=>$play->songinfo->author]); 
              }else{
                 return json(['errcode'=>2, "msg"=>"请求失败"]);
              }
          }else{
              return json(['errcode'=>2, "msg"=>"请求失败"]);
          }
       }else{
          return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       }
    }

    /*
     * 搜索音乐
     */
    public function searchMusic(){
       if(request()->isPost()){
           $query = input("param.search"); 
           $url = "http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.search.catalogSug&query=" . $query;
           $search = json_decode(file_get_contents($url));
           if($search->error_code == 22000){
              $songUrl = "http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.song.playAAC&songid=" . $search->song[0]->songid;
              $play = json_decode(file_get_contents($songUrl));
              if($play->error_code == 22000){
                 return json(['errcode'=>0, 'file_link'=>$play->bitrate->file_link, 'songImgUrl'=>$play->songinfo->pic_small, "title"=>$play->songinfo->title, "author"=>$play->songinfo->author]); 
              }else{
                 return json(['errcode'=>2, "msg"=>"请求失败"]);
              }
           }else{
              return json(['errcode'=>2, "msg"=>"请求失败"]);
           }    
       }else{
           return json(['errcode'=>1, "msg"=>"提交方式不正确"]);
       } 
    }
}
