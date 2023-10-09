//
//  BEButton.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 27/08/23.
//

import UIKit

public class BeButton: UIButton {
    private var buttonStyle: BeButtonStyle = .buttonContainedSimpleDefault
    private var buttonAction: (() -> Void)?
    
    override public var isEnabled: Bool {
        didSet {
            backgroundColor = self.isEnabled ? buttonStyle.enabledBackgroundColor : buttonStyle.disabledBackgroundColor
            layer.borderColor = self.isEnabled ? buttonStyle.enabledBorderColor : buttonStyle.disabledBorderColor
            self.setTitleColor(self.isEnabled ?
                buttonStyle.enabledTextColor : buttonStyle.disabledTextColor, for: .normal)
            self.imageView?.tintColor = self.isEnabled ? buttonStyle.enabledTextColor : buttonStyle.disabledTextColor
        }
    }
    
    override open var isHighlighted: Bool {
        didSet {
            guard isEnabled else { return }
            backgroundColor = self.isHighlighted ? buttonStyle.highlightedBackgroundColor : buttonStyle.enabledBackgroundColor
            layer.borderColor = self.isHighlighted ? buttonStyle.highlightedBorderColor : buttonStyle.enabledBorderColor
            self.setTitleColor(buttonStyle.highlightedTextColor, for: .highlighted)
            self.tintColor = buttonStyle.highlightedTextColor
            self.imageView?.tintColor = self.isHighlighted ? buttonStyle.highlightedTextColor : buttonStyle.enabledTextColor
            self.titleLabel?.alpha = 1.0
        }
    }
    
    convenience init(_ style: BeButtonStyle = .buttonContainedSimpleDefault,
        title: String = "") {
        self.init()
        setStyle(style, title: title)
    }
    
    public func setStyle(_ style: BeButtonStyle = .buttonContainedSimpleDefault,
                         title: String = "") {
        buttonStyle = style

        setTitle(title, for: .normal)
        backgroundColor = buttonStyle.enabledBackgroundColor
        layer.borderColor = buttonStyle.enabledBorderColor
        setTitleColor(buttonStyle.enabledTextColor, for: .normal)
        layer.borderWidth = style.borderWidth
        layer.cornerRadius = style.cornerRadius
        
        guard let titleLabel = titleLabel else { return }
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
    }

    public func setAction(_ action: (() -> Void)?) {
        buttonAction = action
        self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc
    private func touchUpInside() {
        buttonAction?()
    }
}
