<?php
// require_once "TrxHeaders.php";
namespace OOP\App;

// use OOP\App\TrxHeaders;
// use OOP\Tr

class TrxHeaderController{
    public $header;

    public function __construct()
    {
        $this->header = new TrxHeaders();
    }

    public function index()
    {
        print_r($this->header->index());
    }

    public function show($id)
    {
        print_r($this->header->find($id));
    }

    public function add($id)
    {
        $insert = [
            'id' => 'trx7',
            'trx_date' =>date('Y-m-d H:i:s'),
            'info_id' => 1,
            'total_discount' => 7000,
            'total_price' => 3000,
            'total_cost' => 3000,
            'total_change' => 4900
        ];
        print_r($this->header->insert($insert));
    }

    public function update($id){
         $update = [
            'info_id' => 3,
            'trx_date' => date('Y-m-d H:i:s'),
            'total_discount' => 40,
            'total_price' => 30,
            'total_cost' => 20,
            'total_change' => 10,
            'updated_at' => date('Y-m-d H:i:s')
    ];
    print_r($this->header->update($update, $id));
    }

    public function delete($id)
    {
        print_r($this->header->delete($id));
    }
}