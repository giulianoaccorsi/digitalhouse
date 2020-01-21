//
//  ProgressSHD.swift
//  FBSnapshotTestCase
//
//  Created by 刘振兴 on 2018/2/28.
//

import UIKit

open class ProgressSHD: UICollectionViewLayoutAttributes {
    
    struct HUDConfig {
        
       static let hudStatusFont = UIFont(name: "PingFangSC-Regular", size: 16)!
        
       static let hudStatusColor = UIColor.black
        
       static let hudSpinnerColor = UIColor(red: 251/255, green: 71/255, blue: 71/255, alpha: 1)
        
       static let hudBackgroundColor = UIColor(white: 0, alpha: 0.8)
        
       static let hudWindowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
        
    }
    
    private var hudImageSuccess:UIImage {
        let bundle = Bundle(for: ProgressSHD.self)
        return UIImage(named: "ProgressHUDSwift.bundle/progresshud-success", in: bundle, compatibleWith: nil)!
    }
    
    private var  hudImageError:UIImage {
        let bundle = Bundle(for: ProgressSHD.self)
        return UIImage(named: "ProgressHUDSwift.bundle/progresshud-error", in: bundle, compatibleWith: nil)!
    }
    
    private var window:UIWindow!
    
    private var background:UIView!
    
    private var hud:UIToolbar!
    
    private var spinner:UIActivityIndicatorView!
    
    private var image:UIImageView!
    
    private var label:UILabel!
    
    private var interaction:Bool!
    
    var keyboardHeight:CGFloat {
        var returnHeight:CGFloat = 0
        for testWindow in UIApplication.shared.windows {
            if testWindow.isKind(of: UIWindow.self) == false {
                for possibleKeyboard in testWindow.subviews {
                    if possibleKeyboard.description.hasPrefix("<UIPeripheralHostView") {
                        returnHeight =  possibleKeyboard.bounds.size.height
                        break
                    }else if possibleKeyboard.description.hasPrefix("<UIInputSetContainerView") {
                        for hostKeyboard in possibleKeyboard.subviews {
                            if hostKeyboard.description.hasPrefix("<UIInputSetHost") {
                                returnHeight = hostKeyboard.frame.size.height
                                break
                            }
                        }
                    }
                }
            }
        }
        return returnHeight
    }
    
    private override init() {
        super.init()
        self.frame = UIScreen.main.bounds
        if  let delegate = UIApplication.shared.delegate {
            if let rootWindow = delegate.window {
                window = rootWindow
            }else{
                window = UIApplication.shared.keyWindow
            }
        }
        self.alpha = 0
    }
    
    
    /// 单例类
    class var shared:ProgressSHD {
        struct ProgressSHDWrapper {
            static let singleton = ProgressSHD()
        }
        return ProgressSHDWrapper.singleton
    }
    
    // MARK:- 共有实现方法
    open class func dismiss() {
        self.shared.hudHide()
    }
    
    open class func show(_ status:String?){
        self.shared.interaction = true
        self.shared.hudMake(status, img: nil, spin: true, hide: false)
    }
    
    open class func show(_ status:String?,_ interaction:Bool){
        self.shared.interaction = interaction
        self.shared.hudMake(status, img: nil, spin: true, hide: false)
    }
    
    open class func showSuccess(_ status:String?){
        self.shared.interaction = true
        self.shared.hudMake(status, img: self.shared.hudImageSuccess, spin: false, hide: true)
    }
    
    open class func showSuccess(_ status:String?,_ interaction:Bool){
        self.shared.interaction = interaction
        self.shared.hudMake(status, img: self.shared.hudImageSuccess, spin: false, hide: true)
    }
    
    open class func showError(_ status:String?){
        self.shared.interaction = true
        self.shared.hudMake(status, img: self.shared.hudImageError, spin: false, hide: true)
    }
    
    open class func showError(_ status:String?,_ interaction:Bool){
        self.shared.interaction = interaction
        self.shared.hudMake(status, img: self.shared.hudImageError, spin: false, hide: true)
    }
    
    
    // MARK:- 私有实现方法
    private func hudMake(_ status:String?,img:UIImage?,spin:Bool,hide:Bool){
        self.hudCreate()
        label.text = status
        label.isHidden = status == nil ? true : false
        image.image = img
        image.isHidden = img == nil ? true : false
        if spin {
            spinner.startAnimating()
        }else {
            spinner.stopAnimating()
        }
        self.hudSize()
        self.hudPosition(nil)
        self.hudShow()
        if hide {
            self.timedHide()
        }
    }
    
