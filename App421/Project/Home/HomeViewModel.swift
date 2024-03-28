//
//  HomeViewModel.swift
//  App421
//
//  Created by Вячеслав on 3/21/24.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @Published var projects: [ProjectModel] = []
    
    @Published var isAdd: Bool = false
    @Published var isDetailed: Bool = false
    @Published var isChart: Bool = false
    
    @Published var selectedProjectForDetail: ProjectModel? = nil
    
    @Published var categories: [String] = ["Instagram", "Youtube", "Facebook"]
    @Published var category: String = "Instagram"
    
    @Published var idea: String = ""
    
    @Published var channel_name: String = ""
    @Published var amount: String = ""
    
    @Published var starts: Date = Date()
    @Published var ends: Date = Date()
    
    @Published var text: String = ""
    
    func addProject() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ProjectModel", into: context) as! ProjectModel
        
        loan.category = category
        loan.idea = idea
        loan.channel_name = channel_name
        loan.amount = Int16(amount) ?? 0
        loan.starts = starts
        loan.ends = ends
        loan.text = text
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchProjects() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ProjectModel>(entityName: "ProjectModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.projects = result.filter{$0.category == category}
            
        } catch _ as NSError {
            
            self.projects = []
        }
    }
}
