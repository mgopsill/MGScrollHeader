//
//  TableViewControllerWithHeader.swift
//  MGScrollHeader
//
//  Created by Mike Gopsill on 01/05/2018.
//  Copyright © 2018 Mike Gopsill. All rights reserved.
//

import UIKit

public class TableViewControllerWithHeader: UIViewController {
    
    var scrollableHeaderView: ScrollableHeaderView!
    var tableView: UITableView!
    
    var scrollableHeaderViewTopConstraint: NSLayoutConstraint!
    private let constraintRangeForHeaderView = (CGFloat(-190)..<CGFloat(0))
    private let constraintRangeForHeaderTransparency = (CGFloat(-130)..<CGFloat(-30))
    
    
    // MARK: Override Methods
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupTableView()
        setupConstraints()
    }
    
    // MARK: Setup
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.frame = view.bounds
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    private func setupHeader(){
        let height = constraintRangeForHeaderView.upperBound - constraintRangeForHeaderView.lowerBound
        scrollableHeaderView = ScrollableHeaderView(height: height)
        view.addSubview(scrollableHeaderView)
    }
    
    private func setupConstraints() {
        let constraints:[NSLayoutConstraint] = [
            scrollableHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollableHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollableHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: scrollableHeaderView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}


extension TableViewControllerWithHeader: UITableViewDelegate {
    
     public func scrollViewDidScroll(_ scrollView: UIScrollView) {        
        scrollableHeaderViewTopConstraint = view.constraints[0]
        
        // Compress the top view
        if scrollableHeaderViewTopConstraint.constant > constraintRangeForHeaderView.lowerBound && scrollView.contentOffset.y > 0 {
            scrollableHeaderViewTopConstraint.constant -= scrollView.contentOffset.y
            scrollView.contentOffset.y -= scrollView.contentOffset.y
        }
        
        if scrollableHeaderViewTopConstraint.constant > constraintRangeForHeaderView.upperBound {
            scrollableHeaderViewTopConstraint.constant = constraintRangeForHeaderView.upperBound
        }
        
        // Expand the top view
        if scrollableHeaderViewTopConstraint.constant < constraintRangeForHeaderView.upperBound && scrollView.contentOffset.y < 0 {
            scrollableHeaderViewTopConstraint.constant -= scrollView.contentOffset.y
            scrollView.contentOffset.y -= scrollView.contentOffset.y
        }
        
        if scrollableHeaderViewTopConstraint.constant < constraintRangeForHeaderView.lowerBound {
            scrollableHeaderViewTopConstraint.constant = constraintRangeForHeaderView.lowerBound
        }
        
        if scrollableHeaderViewTopConstraint.constant < constraintRangeForHeaderTransparency.upperBound && scrollableHeaderViewTopConstraint.constant > constraintRangeForHeaderTransparency.lowerBound {
            let constraintRange = constraintRangeForHeaderTransparency.upperBound - constraintRangeForHeaderTransparency.lowerBound
            let transparencyRange = scrollableHeaderViewTopConstraint.constant - constraintRangeForHeaderTransparency.lowerBound
            let alpha: CGFloat =  transparencyRange / constraintRange
            scrollableHeaderView.updateLabelsAlpha(with: alpha)
        }
        
        if scrollableHeaderViewTopConstraint.constant > constraintRangeForHeaderTransparency.upperBound {
            scrollableHeaderView.updateLabelsAlpha(with: CGFloat(1.0))
        }
        
        if scrollableHeaderViewTopConstraint.constant < constraintRangeForHeaderTransparency.lowerBound {
            scrollableHeaderView.updateLabelsAlpha(with: CGFloat(0.0))
        }
    }
}
