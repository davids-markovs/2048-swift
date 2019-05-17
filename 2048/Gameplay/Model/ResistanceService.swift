//
//  ResistanceService.swift
//  2048
//
//  Created by Davids Markovs on 05.04.19.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//

import Foundation
import CoreData

class ResistanceService {

	private init() {}

	static var context: NSManagedObjectContext {
		return persistentContainer.viewContext
	}

	static var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "_048")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()
	static func saveContext () {
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				let nserror = error as NSError
				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
			}
		}
	}
}
