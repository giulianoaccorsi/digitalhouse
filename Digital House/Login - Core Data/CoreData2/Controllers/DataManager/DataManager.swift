//
//  DataManager.swift
//  CoreData2
//
//  Created by Giuliano Accorsi on 19/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
import CoreData
    //: MARK - Data Manager
class DataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreData2")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    var arrayUsers:[User] = []
    var user: User?
    
    
    
    
    func loadData(completion: ([User]?)->Void) {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let results = try context.fetch(fetchRequest)
            arrayUsers = results as? [User] ?? []
            completion(arrayUsers)
        }catch {
            print("Erro loadData() - DataManager")
            completion(nil)
        }
    }
    
    func registerUser(name: String, password: String, email: String,birth: String, completion:(Bool) -> Void) {
        let context = persistentContainer.viewContext
        let person = User(context: context)
        
        person.name = name
        person.password = password
        person.email = email
        person.birth = birth
        
        if email == "a@a.com" {
            person.isAdmin = true
        }else {
            person.isAdmin = false
        }
        
        
        do {
            try context.save()
            print("Deu bom !!")
            arrayUsers.append(person)
            completion(true)
        }catch {
            print("Deu Ruim !! registerUser() - DataManager")
            completion(false)
        }
        
    }
    
    func deleteUser(id: NSManagedObjectID, completion: (Bool)-> Void) {
        let context = persistentContainer.viewContext
        let user = context.object(with: id)
        context.delete(user)
        
        do {
            try context.save()
            completion(true)
        }catch {
            print("Erro deleteUser() - DataManager")
            completion(false)
        }
        
    }
    
    func checkAdmin(email: String) -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "email = %@ AND isAdmin = %d", email, true)
        let results = try? context.fetch(fetchRequest) as? [User]
        
        if results?.count ?? 0 > 0 {
            return true
        }else {
            return false
        }
    }
    
    func searchEmailExist(email: String) -> Bool{
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        let results = try? context.fetch(fetchRequest) as? [User]
        
        if results?.count ?? 0 > 0 {
            return true
        }else {
            return false
        }
    }
    
    func updateUser(name: String, password: String, email: String,birth: String, completion:(Bool) -> Void) {
        
        if let userObtido = self.user {
            let context = persistentContainer.viewContext
            let person = context.object(with: userObtido.objectID) as? User
            
            person?.name = name
            person?.password = password
            person?.email = email
            person?.birth = birth
            
            
            do {
                self.user = person
                try context.save()
                print("Deu bom !! updateUser() - DataManager")
                completion(true)
            }catch {
                print("Deu Ruim !! updateuser() - DataManager")
                completion(false)
            }

        }
    }
    
    func searchUser(email: String, password: String, completion: (User?, Bool, String) -> Void){
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email,password)
        let results = try? context.fetch(fetchRequest) as? [User]
        
        if results?.count ?? 0 > 0 {
            completion(results?.first,true,"")
        }else {
            completion(nil,false,"Wrong Password")
        }
    }
}



