//
//  Extensions.swift
//  NasserPharmacy
//
//  Reviewd by Kamal abdelmonem on 15/8/22.
//
//

import Foundation
import UIKit
import SVProgressHUD

func showLoading() {
    SVProgressHUD.setDefaultStyle(.light)
    SVProgressHUD.setDefaultAnimationType(.flat)
    SVProgressHUD.setDefaultMaskType(.none)
    SVProgressHUD.setMinimumSize(CGSize(width: 44, height: 44))
    SVProgressHUD.setImageViewSize(CGSize(width: 44, height: 44))
    SVProgressHUD.setBorderColor(.clear)
    SVProgressHUD.setBackgroundColor(.clear)
    SVProgressHUD.setForegroundColor(UIColor(named: "Main") ?? .gray)
    SVProgressHUD.setBackgroundLayerColor(.clear)
    SVProgressHUD.setOffsetFromCenter(UIOffset(horizontal: UIScreen.main.bounds.width/2, vertical: UIScreen.main.bounds.height/2))
    SVProgressHUD.show()
}
func showForceLoading() {
    SVProgressHUD.setDefaultStyle(.light)
    SVProgressHUD.setDefaultAnimationType(.flat)
    SVProgressHUD.setDefaultMaskType(.clear)
    SVProgressHUD.setMinimumSize(CGSize(width: 44, height: 44))
    SVProgressHUD.setImageViewSize(CGSize(width: 44, height: 44))
    SVProgressHUD.setBorderColor(.clear)
    SVProgressHUD.setBackgroundColor(.clear)
    SVProgressHUD.setForegroundColor(UIColor(named: "Main") ?? .gray)
    SVProgressHUD.setBackgroundLayerColor(.clear)
    SVProgressHUD.setOffsetFromCenter(UIOffset(horizontal: UIScreen.main.bounds.width/2, vertical: UIScreen.main.bounds.height/2))
    SVProgressHUD.show()
}

func hideLoading() {
    SVProgressHUD.dismiss()
}

extension UIView {
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue

            clipsToBounds = layer.shadowRadius>0 ? true:false
            self.layer.masksToBounds = clipsToBounds ? false:true


        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {

           // self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: newValue).cgPath
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shadowOffset : CGSize{

        get{
            return layer.shadowOffset
        }set{

            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor : UIColor{
        get{
            return UIColor.init(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity : Float {

        get{
            return layer.shadowOpacity
        }
        set {

            layer.shadowOpacity = newValue

        }
    }       
    
    func showShadow()
    {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2, height: 3)
        self.layer.shadowRadius = 3
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}



func isIPad() -> Bool {
    return UIDevice.current.userInterfaceIdiom == .pad
}



class RoundShadowView: UIView {
  
    private var shadowLayer: CAShapeLayer!
     
    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
          //print("corner radius =\(cornerRadius)")
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = (UIColor.white).cgColor
          shadowLayer.cornerRadius = cornerRadius
            shadowLayer.shadowColor = shadowColor.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = shadowOffset
            shadowLayer.shadowOpacity = shadowOpacity
            shadowLayer.shadowRadius = shadowRadius
            shadowLayer.masksToBounds = false
            layer.insertSublayer(shadowLayer, at: 0)
        }
        self.layer.cornerRadius = self.cornerRadius
        self.layer.shadowColor = self.shadowColor.cgColor
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowOpacity = self.shadowOpacity

    }
}


class ShadowView: UIView {
    
    /**
    Masks the layer to it's bounds and updates the layer properties and shadow path.
    */
    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.masksToBounds = false

        self.updateProperties()
        self.updateShadowPath()
    }

    /**
    Updates all layer properties according to the public properties of the `ShadowView`.
    */
    fileprivate func updateProperties() {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.shadowColor = self.shadowColor.cgColor
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowOpacity = self.shadowOpacity
    }

    /**
    Updates the bezier path of the shadow to be the same as the layer's bounds, taking the layer's corner radius into account.
    */
    fileprivate func updateShadowPath() {
        self.layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
    }

    /**
    Updates the shadow path everytime the views frame changes.
    */
    override func layoutSubviews() {
        super.layoutSubviews()

        self.updateShadowPath()
    }
}



class DropShadowView: UIView {
    var presetCornerRadius : CGFloat = 30.0
    
    /*
     once the bounds of the drop shadow view (container view) is initialized,
     the bounds variable value will be set/updated and the
     setupShadow method will run
     */
    override var bounds: CGRect {
        didSet {
            setupShadowPath()
        }
    }
    
    private func setupShadowPath() {
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: presetCornerRadius).cgPath
        
    }

}

class RotatableView: UIView {

    @IBInspectable var rotation: Double = 0 {
        didSet {
            rotateButton(rotation: rotation)
        }
    }

    func rotateButton(rotation: Double)  {
        self.transform = CGAffineTransform(rotationAngle: CGFloat( (rotation * .pi)/180))
    }
}




