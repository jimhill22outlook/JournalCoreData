//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by James Hill on 4/26/21.
//

import CoreData

extension Entry {
    
    @discardableResult convenience init (title: String, bodytext: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
            self.title = title
            self.bodytext = bodytext
            self.timeStamp = timestamp
        }
        
    
    
    
    
    
}//End of Extension
