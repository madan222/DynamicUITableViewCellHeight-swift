//
//  ViewController.swift
//  swiftPractic
//
//  Created by Madan on 01/03/16.
//  Copyright © 2016 Madan. All rights reserved.
//
//  https://github.com/madan222/DynamicUITableViewCellHeight-swift
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var label: UILabel!
    let cellIdentifier = "Cell"
    var myTableView = UITableView()
    var titleArray = NSMutableArray()
    var discriptionArray = NSMutableArray()
    var cellArray = NSMutableArray()
    
    override func viewDidLoad() {
        
        
        
        myTableView = UITableView(frame: CGRectMake(0, 20, view.frame.size.width, view.frame.height - 20), style: .Plain)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.bounces = false
        myTableView.showsVerticalScrollIndicator = false
        myTableView.separatorColor = UIColor.clearColor()
        myTableView.backgroundColor = UIColor(red: 0xd5 / 255.0, green: 0xd5 / 255.0, blue: 0xd5 / 255.0, alpha: 1)
        view.addSubview(myTableView)
        
        titleArray = NSMutableArray(array: ["Title 1","Title 2","Title 3","Title 4","Title 5","Title 6"])
        
        
        discriptionArray = NSMutableArray(array: ["Cras libero tortor, tempus in luctus quis, euismod et libero. Donec sed tellus dictum dui egestas imperdiet. Donec vel interdum dolor. Quisque ex dui, efficitur quis mauris sit amet, ornare sagittis lectus. Quisque ac fringilla leo. Morbi vitae est suscipit, scelerisque est eu, auctor ligula. Pellentesque pretium rutrum mi vel blandit. Mauris vel magna at nisi venenatis cursus. Donec sollicitudin enim est, sed posuere eros faucibus sed. Pellentesque faucibus ultricies libero, in pharetra ligula maximus a.",
            "Donec feugiat eros consequat arcu vulputate, vitae tincidunt magna rutrum. Nam eu est pellentesque, fringilla magna eget, ultrices nunc. Mauris et vehicula libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas tempus fringilla augue posuere rutrum. Nullam faucibus est sed porttitor feugiat. Donec finibus posuere nibh at ullamcorper. Phasellus blandit ullamcorper eros. Praesent congue tortor arcu.",
            "Vivamus sed orci dui. Proin eu neque nec mauris egestas fringilla ac nec justo. Integer eu magna facilisis, luctus metus a, auctor neque. Integer condimentum faucibus nunc, ut viverra diam eleifend in. Morbi consectetur quis leo vel blandit. Aliquam mi lectus, volutpat et nulla nec, congue lobortis nulla. Donec tristique ac diam sit amet tincidunt. Cras tellus augue, fringilla a erat et, tincidunt imperdiet urna. Nullam efficitur urna odio, ut pulvinar dolor consequat id. Proin a sodales magna, pulvinar feugiat ex. Etiam ultrices vulputate cursus. Sed vestibulum vel eros ut tempor. Maecenas ullamcorper, magna non faucibus consequat, est arcu commodo mi, volutpat sodales purus massa quis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut quis sollicitudin elit. Aliquam sed ex id libero vehicula congue ut vel ex.",
            "Vivamus pulvinar eget tellus ac bibendum. Cras facilisis tempus est, et ornare sem placerat vel. In tempor vitae leo sit amet tristique. Proin nec consequat sem, bibendum aliquet nisi. Integer eget magna eget mauris imperdiet ultricies et eu eros. Ut vehicula, urna et congue fermentum, lacus mi egestas nunc, non maximus risus tellus et lorem. Maecenas semper nisi ut rhoncus malesuada. Curabitur placerat, nunc pellentesque sollicitudin maximus, est orci tempus mi, ac cursus justo risus ut erat. Sed in finibus tortor, ac suscipit neque. Curabitur dapibus tincidunt molestie. Vestibulum efficitur vel ex scelerisque ultricies. Vestibulum molestie suscipit ante et eleifend. Vestibulum auctor lorem faucibus odio condimentum placerat.",
            "Suspendisse potenti. In velit nisi, venenatis ut sagittis dignissim, placerat pellentesque nibh. Praesent tellus ligula, mattis id auctor nec, lobortis porta purus. ",
            " lobortis porta purus. Cras leo neque, tincidunt eget congue dapibus, lacinia in augue. Donec velit justo, fermentum et nulla eget, egestas eleifend velit. Phasellus efficitur justo ullamcorper aliquet tincidunt. Donec vehicula vehicula turpis, vitae euismod nisi convallis eget.",
            
            ])
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let cell = MyTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellIdentifier")
        cell.labelgap = 10;
        cell.labelWidth = view.frame.size.width - cell.labelgap*2
        cell .setLabel(titleArray[indexPath.row] as! NSString, label2Text: discriptionArray[indexPath.row] as! NSString)
        cellArray .addObject(cell)
        return cell.getCellHeight()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellArray[indexPath.row] as! UITableViewCell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}

