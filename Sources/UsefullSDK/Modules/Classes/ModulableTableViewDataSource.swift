//
//  ModulableTableViewDataSource.swift
//  
//
//  Created by Burak Uzunboy on 25.01.20.
//

import UIKit

public class ModulableTableViewDataSource: NSObject, UITableViewDataSource {
    
    var tableView: UITableView {
        didSet {
            self.tableView.dataSource = self
            self.register(tableView: self.tableView)
        }}
    
    var contents: [[CellModuleInitializable]] {
        didSet {
            self.tableView.reloadData()
        }}
    
    init(tableView: UITableView, contents: [[CellModuleInitializable]]) {
        self.tableView = tableView
        self.contents = contents
        super.init()
        
        self.register(tableView: tableView)
        self.tableView.reloadData()
    }
    
    func register(tableView: UITableView) {
        self.contents.forEach { (section) in
            section.forEach { (module) in
                module.cellType.register(to: tableView)
            }
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.contents.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contents.get(section)?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        
        guard let content = self.contents.get(indexPath.section)?.get(indexPath.row) else { return defaultCell }
        
        if let content = content as? TextCellModule {
            let cell = content.cell.initialize(for: tableView, indexPath: indexPath)
            cell.module = content
            return cell
        }
        
        return defaultCell
    }
    
}
