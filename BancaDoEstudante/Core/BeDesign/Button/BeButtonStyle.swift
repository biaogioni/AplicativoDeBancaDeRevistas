//
//  BeButtonStyle.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 27/08/23.
//

import UIKit

public enum BeButtonStyle {
    case buttonContainedSimpleDefault
    case buttonOutlinedSimpleDefault

//    // MARK: Fonts
//    public var font: UIFont {
//        return WIFontStyle.f16PrimaryMedium.font
//    }
    
    // MARK: Sizes
    public var height: CGFloat {
        return 48
    }
    
    public var borderWidth: CGFloat {
        return 2
    }
    
    public var cornerRadius: CGFloat {
        return 18
    }
    
    // MARK: Colors
    public var enabledTextColor: UIColor {
        switch self {
        case .buttonContainedSimpleDefault, .buttonOutlinedSimpleDefault:
            return UIColor.white
        }
    }
    
    public var disabledTextColor: UIColor {
        return UIColor.white
    }
    
    public var highlightedTextColor: UIColor {
        switch self {
        case .buttonContainedSimpleDefault, .buttonOutlinedSimpleDefault:
            return UIColor.lightGray
        }
    }
    
    public var enabledBorderColor: CGColor {
        switch self {
        case .buttonContainedSimpleDefault, .buttonOutlinedSimpleDefault:
            return UIColor.clear.cgColor
        }
    }
    
    public var disabledBorderColor: CGColor {
        switch self {
        case .buttonContainedSimpleDefault, .buttonOutlinedSimpleDefault:
            return UIColor.gray.cgColor
        }
    }
    
    public var highlightedBorderColor: CGColor {
        switch self {
        case .buttonOutlinedSimpleDefault, .buttonContainedSimpleDefault:
            return UIColor.clear.cgColor
        }
    }
    
    public var enabledBackgroundColor: UIColor {
        switch self {
        case .buttonContainedSimpleDefault, .buttonOutlinedSimpleDefault:
            return UIColor.systemBlue
        }
    }
    
    public var disabledBackgroundColor: UIColor {
        switch self {
        case .buttonContainedSimpleDefault, .buttonOutlinedSimpleDefault:
            return UIColor.clear
        }
    }
    
    public var highlightedBackgroundColor: UIColor {
        switch self {
        case .buttonContainedSimpleDefault, .buttonOutlinedSimpleDefault:
            return UIColor.clear
        }
    }
}
