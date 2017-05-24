//
//  ViewController.swift
//  new score
//
//  Created by s20151104708 on 17/4/24.
//  Copyright © 2017年 s20151104708. All rights reserved.
//

import UIKit
var x : Int = 0
var y : Int = 0
var n : Int = 0
var m : Int = 0
var i : Int = 0
var j : Int = 0
var c : Int = 0
var k : Int = 0
var aname : String = ""
var bname : String = ""
var play : String = "发球"
var flagA : Int=0
var flagB : Int=0
var dlg : Int = 0
class ViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate{

    @IBOutlet weak var pingpang: UIImageView!
    @IBOutlet weak var Aimg: UIImageView!
    @IBOutlet weak var Bimg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    @IBAction func Aput(_ sender: UIButton) {
            flagA=1
            flagB=0
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let picker = UIImagePickerController()
                picker.delegate = self
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.present(picker, animated: true, completion: {
                    () -> Void in
                })
            }else{
                print("读取相册错误")
            }
        
      }
    @IBAction func Bput(_ sender: UIButton) {
            flagB=1
            flagA=0
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let picker = UIImagePickerController()
                picker.delegate = self
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.present(picker, animated: true, completion: {
                    () -> Void in
                })
            }else{
                print("读取相册错误")
            }
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        let image:UIImage!
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        if(flagA==1){
            Aimg.image = image
        }
        else if(flagB==1){
            Bimg.image = image
        }
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var A: UITextField!
    @IBOutlet weak var B: UITextField!
    @IBOutlet weak var X: UITextField!
    @IBOutlet weak var Y: UITextField!
    @IBOutlet weak var Z: UITextField!
    @IBOutlet weak var N: UITextField!
    @IBOutlet weak var M: UITextField!
    @IBOutlet weak var nameA: UITextField!
    @IBOutlet weak var nameB: UITextField!

    @IBAction func addinfo(_ sender: Any) {
        
            let alertController = UIAlertController(title: "系统登录", message: "请输入选手A和选手B的姓名(A选手有发球权，B选手有选场地权）", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addTextField { (textField:UITextField) in
                textField.placeholder = "选手A"
            }
            alertController.addTextField { (textField:UITextField) in
                textField.placeholder = "选手B"
            }
            
            let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
            let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default) { (UIAlertAction) in
                let nameA = alertController.textFields![0]
                let nameB = alertController.textFields![1]
                self.nameA.textAlignment = .center
                self.nameB.textAlignment = .center
                self.nameA.text = nameA.text
                self.nameB.text = nameB.text
                aname = (nameA.text!)
                bname = (nameB.text!)
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            
            
            // 弹出
            self.present(alertController, animated: true, completion: nil)
        
    }
    @IBAction func start(_ sender: Any) {
        x = 0
        y = 0
        A.text = "\(x)"
        B.text = "\(y)"
        Y.text = "0"
        Z.text = " VS "
        N.text = "0"
    }
    @IBAction func Aadd(_ sender: UIButton) {
        x = x + 1
        A.text = "\(x)"
        if x <= 10 && y<=10 {
               if( (x+y)%4==1 || (x+y)%4==2){
                    M.text = aname + play
               }
               else if((x+y)%4==3 || (x+y)%4==0){
                    M.text = bname + play
                }
        }
        if x >= 10 && y >= 10{
            if x >= y + 2{
                if((x+y)%2==0){
                    M.text = aname + play
                }
                else if((x+y)%2==1){
                    M.text = bname + play
                }
                A.text = "获  胜"
                i = i + 1
                A.text = A.text
            }
        }
        else if  x > y && x >= 11 {
            A.text = "获  胜"
            A.text = A.text
            i = i + 1
        }
    }
    @IBAction func Badd(_ sender: UIButton) {
        y = y + 1
        B.text = "\(y)"
        if x <= 10&&y<=10 {
            if (x+y)%4==1 || (x+y)%4==2{
                M.text = aname + play
            }
            else if(x+y)%4==3 || (x+y)%4==0{
                M.text = bname + play
            }
        }
        if x >= 10 && y >= 10{
            if y >= x + 2{
                if(x+y)%2==0{
                    M.text = aname + play
                }
                else if (x+y)%2==1{
                    M.text = bname + play
                }
                B.text = "获  胜"
                B.text = B.text
                j = j + 1
            }
        }
        else if  y > x && y >= 11 {
            j = j + 1
            B.text = "获  胜"
            B.text = B.text
        }
    }

    @IBAction func Aback(_ sender: UIButton) {
        A.text = "\(x)"
        x = x - 1
        A.text = "\(x)"
        if x<0{
            A.text = "\(0)"
        }
        if x <= 10&&y<=10 {
            if (x+y)%4==1 || (x+y)%4==2{
                M.text = aname + play
            }
            else if(x+y)%4==3 || (x+y)%4==0{
                M.text = bname + play
            }
        }
        if x >= 10 && y >= 10{
            if y >= x + 2{
                if(x+y)%2==0{
                    M.text = aname + play
                }
                else if (x+y)%2==1{
                    M.text = bname + play
                }
            }
        }
    }
    @IBAction func Bback(_ sender: UIButton) {
        B.text = "\(y)"
        y = y - 1
        B.text = "\(y)"
        if y<0{
            B.text = "\(0)"
        }
        if x <= 10&&y<=10 {
            if (x+y)%4==1 || (x+y)%4==2{
                M.text = aname + play
            }
            else if(x+y)%4==3 || (x+y)%4==0{
                M.text = bname + play
            }
        }
        if x >= 10 && y >= 10{
            if x >= y + 2{
                if(x+y)%2==0{
                    M.text = aname + play
                }
                else if (x+y)%2==1{
                    M.text = bname + play
                }
            }
        }
    }
    @IBAction func end(_ sender: Any) {
        x = 0
        y = 0
        c = 0
        A.text = "\(x)"
        B.text = "\(y)"
        X.text = ""
        M.text = ""
        if i >= j{
            n = n + 1
            Y.text = "\(n)"
            Z.text = " VS "
            N.text = "\(m)"
        }
        else if j >= i{
            m = m + 1
            Y.text = "\(n)"
            Z.text = " VS "
            N.text = "\(m)"
        }
    }
}
