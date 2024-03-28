//
//  IdeasView.swift
//  App421
//
//  Created by Вячеслав on 3/21/24.
//

import SwiftUI

struct IdeasView: View {
    
    @StateObject var viewModel = IdeasViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Ideas")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom)
                    .background(Color("prim").ignoresSafeArea())
                
                HStack {
                    
                    ForEach(viewModel.tabs, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.currentTab = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(viewModel.currentTab == index ? 1 : 0)))
                        })
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 3)
                .frame(height: 35)
                .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                .padding([.horizontal, .top])
                
                if viewModel.ideas.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("You don’t have any ideas")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.currentTab == "All" ? viewModel.ideas : viewModel.ideas.filter{viewModel.idea_favorites.contains($0.idea_name ?? "")}, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 7, content: {
                                        
                                        Text(index.category ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(6)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                        
                                        Text(index.idea_name ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .semibold))
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(1)
                                        
                                        Text(index.text ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(1)
                                    })
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        if viewModel.idea_favorites.contains(index.idea_name ?? "") {
                                            
                                            if let indexer = viewModel.idea_favorites.firstIndex(of: index.idea_name ?? "") {
                                                
                                                viewModel.idea_favorites.remove(at: indexer)
                                            }
                                            
                                        } else {
                                            
                                            viewModel.idea_favorites.append(index.idea_name ?? "")
                                        }
                                        
                                    }, label: {
                                        
                                        Image(systemName: viewModel.idea_favorites.contains(index.idea_name ?? "") ? "star.fill" : "star")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 16, weight: .regular))
                                    })
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            }
                        }
                        .padding()
                    }
                }
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .bold))
                            .frame(width: 60, height: 60)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            .padding()
                    })
                }
            }
        }
        .onAppear {
            
            viewModel.fetchIdeas()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            IdeasAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    IdeasView()
}
