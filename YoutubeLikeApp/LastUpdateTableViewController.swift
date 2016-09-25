//
//  LastUpdateTableViewController.swift
//  YoutubeLikeApp
//
//  Created by Frezy Stone Mboumba on 9/25/16.
//  Copyright © 2016 MaranathApp. All rights reserved.
//

import UIKit

struct StretchyHeader {
    
    fileprivate let headerHeight: CGFloat = 410
    fileprivate let headerCut: CGFloat = 50
    
}


class LastUpdateTableViewController: UITableViewController {

    var headerView: UIView!
    var newHeaderLayer: CAShapeLayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setNewValue()
    }
    
    func updateView() {
        tableView.backgroundColor = UIColor.white
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        newHeaderLayer = CAShapeLayer()
        newHeaderLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = newHeaderLayer
        
        let newHeight = StretchyHeader().headerHeight - StretchyHeader().headerCut/2
        
        tableView.contentInset = UIEdgeInsets(top: newHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -newHeight)
        setNewValue()
    }
    
    func setNewValue() {
        
        let newHeight = StretchyHeader().headerHeight - StretchyHeader().headerCut/2
        var getHeaderFrame = CGRect(x: 0, y: -newHeight, width: tableView.bounds.width, height: StretchyHeader().headerHeight)
        
        if tableView.contentOffset.y < newHeight {
            getHeaderFrame.origin.y = tableView.contentOffset.y
            getHeaderFrame.size.height = -tableView.contentOffset.y + StretchyHeader().headerCut/2
        }
        
        headerView.frame = getHeaderFrame
        let cutDirection = UIBezierPath()
        cutDirection.move(to: CGPoint(x: 0, y: 0))
        cutDirection.addLine(to: CGPoint(x: getHeaderFrame.width, y: 0))
        cutDirection.addLine(to: CGPoint(x: getHeaderFrame.width, y: getHeaderFrame.height))
        cutDirection.addLine(to: CGPoint(x: 0, y: getHeaderFrame.height - StretchyHeader().headerCut))
        newHeaderLayer.path = cutDirection.cgPath
        
    }

    
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    
}
