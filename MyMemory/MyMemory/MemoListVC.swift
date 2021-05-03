//
//  MemoListVC.swift
//  MyMemory
//
//  Created by N on 2021/04/26.
//

import UIKit

class MemoListVC: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let revealVC = self.revealViewController() {
            let btn = UIBarButtonItem()
            btn.image = UIImage(named: "sidemenu.png")
            btn.target = revealVC
            btn.action = #selector(revealVC.revealToggle(_:))
            
            self.navigationItem.leftBarButtonItem = btn
            
            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
    }

    // 디바이스 스크린에 뷰 컨트롤러가 나타날 때마다 호출되는 메서드
    // 1. 다른 화면으로 이동했다가 다시 목록으로 돌아왔을때
    // 2. 홈버튼을 눌러 앱이 백그라운드 모드로 내려간 후 다시 활성화되었을 때
    // 3. 기타 상황으로 뷰 컨트롤러가 스크린에 표시될 때
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 테이블 뷰의 Cell 개수를 결정하는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let count = self.appDelegate.memoList.count
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.appDelegate.memoList[indexPath.row]
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regdate?.text = formatter.string(from: row.regdate!)
        
        return cell
    }
    
    // 테이블의 행을 선택했을 때 호출되는 메서드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = self.appDelegate.memoList[indexPath.row]
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else {
            return
        }
        
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
  

}