    private func hudCreate() {
        if hud == nil {
            hud = UIToolbar.init(frame: .zero)
            hud.isTranslucent = true
            hud.backgroundColor = HUDConfig.hudBackgroundColor
            hud.layer.cornerRadius = 10
            hud.layer.masksToBounds = true
            self.registerNotifications()
        }
        
        if hud.superview == nil {
            if interaction == false {
                background = UIView.init(frame: window.frame)
                background.backgroundColor = HUDConfig.hudWindowColor
                window.addSubview(background)
                background.addSubview(hud)
            }else{
                window.addSubview(hud)
            }
        }
        
        if spinner == nil {
            spinner = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
            spinner.color = HUDConfig.hudSpinnerColor
            spinner.hidesWhenStopped = true
        }
        if spinner.superview == nil {
            hud.addSubview(spinner)
        }
        
        if image == nil {
            image = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 28, height: 28))
        }
        
        if image.superview == nil {
            hud.addSubview(image)
        }
        
        if label == nil {
            label = UILabel(frame: .zero)
            label.font = HUDConfig.hudStatusFont
            label.textColor = HUDConfig.hudStatusColor
            label.backgroundColor = UIColor.clear
            label.textAlignment = .center
            label.baselineAdjustment = .alignCenters
            label.numberOfLines = 0
        }
        if label.superview == nil {
            hud.addSubview(label)
        }
    }
    
    private func hudSize() {
        var labelRect:CGRect = .zero
        var hudWidth = 100
        var hudHeight = 100
        
        if label.text != nil {
            let attributes = [NSAttributedStringKey.font:label.font!]
            let options:NSStringDrawingOptions = [.usesFontLeading,.truncatesLastVisibleLine,.usesLineFragmentOrigin]
            labelRect = NSString.init(string:label.text!).boundingRect(with: CGSize.init(width: 200, height: 300) , options: options, attributes: attributes, context: nil)
            labelRect.origin.x = 12
            labelRect.origin.y  = 66
            hudWidth = Int(labelRect.size.width + 24)
            hudHeight = Int(labelRect.size.height + 80)
            
            if hudWidth < 100 {
                hudWidth = 100
                labelRect.origin.x = 0
                labelRect.size.width = 100
            }
        }
        
        hud.bounds = CGRect(x: 0, y: 0, width: hudWidth, height: hudHeight)
        let imagex:CGFloat = CGFloat(hudWidth / 2)
        let imagey:CGFloat = CGFloat(label.text == nil ? hudHeight/2 : 36)
        let center = CGPoint(x: imagex, y: imagey)
        image.center = center
        spinner.center = center
        label.frame = labelRect
    }
    
    @objc private func hudPosition(_ notification:Notification?){
        var heightKeyboard:CGFloat = 0
        var duration:TimeInterval = 0.0
        if let noti = notification {
            let info = noti.userInfo
            let keyboard:CGRect = info![UIKeyboardFrameEndUserInfoKey] as! CGRect
            duration = info![UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
            if noti.name == NSNotification.Name.UIKeyboardWillShow || noti.name == NSNotification.Name.UIKeyboardDidShow {
                heightKeyboard = keyboard.size.height
            }
        } else {
            heightKeyboard = self.keyboardHeight
        }
        let screen = UIScreen.main.bounds
        let center = CGPoint(x: screen.size.width/2, y: (screen.size.height-heightKeyboard)/2)
        UIView.animate(withDuration: duration, delay: 0, options: .allowUserInteraction, animations: {
            self.hud.center = CGPoint(x: center.x, y: center.y)
        }, completion: nil)
        if background != nil {
            background.frame = window.frame
        }
    }
    
    private func hudShow() {
        if self.alpha == 0 {
            self.alpha = 1
            hud.alpha = 0
            hud.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
            let options:UIViewAnimationOptions = [.allowUserInteraction,.curveEaseOut]
            UIView.animate(withDuration: 0.15, delay: 0, options: options, animations: {
                self.hud.transform = CGAffineTransform(scaleX: 1/1.4, y: 1/1.4)
                self.hud.alpha = 1
            }, completion: nil)
        }
    }
    
    private func hudHide(){
        if self.alpha == 1 {
            let options:UIViewAnimationOptions = [.allowUserInteraction,.curveEaseIn]
            UIView.animate(withDuration: 0.15, delay: 0, options: options, animations: {
                self.hud.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                self.hud.alpha = 0
            }, completion: { (finished) in
                self.hudDestroy()
                self.alpha = 0
            })
        }
    }
    
    private func hudDestroy() {
        NotificationCenter.default.removeObserver(self)
        if label != nil {
            label.removeFromSuperview()
            label = nil
        }
        if image != nil {
            image.removeFromSuperview()
            image = nil
        }
        if spinner != nil {
            spinner.removeFromSuperview()
            spinner = nil
        }
        if hud != nil {
            hud.removeFromSuperview()
            hud = nil
        }
        if background != nil {
            background.removeFromSuperview()
            background = nil
        }
    }
    
    @objc private func timedHide() {
        let sleep = 1 * 0.04 + 0.5
        let deadlineTime = DispatchTime.now() + sleep
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.hudHide()
        }
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(hudPosition(_:)), name: Notification.Name.UIApplicationDidChangeStatusBarOrientation, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hudPosition(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hudPosition(_:)), name: Notification.Name.UIKeyboardDidHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hudPosition(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hudPosition(_:)), name: Notification.Name.UIKeyboardDidShow, object: nil)
        
    }
    
}
