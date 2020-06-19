//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 本田卓也 on 2020/06/18.
//  Copyright © 2020 takuya.honda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var susumuTop: UIButton!
    @IBOutlet weak var modoruTop: UIButton!
    @IBOutlet weak var saiseitesiTop: UIButton!
    
    
    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer!
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    /// 表示している画像の番号    var dispImageNo = 0
     var dispImageNo = 0
    
        // 画像の名前の配列
    let imageNameArray = [
    "galaxy-3279274__340.jpg",
    "temple-4687909__340.jpg",
    "medieval-276019__340.jpg",
    ]
    
     /// 表示している画像の番号を元に画像を表示する
    func display(){
  
             // 表示している画像の番号から名前を取り出し
            let name = imageNameArray[dispImageNo]
        
            // 画像を読み込み
            let image = UIImage(named: name)
          
        // Image Viewに読み込んだ画像をセット
            imageView.image = image
        
    
    // 画像の番号が正常な範囲を指しているかチェック

    // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 3
        }
     // 範囲より上を指している場合、最初の画像を表示
    if dispImageNo > 3 {
            dispImageNo = 0
        }
    }
    
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "galaxy-3279274__340.jpg")
        imageView.image = image
    }
       
    //進むボタン IBAction
    @IBAction func susumu(_ sender: Any) {
        
        if dispImageNo < imageNameArray.count - 1 {
                
            // 表示している画像の番号を1増やす
                   dispImageNo += 1
                   // 表示している画像の番号を元に画像を表示する
                   display()
         }
         
         else {
                   dispImageNo = 0
                   display()
               }
    }
     // 戻るボタン IBAction
    @IBAction func modoru(_ sender: Any) {
        
        if dispImageNo  >= 1 && dispImageNo  <= imageNameArray.count - 1  {
            // 表示している画像の番号を1減らす
            dispImageNo -= 1
            // 表示している画像の番号を元に画像を表示する
            display()
        }  else {
            dispImageNo = imageNameArray.count - 1
            display()
        }
    }
    
    //再生/停止ボタン　IBAction
    @IBAction func saiseiteisi(_ sender: Any) {
        
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
            if self.timer == nil {
                   self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
          
         // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
                susumuTop.isEnabled = false
                   modoruTop.isEnabled = false
                   // ボタンの名前を停止とする
                   saiseitesiTop.setTitle("停止", for: .normal)
                   // 背景色・ボタン内テキストサイズを変更
                   self.view.backgroundColor = UIColor.lightGray
                   saiseitesiTop.titleLabel?.font =
                   UIFont.systemFont(ofSize: 25)
                   
               } else if self.timer != nil {
                   // タイマーを停止
                   self.timer.invalidate()
                   // nil にして再び再生(nil の時にタイマー生成)
                   self.timer = nil
                   // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
                   susumuTop.isEnabled = true
                   modoruTop.isEnabled = true
                   // ボタンの名前を再生とする
                   saiseitesiTop.setTitle("再生", for: .normal)
                   // 背景色・ボタン内テキストサイズを戻す
                   self.view.backgroundColor = UIColor.white
                   saiseitesiTop.titleLabel?.font =
                   UIFont.systemFont(ofSize: 20)
               }
           }
    
     // selector: #selector(updatetimer(_:)) で指定された関数
           // timeInterval: 2, repeats: true で指定された通り、2秒毎に呼び出され続ける
           @objc func updateTimer(_ timer: Timer) {
            
            // 進むボタンの内容を行う
            if dispImageNo < imageNameArray.count - 1 {
                // 表示している画像の番号を1増やす
                dispImageNo += 1
                // 表示している画像の番号を元に画像を表示する
                display()
                print(dispImageNo) // 取得インデックスの確認
            } else {
                dispImageNo = 0
                display()
                print(dispImageNo) // 取得インデックスの確認
            }
       }
    
      @IBAction func unwind(_ segue: UIStoryboardSegue) {
      }
    
    @IBAction func onTapAction(_ sender: Any) {
       self.performSegue(withIdentifier: "toZoomIn", sender: nil)
    }
    
    // 遷移元から遷移先にデータ(画像)を渡す
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のResultViewControllerのインスタンスを取得する
            let ResultViewController:ResultViewController = segue.destination as! ResultViewController
            // 表示している画像の番号から名前を取り出し
            let name = imageNameArray[dispImageNo]
            // 画像を読み込み
            let image = UIImage(named: name)
            
    
            ResultViewController.selectedImg = image
        }
    }
        
        
    
    


