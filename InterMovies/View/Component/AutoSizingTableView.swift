//
//  AutoSizingTableView.swift
//  InterMovies
//
//  Created by Wladmir Edmar Silva Junior on 11/08/21.
//

import UIKit

public class AutoSizingTableView: UITableView {
    override public var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override public func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.setNeedsLayout()
    }

    override public var intrinsicContentSize: CGSize {
        setNeedsLayout()

        return CGSize(width: contentSize.width, height: contentSize.height)
    }
}
