<?php
// require_once 'Database.php';
namespace OOP\App;

class TrxHeaders extends Database{

    public function index(){ //all
       $statement =  self::$conn->prepare("select * from trx_header");
       $statement->execute();

       return $statement->fetchAll(\PDO::FETCH_OBJ);
    }

    public function find($id){
        $statement = self::$conn->prepare("SELECT * FROM trx_header WHERE id='$id'"); //:id atau ?
        $statement->execute(); //['id' => $id ] atau [$id]

        return $statement->fetch(\PDO::FETCH_OBJ);
    }

    public function findArray($id){
        $statement = self::$conn->prepare("SELECT * FROM trx_header WHERE id='$id'");
        $statement->execute();

        return $statement->fetch();
    }

    public function insert($data){
        $statement = self::$conn->prepare("INSERT INTO trx_header(id, info_id,
        trx_date, total_discount, total_price, total_cost, total_change, created_at)
        VALUES (:id, :info_id, :trx_date, :total_discount, :total_price,
        :total_cost, :total_change, :created_at)");

        return $statement->execute($data);

    }

    public function update($data, $id) {
        // var_dump($data);
        // die();
        $statement = self::$conn->prepare("UPDATE trx_header SET info_id = :info_id, trx_date = :trx_date, 
        total_discount = :total_discount, total_price = :total_price, total_cost = :total_cost, total_change = :total_change, updated_at = :updated_at
        WHERE id='$id'");

        return $statement->execute($data);

    } 

    public function delete($id){
        $statement = self::$conn->prepare("DELETE FROM trx_header WHERE id='$id'");
        $statement->execute();

        return $statement->fetch(\PDO::FETCH_OBJ);
    }
};



try {
    $trxHeader = new TrxHeaders();
    // print_r($trxHeader->index());
    // print_r($trxHeader->find('trx1'));
    // $data = $trxHeader->find('trx1');
    // echo $data->date;
    // $data2 = $trxHeader->findArray('trx1');
    // echo $data2['trx_date'];
    // var_dump((object) $data2);

    // $insert = [
    //     'id' => 'trx6',
    //     'trx_date' =>date('Y-m-d H:i:s'),
    //     'info_id' => 1,
    //     'total_discount' => 67000,
    //     'total_price' => 3000,
    //     'total_cost' => 3000,
    //     'total_change' => 24900,
    //     'created_at' => date('Y-m-d H:i:s')
    // ];
    // $trxHeader->insert($insert);

    // $update = [
    //         'info_id' => 3,
    //         'trx_date' => date('Y-m-d H:i:s'),
    //         'total_discount' => 10,
    //         'total_price' => 10000,
    //         'total_cost' => 50000,
    //         'total_change' => 12000,
    //         'updated_at' => date('Y-m-d H:i:s')
    // ];
    // $trxHeader->update($update, 'trx6');


    // $data = $trxHeader->delete('trx10');
    // $data = $trxHeader->delete('trx11');



} catch (\Throwable $th) {
    throw $th;
}