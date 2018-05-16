<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 18-1-16
 * Time: 下午12:18
 */
namespace app\index\model;
use think\Model;

class CatModel extends Model{
    /*
     * 定义文章表名
     */
    protected $table = "fh_cat";

    /*
     * 获取栏目
     */
    public function getCat(){
        return $this->order('c_id desc')->select();
    }
}