//
//  CSStepper.swift
//  Chapter03-CSStepper
//
//  Created by N on 2021/05/02.
//

import UIKit

@IBDesignable
class CSStepper: UIControl {
    
    public var leftBtn = UIButton(type: .system)
    public var rightBtn = UIButton(type: .system)
    public var centerLable = UILabel()
    
    @IBInspectable
    public var stepValue: Int = 1
    
    @IBInspectable
    public var maximumValue: Int = 100
    
    @IBInspectable
    public var minimumValue: Int = -100
    
    @IBInspectable
    public var value: Int = 0 {
        didSet { // 프로퍼티의 값이 바뀌면 자동으로 호출된다
            self.centerLable.text = String(value)
            
            //이 클래스를 사용하는 객체들에게 valuechanged 이벤트 신호를 준다.
            self.sendActions(for: .valueChanged)
        }
    }
    
    @IBInspectable
    public var leftTitle: String = "↓" {
        didSet {
            self.leftBtn.setTitle(leftTitle, for: .normal)
        }
    }
    
    @IBInspectable
    public var rightTitle: String = "↑" {
        didSet {
            self.rightBtn.setTitle(rightTitle, for: .normal)
        }
    }
    
    @IBInspectable
    public var bgColor: UIColor = UIColor.cyan {
        didSet {
            self.centerLable.backgroundColor = backgroundColor
        }
    }
    
    
    //스토리보드에서 호출할 초기화 메서드
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    //프로그래밍 방식으로 호출할 초기화 메서드
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        let borderWidth: CGFloat = 0.5
        let borderColor = UIColor.blue.cgColor
        
        self.leftBtn.tag = -1
//        self.leftBtn.setTitle("↓", for: .normal)
        self.leftBtn.setTitle(self.leftTitle, for: .normal)
        self.leftBtn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        self.leftBtn.layer.borderWidth = borderWidth
        self.leftBtn.layer.borderColor = borderColor
        
        self.rightBtn.tag = 1
//        self.rightBtn.setTitle("↑", for: .normal)
        self.rightBtn.setTitle(self.rightTitle, for: .normal)
        self.rightBtn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = borderColor
        
        self.centerLable.text = String(value)
        self.centerLable.font = .systemFont(ofSize: 16)
        self.centerLable.textAlignment = .center
//        self.centerLable.backgroundColor = .cyan
        self.centerLable.backgroundColor = self.bgColor
        self.centerLable.layer.borderWidth = borderWidth
        self.centerLable.layer.borderColor = borderColor
        
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(self.centerLable)
        
        self.leftBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.rightBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let btnWidth = self.frame.height
        let lblWidth = self.frame.width - (btnWidth * 2)
        
        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        self.centerLable.frame = CGRect(x: btnWidth, y: 0, width: lblWidth, height: btnWidth)
        self.rightBtn.frame = CGRect(x: btnWidth + lblWidth, y: 0, width: btnWidth, height: btnWidth)
    }
    
    @objc
    public func valueChange(_ sender: UIButton) {
        let sum = self.value + (sender.tag * self.stepValue)
        
        if sum > self.maximumValue {
            return
        }
        
        if sum < minimumValue {
            return
        }
        
        self.value += (sender.tag * self.stepValue)
    }
    
}
