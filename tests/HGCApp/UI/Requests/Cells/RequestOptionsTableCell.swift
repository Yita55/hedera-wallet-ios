//
//  RequestOptionsTableCell.swift
//  HGCApp
//
//  Created by Surendra  on 12/12/17.
//  Copyright © 2017 HGC. All rights reserved.
//

import UIKit

protocol RequestOptionsTableCellDelegate : class {
    func requestOptionsTableCellDidTapatIndex(_ cell:RequestOptionsTableCell, index:Int)
}

class RequestOptionsTableCell: UITableViewCell {
    
    @IBOutlet weak var button1 : UIButton!
    @IBOutlet weak var button2 : UIButton!
    @IBOutlet weak var button3 : UIButton!
    
    weak var delegate: RequestOptionsTableCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setTitle(_ title:String, atIndex:Int) {
        switch atIndex {
        case 0:
            button1.setTitle(title, for: .normal)
        case 1:
            button2.setTitle(title, for: .normal)
        case 2:
            button3.setTitle(title, for: .normal)
        default:
            break
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = Color.pageBackgroundColor()
        self.contentView.backgroundColor = Color.pageBackgroundColor()
    }
    
    @IBAction func handleTapOnButton(_ sender:UIButton) {
        self.delegate?.requestOptionsTableCellDidTapatIndex(self, index: sender.tag)
    }
}
