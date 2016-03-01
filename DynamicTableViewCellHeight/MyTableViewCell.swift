//
//  MyTableViewCell.swift
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

class MyTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    var labelgap : CGFloat = 10
    var labelWidth : CGFloat = 100

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
          
        titleLabel = UILabel()
        titleLabel.frame = CGRectMake(labelgap, labelgap, 100, 30)
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFontOfSize(16.0)
        contentView.addSubview(titleLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.frame = CGRectMake(labelgap, titleLabel.frame.size.height + titleLabel.frame.origin.y, 100, 30)
        descriptionLabel.textColor = UIColor.blackColor()
        descriptionLabel.numberOfLines = 0
        contentView.addSubview(descriptionLabel)
        
     }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setLabel(label1Text : NSString, label2Text : NSString){
        titleLabel.frame = CGRectMake(labelgap, labelgap, labelWidth, 30)
        titleLabel.text = label1Text as String
        titleLabel.sizeToFit()
        descriptionLabel.frame = CGRectMake(labelgap, titleLabel.frame.size.height + titleLabel.frame.origin.y, labelWidth, 30)
        descriptionLabel.text = label2Text as String
        descriptionLabel.sizeToFit()
        descriptionLabel.frame = CGRectMake(labelgap,titleLabel.frame.origin.y + titleLabel.frame.size.height , labelWidth, descriptionLabel.frame.size.height)
    }
    
     func getCellHeight()-> CGFloat {
        return descriptionLabel.frame.size.height + descriptionLabel.frame.origin.y + labelgap*2

    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
