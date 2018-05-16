<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-16
 * Time: 下午12:18
 */
namespace app\index\model;
use think\Model;

class ArticleModel extends Model{
    /*
     * 定义文章表名
     */
    protected $table = "fh_article";

    /*
     * 获取发布文章的数量
     */
    public function artNum(){
        return $this->count();
    }

    /*
     *  查询文章
     */
    public function selectArt($num, $page){
        return $this->order('a_time desc')->limit($num, $page)->select();
    }
    
    /*
     * 最新文章
     */
    public function newArt(){
        return $this->order('pid desc')->limit(10)->select();
    }
    
    /*
     * 获取文章详情
     */
    public function artDetail($id){
        return $this->where('a_id',$id)->find(); 
    }
    
    /*
     * 上一篇文章
     */
    public function prevArt($id){
       return $this->order('a_id desc')->where('a_id < '.$id)->find();
    }

    /*
     * 下一篇文章
     */
    public function nextArt($id){
       return $this->where('a_id > '.$id)->find();
    }
     
    /*
     * 文章点击排行
     */
    public function artHit(){
        return $this->join('fh_cat', $this->table . '.pid=' . 'fh_cat.c_id')->order('a_hit desc')->limit(5)->select();
    }
    
    /*
     * 技术文章
     */
    public function getArtList($num, $page){
      return $this->join('fh_cat', $this->table . '.pid=' . 'fh_cat.c_id')->order('a_id desc')->limit($num,$page)->select();
    }
    
    /*
     * 技术文章分类
     */
    public function artCatList($id,$num,$page){
       return $this->join('fh_cat', $this->table . '.pid=' . 'fh_cat.c_id')->order('a_id desc')->where('c_id', $id)->limit($num,$page)->select();
    }

    /*
     * 获取最新文章评论3条
     */
    public function newComment(){
        return $this->join("fh_article_c", $this->table . '.a_id=' . "fh_article_c.ac_pid")->order("ac_time desc")->limit(3)->select();
    }
}