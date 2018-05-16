<?php
namespace app\admin\controller;
use app\admin\model\BoardModel;
use app\admin\model\SayModel;
use app\admin\model\SayCModel;
use app\admin\model\ArticleModel;
use app\admin\model\ArticleCModel;
use app\admin\model\LogModel;
use app\admin\model\LogCModel;
use think\Controller;
use org\Verify;

class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function publishNum()
    {
        if (request()->isPost()) {
            $art = new ArticleModel();
            $artc = new ArticleCModel();
            $say = new SayModel();
            $sayc = new SayCModel();
            $log = new LogModel();
            $logc = new LogCModel();
            $board = new BoardModel();
            $data['artNum'] = $art->artNum();
            $data['artAll'] = $artc->artcNum();
            $data['sayNum'] = $say->sayNum();
            $data['sayAll'] = $sayc->saycNum();
            $data['logNum'] = $log->LogNum();
            $data['logAll'] = $logc->logcNum();
            $data['boardNum'] = $board->boardNum();
            return json(['errcode' => 0, 'msg' => '成功', 'data' => $data]);
        }else{
            return json(['errcode' => 1, 'msg' => '提交方式不正确']);
        }
    }
}


