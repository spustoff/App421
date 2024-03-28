//
//  IdeasAdd.swift
//  App421
//
//  Created by Вячеслав on 3/21/24.
//

import SwiftUI

struct IdeasAdd: View {
    
    @StateObject var viewModel: IdeasViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.gray.opacity(0.3))
                    .frame(width: 50, height: 5)
                    .padding(.top)
                
                ZStack {
                    
                    Text("Add Idea")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 10, weight: .bold))
                                .frame(width: 20, height: 20)
                                .background(Circle().fill(.gray.opacity(0.7)))
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        Menu {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.category = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Text(index)
                                        
                                        if viewModel.category == index {
                                            
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                })
                            }
                            
                        } label: {
                            
                            HStack {
                                
                                Text(viewModel.category.isEmpty ? "Category" : viewModel.category)
                                    .foregroundColor(viewModel.category.isEmpty
                                                     ? .gray : .black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                            }
                            .padding()
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            .padding(.bottom)
                        }
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Idea Name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.idea_name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.idea_name)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding()
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Description")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.text.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.text)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding()
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .padding(.bottom)
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Objective")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.objective.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.objective)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding()
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Ideal For")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.ideal_for.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.ideal_for)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding()
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Success Metrics")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.success_metrics.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.success_metrics)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding()
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .padding(.bottom)
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addIdea()
                    viewModel.fetchIdeas()
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.category = ""
                    viewModel.idea_name = ""
                    viewModel.text = ""
                    viewModel.objective = ""
                    viewModel.ideal_for = ""
                    viewModel.success_metrics = ""
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding()
                })
                .opacity(viewModel.category.isEmpty || viewModel.idea_name.isEmpty || viewModel.text.isEmpty || viewModel.objective.isEmpty || viewModel.ideal_for.isEmpty || viewModel.success_metrics.isEmpty ? 0.5 : 1)
                .disabled(viewModel.category.isEmpty || viewModel.idea_name.isEmpty || viewModel.text.isEmpty || viewModel.objective.isEmpty || viewModel.ideal_for.isEmpty || viewModel.success_metrics.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    IdeasAdd(viewModel: IdeasViewModel())
}
