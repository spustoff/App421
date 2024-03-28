//
//  HomeView.swift
//  App421
//
//  Created by Вячеслав on 3/21/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 40) {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            
                            Text("$\(viewModel.projects.map(\.amount).reduce(0, +))")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .semibold))
                            
                            Text("Your Spendings")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.isChart = true
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("eurusd")
                                
                                Text("EUR/USD")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding(7)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        })
                    }
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.5)))
                .padding()
                .background(Color("prim").ignoresSafeArea())
                
                HStack {
                    
                    ForEach(viewModel.categories, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.category = index
                            viewModel.fetchProjects()
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(viewModel.category == index ? 1 : 0)))
                        })
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 3)
                .frame(height: 35)
                .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                .padding([.horizontal, .top])
                
                HStack {
                    
                    Image(viewModel.category)
                    
                    Text(viewModel.category)
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                
                if viewModel.projects.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("You don’t have any Instagram projects")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.projects, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedProjectForDetail = index
                                    viewModel.isDetailed = true
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 6, content: {
                                            
                                            Text(index.channel_name ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 17, weight: .semibold))
                                                
                                            Text((index.starts ?? Date()).convertDate(format: "MMM d Y"))
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                        })
                                        
                                        Spacer()
                                        
                                        Text("$\(index.amount)")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 19, weight: .semibold))
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                                })
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchProjects()
        }
        .sheet(isPresented: $viewModel.isChart, content: {
            
            HomeChart()
        })
        .sheet(isPresented: $viewModel.isDetailed, content: {
            
            if let index = viewModel.selectedProjectForDetail {
                
                HomeDetail(index: index)
            }
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            HomeAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
