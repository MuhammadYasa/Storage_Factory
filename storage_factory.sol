// SPDX-License-Identifier: MIT

// ini digunakan untuk menyimpan banyak alamat 
// factory pattern 
// agar dapat memberikan orang lain, kemampuan untuk menyebarkan dan menyimpan daftar alamat sendiri

pragma solidity ^0.6.0;
import "./SimpleStorage_1.sol"; // import untuk file yg dalam 1 folder

// selain dngn cara import, bisa juga menggunakan cara inheritance / pewarisan, contract StorageFactory is SimpleStorage
contract StorageFactory{

    SimpleStorage[] public simpleStorageArray; // inisialisasi SimplestorageArray

    function createSimpleStorageContract() public{
        SimpleStorage simpleStorage = new SimpleStorage(); 
        // memanggil fungsi dari SimpleStorage > apa yg di panggil, fungsi bernama simpleStorage, kemudian di buat jadi baru
        simpleStorageArray.push(simpleStorage);
    }

    function sFStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
        // untuk berinteraksi , membutuhkan 2 hal yaitu
        // address = alamat dari contract
        // ABI = application binary interface
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
        // di Class Simplestorage, menggunakan fungsi addres, untuk connect data array ke data index di simplestorageindex
        // menyimpan data simplestoragenumber ke dalam simplestorage dngn store
    }

    function sFGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
        // di Class Simplestorage, menggunakan fungsi addres, untuk connect data array ke data index di simplestorageindex
        // mengembalikan nilai simplestorage > retrieve = fungsi di simplestorage_1, yg berguna untuk menampilkan / view
    }
}
