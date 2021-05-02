//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by N on 2021/04/26.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    
    // Weak[약한 참조]는 순한 참조 문제를 해결하기 위해 사용하는 속성
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    var subject: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.contents.delegate = self
        
        let bgImage = UIImage(named: "memo-background.png")!
        self.view.backgroundColor = UIColor(patternImage: bgImage)
        
        self.contents.layer.borderWidth = 0
        self.contents.layer.borderColor = UIColor.clear.cgColor
        self.contents.backgroundColor = .clear
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 0
        self.contents.attributedText = NSAttributedString(string: " ", attributes: [NSAttributedString.Key.paragraphStyle: style])
        self.contents.text = " "
    }
    
    //텍스트뷰의 내용이 변경될 때마다 호출되는 델리게이트
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = ((contents.length > 15) ? 15 : contents.length)
        
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        self.navigationItem.title = subject
    }

    // 저장 버튼을 클릭했을 때 호출되는 메서드
    @IBAction func save(_ sender: Any) {
        let alertV = UIViewController()
        let iconImage = UIImage(named: "warning-icon-60")
        alertV.view = UIImageView(image: iconImage)
        alertV.preferredContentSize = iconImage?.size ?? CGSize.zero
        
    
        guard self.contents.text?.isEmpty == false else {
            // 내용이 비어 있을 떄의 처리
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.setValue(alertV, forKey: "contentViewController")
            self.present(alert, animated: true)
            return
        }
        
        let data = MemoData()
        
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regdate = Date()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append(data)
        
        _ = self.navigationController?.popViewController(animated: true)
    }

    // 카메라 버튼을 클릭했을 때 호출되는 메서드
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        
        // 이미지 피커 컨트롤러 인스턴스의 델리게이트 속성을 현재의 뷰 컨트롤러 인스턴스로 설정
        picker.delegate = self
        // 이미지 피커 컨트롤러의 이미지 편집을 허용
        picker.allowsEditing = true
        
        self.present(picker, animated: false)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //선택된 이미지를 미리보기에 표시한다.
        self.preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        picker.dismiss(animated: false)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let bar = self.navigationController?.navigationBar
        let ts = TimeInterval(0.3)
        UIView.animate(withDuration: ts) {
            bar?.alpha = (bar?.alpha == 0 ? 1 : 0)
        }
    }
    
}
