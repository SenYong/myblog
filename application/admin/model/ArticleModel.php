<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-16
 * Time: 下午12:18
 */
namespace app\admin\model;
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
     *  新增文章
     */
    public function addArt($data){
        return $this->save($data);
    }
   
    /*
     * 文章删除
     */
    public function deleteArt($id){
        return $this->where('a_id',$id)->delete();
    }

    /*
     * 获取单条文章
     */
    public function getOneArt($id){
        return $this->where('a_id',$id)->find();
    }

    /*
     * 修改文章 
     */
    public function updateArt($data){
        return $this->update($data);
    }

    /*
     *  查询文章
     */
    public function selectArt($num,$page){
        return $this->order('a_time desc')->limit($num,$page)->select();
    }

    /*
     * 获取文章评论列表 
     */
    public function getArtComment(){
        return $this->join('fh_article_c', $this->table . '.a_id=' . 'fh_article_c.ac_pid')->order('a_id desc')->select();
    }
    
    /*
     * 获取单个文章评论
     */
    public function getOneArtComment($id){
        return $this->join('fh_article_c', $this->table . '.a_id=' . 'fh_article_c.ac_pid')->where('ac_id',$id)->find();
    }
    
    /*
     * 浏览量增加
     */
    public function addHit($id){
        return $this->where('a_id',$id)->setInc("a_hit");
    }

    /*
     * 评论量增加
     */
    public function addNum($id){
        return $this->where('a_id',$id)->setInc("a_num");
    }
}