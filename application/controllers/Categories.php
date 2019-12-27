<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Categories extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('mcategories');
        $this->load->model('msetting');
        $this->load->model('custom');
        if (!isset($_SESSION['login']['idUser'])) {
            redirect(base_url());
        }
    }


    public function index()
    {
        $getData = array();
        $MCategories = new MCategories();
        $mydata = array();
        $getCategoryOne = $MCategories->getCategories('', '1');
        foreach ($getCategoryOne as $key => $data) {
            $mydata[$key] = $data;
            $getCategoryTwo = $MCategories->getCategories($data->idCategory, '2');
            foreach ($getCategoryTwo as $key2 => $cate2) {
                $mydata[$key]->category_level2[$key2] = $cate2;
            }
        }
        $getData['getData'] = $mydata;
        $Msetting = new Msetting();
        $getData['permission'] = $Msetting->getFormRights($_SESSION['login']['idGroup'], '', 'pages');
        $getData['getGroup'] = $Msetting->getAllGroups();
        $this->load->view("include/header", $getData);
        $this->load->view("include/nav");
        $this->load->view("categories");
        $this->load->view("include/footer");
    }

    public function index2()
    {
        $getData = array();
        $MCategories = new MCategories();
//        $getData['getData'] = $MCategories->getCategoryOne();
        $mydata = array();
        $getCategoryOne = $MCategories->getCategoryOne();
        foreach ($getCategoryOne as $key => $data) {
            $mydata[$key] = $data;
            $getCategoryTwo = $MCategories->getCategoryTwo($data->idCategoryOne);
            foreach ($getCategoryTwo as $key2 => $cate2) {
                $mydata[$key]->category_level2[$key2] = $cate2;
                /*$getCategoryThree = $MCategories->getCategoryThree($data->idCategoryOne);
                foreach ($getCategoryThree as $key3 => $cate3) {
                    $mydata[$key]->category_level2[$key2]->category_level3[$key2] = $cate2;
                    $getCategoryFour = $MCategories->getCategoryFour($data->idCategoryOne);
                    foreach ($getCategoryFour as $key4 => $cate4) {
                        $mydata[$key]->category_level4[$key2] = $cate2;
                        $getCategoryFive = $MCategories->getCategoryFive($data->idCategoryOne);
                        foreach ($getCategoryFive as $key5 => $cate5) {
                            $mydata[$key]->category_level5[$key2] = $cate2;
                            $getCategorySix = $MCategories->getCategorySix($data->idCategoryOne);
                            foreach ($getCategorySix as $key2 => $cate2) {
                                $mydata[$key]->category_level6[$key2] = $cate2;
                            }
                        }
                    }
                }*/
            }
        }
        $getData['getData'] = $mydata;
        $Msetting = new Msetting();
        $getData['permission'] = $Msetting->getFormRights($_SESSION['login']['idGroup'], '', 'pages');
        $getData['getGroup'] = $Msetting->getAllGroups();
        $this->load->view("include/header", $getData);
        $this->load->view("include/nav");
        $this->load->view("categories");
        $this->load->view("include/footer");
    }

    public function getCategoriesData2()
    {
        $MCategories = new MCategories();
        $id = $this->input->post('id');
        $idlevel = $this->input->post('idlevel');
        $cond = '';
        $table = '';
        if ($idlevel == '2') {
            $cond = 'level_id_one';
            $table = 'product_hierarchy_two';
        } elseif ($idlevel == '3') {
            $cond = 'level_id_two';
            $table = 'product_hierarchy_three';
        } elseif ($idlevel == '4') {
            $cond = 'level_id_three';
            $table = 'product_hierarchy_four';
        } elseif ($idlevel == '5') {
            $cond = 'level_id_four';
            $table = 'product_hierarchy_five';
        } elseif ($idlevel == '6') {
            $cond = 'level_id_five';
            $table = 'product_hierarchy_six';
        }
        $result = $MCategories->getCategory($cond, $id, $table);
        echo json_encode($result, true);
    }

    public function getCategoriesData()
    {
        $MCategories = new MCategories();
        $id = $this->input->post('id');
        $idlevel = $this->input->post('idlevel');
        $result = $MCategories->getCategories($id, $idlevel);
        echo json_encode($result, true);
    }

}