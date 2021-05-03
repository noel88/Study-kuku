//
//  SidebarViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by Xiah Lee on 2021/05/03.
//

import UIKit

class SidebarViewController: UITableViewController {
    
    let titles = [
        "메뉴 01",
        "메뉴 02",
        "메뉴 03",
        "메뉴 04",
        "메뉴 05"
    ]
    
    let icons = [
        UIImage(named: "icon01.png"),
        UIImage(named: "icon02.png"),
        UIImage(named: "icon03.png"),
        UIImage(named: "icon04.png"),
        UIImage(named: "icon05.png")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accountLabel = UILabel()
        accountLabel.frame = CGRect(x: 10, y: 30, width: self.view.frame.width, height: 30)
        
        accountLabel.text = "sqlpro@naver.com"
        accountLabel.textColor = .white
        accountLabel.font = .boldSystemFont(ofSize: 15)
        
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
        v.backgroundColor = .brown
        v.addSubview(accountLabel)
        
        self.tableView.tableHeaderView = v
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //재사용 큐로브터 테이블 셀을 꺼내온다.
        let id = "menucell"
        //재사용 큐에 menucell키로 등록된 테이블 뷰 셀이 없다면 새로 추가한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: id)
//        }
        
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        
        cell.textLabel?.font = .systemFont(ofSize: 14)
        
        return cell
    }
    
}
