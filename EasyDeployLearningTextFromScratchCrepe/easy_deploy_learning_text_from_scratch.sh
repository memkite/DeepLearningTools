#!/bin/bash

function InstallTorch {
    date
    echo "Installing torch, qtlua and qttorch with ezinstall and luarocks"
    git clone https://github.com/torch/ezinstall
    cd ezinstall
    ./install-all.sh
    luarocks install qtlua
    luarocks install qttorch
    cd ..
}

function InstallCrepeAndDBPediaDataSet {
    date
    echo "Installing Crepe"
    git clone git@github.com:zhangxiangxiao/Crepe.git
    cd Crepe
    echo "Downloading dbpedia dataset"
    cd data
    # wget .. dbpedia.tar.gz
    # tar -xvf dbpedia.tar.gz
    qlua csv2t7b.lua -input dbpedia_csv/train.csv -output train.t7b
    qlua csv2t7b.lua -input dbpedia_csv/test.csv -output test.t7b
    cd ..
}

function StartCrepeTrainingWithDBPediaDataSet {
    cd train
    qlua main.lua
}

function main {
    date
    echo "start easy_deploy_learning_text_from_scratch.sh"
    InstallTorch
    InstallCrepeAndDBPediaDataSet
    StartCRepeTRainingWithDBPediaDataSet
}



