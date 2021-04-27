//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by James Hill on 4/26/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    
    //MARK: Outles
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        EntryController.sharedInstance.fetchEntries()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    //MARK: Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedInstance.entries.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
    
        let entry = EntryController.sharedInstance.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        
        return cell
    
    }
    
    
    
    
    //MARK: Navigation:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "toEntryDetailVC" {
            guard let destinationVC = segue.destination as?
                    EntryDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else
                    {return}
            
            let entry = EntryController.sharedInstance.entries[indexPath.row]
            destinationVC.entry = entry
        
        }
    }
}//End of class

    
