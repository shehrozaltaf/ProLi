<?php

class Products extends CI_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('custom');
        $this->load->model('mproducts');
        $this->load->model('mcategories');
        if (!isset($_SESSION['login']['idUser'])) {
            redirect(base_url());
        }
    }

    function index()
    {
        $this->load->view('include/header');
        $this->load->view('include/nav');
        $this->load->view('products');
        $this->load->view('include/footer');
    }

    function uploadexcel()
    {
        $this->load->view('include/header');
        $this->load->view('include/nav');
        $this->load->view('uploadexcel');
        $this->load->view('include/footer');
    }

    function remainingproducts()
    {
        $this->load->view('include/header');
        $this->load->view('include/nav');
        $this->load->view('remainingproducts');
        $this->load->view('include/footer');
    }

    function editproduct($slug)
    {
        if (isset($slug) && $slug != '') {
            $getData = array();
            $MProducts = new MProducts();
            $MCategories = new MCategories();
            $getData['editProduct'] = $MProducts->editProduct($slug);
            $getData['getCategories'] = $MCategories->getCategories('', 1);
            $catArray = array();
            foreach ($getData['editProduct'] as $cate) {
                if (isset($cate->level_one) && $cate->level_one != '0') {
                    $catArray[] = $cate->level_one;
                }
                if (isset($cate->level_two) && $cate->level_two != '0') {
                    $catArray[] = $cate->level_two;
                }
                if (isset($cate->level_three) && $cate->level_three != '0') {
                    $catArray[] = $cate->level_three;
                }
                if (isset($cate->level_four) && $cate->level_four != '0') {
                    $catArray[] = $cate->level_four;
                }
                if (isset($cate->level_five) && $cate->level_five != '0') {
                    $catArray[] = $cate->level_five;
                }
                if (isset($cate->level_six) && $cate->level_six != '0') {
                    $catArray[] = $cate->level_six;
                }
            }
            $getData['getCategoriesAttribute'] = $MCategories->getCategoriesAttribute($catArray,$slug);
           /* echo '<pre>';
            print_r($getData['getCategoriesAttribute']);
            echo '</pre>';
            exit();*/
            $this->load->view('include/header');
            $this->load->view('include/nav');
            $this->load->view('productedit', $getData);
            $this->load->view('include/footer');
        } else {
            echo 'Invalid Project';
        }

    }

    public function uploadFile()
    {
        $result = array();
        $model = new Custom();
        $config['upload_path'] = 'assets/uploads/products';
        $config['allowed_types'] = 'xlsx|xls|csv';
        $this->load->library('upload', $config);
        if (!$this->upload->do_upload('FilePath')) {
            /*$error = array('error' => $this->upload->display_errors());
            print_r($error);*/
            $result[0]['class'] = 'error';
            $result[0]['message'] = $this->upload->display_errors();
        } else {
            $data = array('upload_data' => $this->upload->data());
            $file = 'assets/uploads/products/' . $data['upload_data']['file_name'];
            if (file_exists($file)) {
                $this->load->library('excel');
                //read file from path
                $objPHPExcel = PHPExcel_IOFactory::load($file);
                //get only the Cell Collection
                $cell_collection = $objPHPExcel->getActiveSheet()->getCellCollection();
                //extract to a PHP readable array format
                foreach ($cell_collection as $cell) {
                    $column = $objPHPExcel->getActiveSheet()->getCell($cell)->getColumn();
                    $row = $objPHPExcel->getActiveSheet()->getCell($cell)->getRow();
                    $data_value = $objPHPExcel->getActiveSheet()->getCell($cell)->getValue();
                    //header will/should be in row 1 only. of course this can be modified to suit your need.
                    if ($row == 1) {
                        $header[$row][$column] = $data_value;
                    } else {
                        $arr_data[$row][$column] = $data_value;
                    }
                }
                //send the data in an array format
                $data['header'] = $header;
                $data['values'] = $arr_data;
                $r = range('A', 'Z');
                $index = -1;
                foreach ($data['values'] as $key => $val) {
                    $index++;
                    if (isset($val[$r[1]])) {
                        $MProducts = new MProducts();
                        $sku_code = $val[$r[1]];
                        $checkProduct = $MProducts->checkProduct($sku_code);
                        if (isset($checkProduct[0]) && $checkProduct != '') {
                            $result[$index]['class'] = 'warning';
                            $result[$index]['message'] = 'Product sku ' . $sku_code . ' Already Added';
                        } else {
                            $product_name = $val[$r[2]];
                            $PostData = array(
                                'sku_code' => $sku_code,
                                'productName' => $product_name,
                                'short_description' => $val[$r[3]],
                                'description' => $val[$r[4]],
                                'link' => $val[$r[5]],
                                'price' => $val[$r[6]],
                                'cost' => $val[$r[7]],
                                'manufacturer' => $val[$r[8]],
                                'upc' => $val[$r[9]],
                                'upc_dev' => $val[$r[10]],
                                '`condition`' => $val[$r[11]],
                                'image_link' => $val[$r[12]],
                                'category' => $val[$r[13]],
                                'weight' => $val[$r[14]],
                                'meta_title' => $val[$r[15]],
                                'meta_description' => $val[$r[16]],
                                'product_stats' => 'Y',
                                'isMaster' => 0,
                                'isActive' => 1,
                            );
                            $insert = $model->Insert($PostData, 'idProduct', 'products', 'Y');
                            if ($insert) {
                                $category = $val[$r[13]];
                                $expcat = explode('/', $category);
                                $level_one = 0;
                                $level_two = 0;
                                $level_three = 0;
                                $level_four = 0;
                                foreach ($expcat as $keys => $cate) {
                                    $MCategories = new MCategories();
                                    $checkCategory = $MCategories->checkCategory($cate, $keys + 1);
                                    if ($keys + 1 == 1) {
                                        $level_one = $checkCategory[0]->idCategory;
                                    } elseif ($keys + 1 == 2) {
                                        $level_two = $checkCategory[0]->idCategory;
                                    } elseif ($keys + 1 == 3) {
                                        $level_three = $checkCategory[0]->idCategory;
                                    } elseif ($keys + 1 == 4) {
                                        $level_four = $checkCategory[0]->idCategory;
                                    }
                                    /* $ProCateData = array(
                                        'idProduct' => $insert,
                                        'cat_name' => $cate,
                                        'cat_desc' => $cate,
                                        'sort_order' => $keys,
                                        'idParent' => $keys,
                                        'image' => '',
                                        'cat_url' => '',
                                        'cat_level' => $keys + 1,
                                        'isActive' => 1,
                                    );
                                    $insert = $model->Insert($ProCateData, 'idCategory', 'category', 'Y');*/
                                }
                                $ProCateData = array(
                                    'idProduct' => $insert,
                                    'level_one' => $level_one,
                                    'level_two' => $level_two,
                                    'level_three' => $level_three,
                                    'level_four' => $level_four,
                                    'level_five' => '',
                                    'level_six' => '',
                                );
                                $insert = $model->Insert($ProCateData, 'id', 'product_category', 'Y');
                                $result[$index]['class'] = 'success';
                                $result[$index]['message'] = 'Product sku ' . $sku_code . ' Added Successfully';
                            } else {
                                $result[$index]['class'] = 'error';
                                $result[$index]['message'] = 'Something went wrong in sku' . $sku_code;
                            }
                        }
                    }
                }
            } else {
                $result[0]['class'] = 'error';
                $result[0]['message'] = 'Invalid File Type';
            }
        }
        echo json_encode($result, true);
    }

    public function uploadFile2()
    {
        $model = new Custom();
        $config['upload_path'] = 'assets/uploads/products';
        $config['allowed_types'] = 'xlsx';
        $this->load->library('upload', $config);
        if (!$this->upload->do_upload('FilePath')) {
            $error = array('error' => $this->upload->display_errors());
            print_r($error);
        } else {
            $data = array('upload_data' => $this->upload->data());
            $file = 'assets/uploads/products/' . $data['upload_data']['file_name'];
            if (file_exists($file)) {
                $this->load->library('excel');
                //read file from path
                $objPHPExcel = PHPExcel_IOFactory::load($file);
                //get only the Cell Collection
                $cell_collection = $objPHPExcel->getActiveSheet()->getCellCollection();
                //extract to a PHP readable array format
                foreach ($cell_collection as $cell) {
                    $column = $objPHPExcel->getActiveSheet()->getCell($cell)->getColumn();
                    $row = $objPHPExcel->getActiveSheet()->getCell($cell)->getRow();
                    $data_value = $objPHPExcel->getActiveSheet()->getCell($cell)->getValue();
                    //header will/should be in row 1 only. of course this can be modified to suit your need.
                    if ($row == 1) {
                        $header[$row][$column] = $data_value;
                    } else {
                        $arr_data[$row][$column] = $data_value;
                    }
                }
                //send the data in an array format
                $data['header'] = $header;
                $data['values'] = $arr_data;
                $r = range('A', 'Z');
                foreach ($data['values'] as $key => $val) {
                    if (isset($val[$r[0]])) {
                        $sku_code = $val[$r[0]];
                        $product_name = $val[$r[1]];
                        $product_desc = $val[$r[2]];
                        $PostData = array(
                            'sku_code' => $sku_code,
                            'productName' => $product_name,
                            'desc' => $product_desc,
                            'isMaster' => 0,
                            'isActive' => 1,
                        );
                        $insert = $model->Insert($PostData, 'idProduct', 'products', '');
                        if ($insert) {
                            echo '2---';
                        } else {
                            echo '3---';
                        }
                    }
                }
            }
            echo 1;
        }
    }


    function getData()
    {
        $MProducts = new MProducts();
        $orderindex = (isset($_REQUEST['order'][0]['column']) ? $_REQUEST['order'][0]['column'] : '');
        $orderby = (isset($_REQUEST['columns'][$orderindex]['name']) ? $_REQUEST['columns'][$orderindex]['name'] : '');
        $searchData = array();
        $searchData['start'] = (isset($_REQUEST['start']) && $_REQUEST['start'] != '' && $_REQUEST['start'] != 0 ? $_REQUEST['start'] : 0);
        $searchData['length'] = (isset($_REQUEST['length']) && $_REQUEST['length'] != '' ? $_REQUEST['length'] : 25);
        $searchData['search'] = (isset($_REQUEST['search']['value']) && $_REQUEST['search']['value'] != '' ? $_REQUEST['search']['value'] : '');
        $searchData['orderby'] = (isset($orderby) && $orderby != '' ? $orderby : 'sku_code');
        $searchData['ordersort'] = (isset($_REQUEST['order'][0]['dir']) && $_REQUEST['order'][0]['dir'] != '' ? $_REQUEST['order'][0]['dir'] : 'asc');
        $searchData['isMaster'] = (isset($_REQUEST['isMaster']) ? $_REQUEST['isMaster'] : '');
        $data = $MProducts->getProducts($searchData);

        $result["draw"] = (isset($_REQUEST['draw']) && $_REQUEST['draw'] != '' ? $_REQUEST['draw'] : 0);
        $totalsearchData = array();
        $totalsearchData['start'] = 0;
        $totalsearchData['isMaster'] = (isset($_REQUEST['isMaster']) ? $_REQUEST['isMaster'] : '');
        $totalsearchData['length'] = 10000000;
        $totalsearchData['search'] = (isset($_REQUEST['search']['value']) && $_REQUEST['search']['value'] != '' ? $_REQUEST['search']['value'] : '');
        $totalrecords = $MProducts->getCntTotalProducts($totalsearchData);

        $result["recordsTotal"] = $totalrecords[0]->cnttotal;
        $result["recordsFiltered"] = $totalrecords[0]->cnttotal;
        $res = array();
        foreach ($data as $mykey => $mydata) {
            $res[$mykey] = $mydata;
            $res[$mykey]->action = '<a target="_blank"   href="' . base_url('index.php/Products/editproduct/' . $mydata->idProduct) . '" ><i class="md-icon material-icons">edit</i></a>
 <a href="javascript:void(0)" onclick="getDelete(this);" data-idProduct="' . $mydata->idProduct . '"><i class="md-icon material-icons">delete</i></a>';
        }
        $result["data"] = $res;
        echo json_encode($result, true);
    }

    public function deleteData()
    {
        $Custom = new Custom();
        $editArr = array();
        $idProject = $this->input->post('idProduct');
        $editArr['isActive'] = 0;
        $editData = $Custom->Edit($editArr, 'idProduct', $idProject, 'products');
        echo $editData;
    }


}

?>
