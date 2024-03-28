//
//  IdeasViewModel.swift
//  App421
//
//  Created by Вячеслав on 3/21/24.
//

import SwiftUI
import CoreData

final class IdeasViewModel: ObservableObject {
    
    @Published var ideas: [IdeaModel] = []
    @Published var isAdd: Bool = false
    
    @AppStorage("idea_favorites") var idea_favorites: [String] = []
    
    @Published var tabs: [String] = ["All", "Favorites"]
    @Published var currentTab: String = "All"
    
    @Published var categories: [String] = ["Instagram", "Youtube", "Facebook"]
    @Published var category: String = ""
    
    @Published var idea_name: String = ""
    @Published var text: String = ""
    @Published var objective: String = ""
    @Published var ideal_for: String = ""
    @Published var success_metrics: String = ""
    
    func addIdea() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "IdeaModel", into: context) as! IdeaModel
        
        loan.category = category
        loan.idea_name = idea_name
        loan.text = text
        loan.objective = objective
        loan.ideal_for = ideal_for
        loan.success_metrics = success_metrics
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchIdeas() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<IdeaModel>(entityName: "IdeaModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.ideas = result
            
        } catch _ as NSError {
            
            self.ideas = []
        }
    }
}
