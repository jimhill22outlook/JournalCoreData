//
//  EntryController.swift
//  JournalCoreData
//
//  Created by James Hill on 4/26/21.
//

import CoreData

class EntryController {
    
    //MAKK: Properties
    
    static let sharedInstance = EntryController()
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
  
    //MARK: Functions
    func createEntry(title: String, bodyText: String) {
        let entry = Entry(title: title, bodytext: bodyText)
        entries.append(entry)
        
        CoreDataStack.saveContext()
        
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(entries.count)
        
    }
    
    func updateEntry(_ entry: Entry) {
        CoreDataStack.saveContext()
    }
    
    func deleteEntry() {
        
    }
    
}//EndOfclass

