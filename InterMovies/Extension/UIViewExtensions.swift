//
//  UIViewExtensions.swift
//  InterMovies
//
//  Created by Wladmir Edmar Silva Junior on 11/08/21.
//

import UIKit

public enum Metrics {
    /// margin: 4
    public static let nano: CGFloat = 4
    /// margin: 8
    public static let tiny: CGFloat = 8
    /// margin: 12
    public static let little: CGFloat = 12
    /// margin: 16
    public static let small: CGFloat = 16
    /// margin: 24
    public static let medium: CGFloat = 24
    /// margin: 32
    public static let large: CGFloat = 32
    /// margin: 48
    public static let big: CGFloat = 48
    /// margin: 64
    public static let huge: CGFloat = 64
}

extension UIView {

    /// Constraints to its superview
    ///
    /// - Parameters:
    ///   - top: Top constant. Default value is 0.
    ///   - leading: Leading constant. Default value is 0.
    ///   - trailing: Trailing constant. Default value is 0.
    ///   - bottom: Bottom constant. Default value is 0.
    public func constraintToSuperview(top: CGFloat = 0,
                                      leading: CGFloat = 0,
                                      trailing: CGFloat = 0,
                                      bottom: CGFloat = 0,
                                      bottomPriority: UILayoutPriority = .required) {

        guard let superview = self.superview else {
            return
        }
        let bottomConstraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom)

        let constraints = [
            topAnchor.constraint(equalTo: superview.topAnchor, constant: top),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailing),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading),
            bottomConstraint
        ]

        bottomConstraint.priority = bottomPriority
        NSLayoutConstraint.activate(constraints)
    }

    @discardableResult
    public func topTo(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    public func topToGreater(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    public func topToLess(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    public func bottomTo(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let bottom = bottomAnchor.constraint(equalTo: anchor, constant: -constant)
        bottom.priority = priority
        bottom.isActive = true
        return self
    }

    @discardableResult
    public func bottomToGreater(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant).isActive = true
        return self
    }

    @discardableResult
    public func bottomToLess(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant).isActive = true
        return self
    }

    @discardableResult
    public func leadingTo(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let leading = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        leading.priority = priority
        leading.isActive = true
        return self
    }

    @discardableResult
    public func leadingToGreater(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    public func leadingToLess(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    public func trailingTo(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        let trailing = trailingAnchor.constraint(equalTo: anchor, constant: -constant)
        trailing.priority = priority
        trailing.isActive = true
        return self
    }

    @discardableResult
    public func trailingToGreater(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant).isActive = true
        return self
    }

    @discardableResult
    public func trailingToLess(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant).isActive = true
        return self
    }

    @discardableResult
    public func centerXTo(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    public func centerYTo(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    public func centerInView(_ viewParent: UIView) -> UIView {
        centerXTo(viewParent.centerXAnchor)
        centerYTo(viewParent.centerYAnchor)
        return self
    }

    @discardableResult
    public func width(_ constant: CGFloat) -> UIView {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    public func width(_ anchor: NSLayoutDimension) -> UIView {
        widthAnchor.constraint(equalTo: anchor).isActive = true
        return self
    }

    @discardableResult
    public func width(_ anchor: NSLayoutDimension, multipler: CGFloat = 1.0) -> UIView {
        widthAnchor.constraint(equalTo: anchor, multiplier: multipler).isActive = true
        return self
    }

    @discardableResult
    public func height(_ constant: CGFloat, priority: UILayoutPriority = .required) -> UIView {
        let height = heightAnchor.constraint(equalToConstant: constant)
        height.priority = priority
        height.isActive = true
        return self
    }

    @discardableResult
    public func height(_ anchor: NSLayoutDimension) -> UIView {
        heightAnchor.constraint(equalTo: anchor).isActive = true
        return self
    }

    @discardableResult
    public func height(_ anchor: NSLayoutDimension, multipler: CGFloat = 1.0) -> UIView {
        heightAnchor.constraint(equalTo: anchor, multiplier: multipler).isActive = true
        return self
    }
}
