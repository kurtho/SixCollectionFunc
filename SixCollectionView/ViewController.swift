//
//  ViewController.swift
//  SixCollectionView
//
//  Created by KurtHo on 2016/8/4.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import MapKit
import MessageUI

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MFMailComposeViewControllerDelegate {



    
    
    @IBAction func testButton(sender: AnyObject) {
        
        
    }
    
    var contents = [
        "顯示一個Alert View",
        "顯示一個Achtion Sheet",
        "撥打電話到117",
        "開啟此app在ios的設定頁面",
        "打開地圖app導覽到AlphaCamp",
        "開啟信箱並將標題填上”測試信件”"
    ]
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.myLabel.text = contents[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
        case 0:
            optionMenu()
            print("000000")
            break
        case 1:
            alertView()
            print("111!11")
            break
        case 2:
            
            break
        case 3:
            
            break
        case 4:
            
            break
        case 5:
            mailing()
            break
        default:
            break
        }
        
        
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake((self.view.frame.size.width / 2) - 15, (self.view.frame.size.width) - 120)
    }
    

   

    
    func optionMenu() {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    

    func alertView() {
        let alert = UIAlertController(title: "Alert", message: "123", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    func mailing() {
        let mail = MFMailComposeViewController()
        let mailController = MFMailComposeViewController()
        mail.setSubject("測試信件")
        self.presentViewController(mail, animated: true, completion: nil)
        mailController.mailComposeDelegate = self

    }

    func mailComposeController(controller:
        MFMailComposeViewController, didFinishWithResult result:
        MFMailComposeResult, error: NSError?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    

    

}









