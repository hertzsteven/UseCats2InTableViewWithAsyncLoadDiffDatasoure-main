    //
    //  UIView+Ext.swift
    //  LearnCollectionVCWithAsyncImages
    //
    //  Created by Steven Hertz on 5/31/22.
    //

import UIKit
    // By extending UIView all the subclasses will get this help

extension UIView {
    
    
    /** Supplying the SuperView **/
    
        // if want to use a view to pin to that is not the the superview
    func pinToLeadingTrailing(to superView: UIView, spacingFrom multiplier: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalToSystemSpacingAfter: superView.leadingAnchor, multiplier: multiplier).isActive = true
        trailingAnchor.constraint(equalToSystemSpacingAfter: superView.trailingAnchor, multiplier: multiplier).isActive = true
    }
    
        // if want to use a view to pin to that is not the the superview
    func pinToTopBottom(to superView: UIView, spacingFrom multiplier: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalToSystemSpacingBelow: superView.topAnchor, multiplier: multiplier).isActive = true
        bottomAnchor.constraint(equalToSystemSpacingBelow: superView.bottomAnchor, multiplier: multiplier).isActive = true
    }
    
    
        // if want to use a view to pin to that is not the the superview
    func pinToSides(to superView: UIView, spacingFrom multiplier: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        pinToLeadingTrailing(to: superView, spacingFrom: multiplier)
        pinToTopBottom(to: superView, spacingFrom: multiplier)
    }
    
    /** it figures out the superview itself **/
    
    
        // if want to use the superviewto pin it to
    func pinToLeadingTrailingOfsuperView(spacingFrom multiplier: CGFloat = 0) {
        guard let superView = self.superview else {return}
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalToSystemSpacingAfter: superView.leadingAnchor, multiplier: multiplier).isActive = true
        superView.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: multiplier).isActive = true
    }
    
        // if want to use the superviewto pin it to
    func pinToTopBottomOfsuperView(spacingFrom multiplier: CGFloat = 0) {
        guard let superView = self.superview else {return}
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalToSystemSpacingBelow: superView.topAnchor, multiplier: multiplier).isActive = true
        superView.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: multiplier).isActive = true
    }
    
        // if want to use the superviewto pin it to
    func pinToSidesOfsuperView(spacingFrom multiplier: CGFloat = 0) {
        guard let superView = self.superview else {return}
        translatesAutoresizingMaskIntoConstraints = false
        pinToLeadingTrailingOfsuperView(spacingFrom: multiplier)
        pinToTopBottomOfsuperView(spacingFrom: multiplier)
    }
    
        // probably needs to resize it first
    func centerOfsuperView() {
        guard let superView = self.superview else {return}
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }
    
        // just to the resize as a percentage
    func sizeAsPctOfsuperView(pctOfSuperView multiplier: CGFloat) {
        guard multiplier < 1 else {return}
        guard let superView = self.superview else {return}
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: superView.widthAnchor, multiplier: multiplier).isActive = true
        heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: multiplier).isActive = true
    }
    
        // resize and center it
    func sizeAsPctOfsuperViewAndCenter(pctOfSuperView multiplier: CGFloat ) {
        translatesAutoresizingMaskIntoConstraints = false
        guard multiplier < 1 else {return}
            // size it
        sizeAsPctOfsuperView(pctOfSuperView: multiplier)
            // center it
        centerOfsuperView()
    }
    
}

