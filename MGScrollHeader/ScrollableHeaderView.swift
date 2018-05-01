//
//  ScrollableHeaderView.swift
//  MGScrollHeader
//
//  Created by Mike Gopsill on 01/05/2018.
//  Copyright © 2018 Mike Gopsill. All rights reserved.
//

import UIKit

class ScrollableHeaderView: UIView {
    
    private var backgroundImageView: UIImageView?
    private var title: UILabel?
    private var subtitle: UILabel?
    
    // TODO: Possibly add states so headerview can have two states
    // TODO: Allow injection of a background view
    // TODO: Possibly allow configuration of constraints
    
    // MARK: Initialisers
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init(frame: CGRect,
         backgroundImageView: UIImageView? = nil,
         title: UILabel? = nil,
         subtitle: UILabel? = nil) {
        
        self.backgroundImageView = backgroundImageView
        self.title = title
        self.subtitle = subtitle
        super.init(frame: frame)
        
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        setupBackground()
        setupTitle()
        setupSubtitle()
        setupConstraints()
    }
    
    private func setupBackground() {
        if backgroundImageView == nil {
            backgroundImageView = UIImageView(image: nil)
        }
    }
    
    private func setupTitle() {
        if title == nil {
            title = UILabel()
            defaultTitle()
        }
    }
    
    private func defaultTitle() {
        guard let title = title else { return }
        title.text = "Let there be a title!"
        title.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin)
        title.textAlignment = .center
    }
    
    private func setupSubtitle() {
        if subtitle == nil {
            subtitle = UILabel()
            defaultSubtitle()
        }
    }
    
    private func defaultSubtitle() {
        guard let subtitle = subtitle else { return }
        subtitle.text = "A beautiful day for a subtitle."
        subtitle.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        subtitle.textAlignment = .center
    }
    
    private func setupConstraints() {
        guard let backgroundImageView = backgroundImageView, let title = title, let subtitle = subtitle else { return }
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundImageView)
        addSubview(title)
        addSubview(subtitle)
        
        let constraints:[NSLayoutConstraint] = [
            self.heightAnchor.constraint(equalToConstant: 254.0),
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 134.0),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10.0),
            subtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    // Public Methods
    
    public func updateLabelsAlpha(with alpha: CGFloat) {
        title?.textColor = title?.textColor.withAlphaComponent(alpha)
        subtitle?.textColor = subtitle?.textColor.withAlphaComponent(alpha)
        backgroundImageView?.alpha = alpha
    }
}
