//
//  HomeAdd.swift
//  App421
//
//  Created by Вячеслав on 3/21/24.
//

import SwiftUI

struct HomeAdd: View {
    
    @StateObject var viewModel: HomeViewModel
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
                    
                    Text("Add Project")
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
                        }
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Idea")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.idea.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.idea)
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
                                
                                Text("Channel Name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.channel_name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.channel_name)
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
                                
                                Text("Amount")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.amount.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.amount)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
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
                            
                            Text("Starts")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker(selection: $viewModel.starts, displayedComponents: .date, label: {})
                                .labelsHidden()
                        }
                        .padding()
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            Text("Ends")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker(selection: $viewModel.ends, displayedComponents: .date, label: {})
                                .labelsHidden()
                        }
                        .padding()
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .padding(.bottom)
                        
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
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addProject()
                    viewModel.fetchProjects()
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.idea = ""
                    viewModel.channel_name = ""
                    viewModel.amount = ""
                    
                    viewModel.starts = Date()
                    viewModel.ends = Date()
                    
                    viewModel.text = ""
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding()
                })
                .opacity(viewModel.idea.isEmpty || viewModel.channel_name.isEmpty || viewModel.amount.isEmpty || viewModel.text.isEmpty ? 0.5 : 1)
                .disabled(viewModel.idea.isEmpty || viewModel.channel_name.isEmpty || viewModel.amount.isEmpty || viewModel.text.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    HomeAdd(viewModel: HomeViewModel())
}
