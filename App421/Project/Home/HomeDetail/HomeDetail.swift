//
//  HomeDetail.swift
//  App421
//
//  Created by Вячеслав on 3/21/24.
//

import SwiftUI

struct HomeDetail: View {
    
    let index: ProjectModel
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
                    
                    Text("@\(index.channel_name ?? "")")
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
                        
                        HStack {
                            
                            Text(index.category ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding()
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            Text(index.idea ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
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
                            
                            Text("@\(index.channel_name ?? "")")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding()
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            Text("$\(index.amount)")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
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
                            
                            Text((index.starts ?? Date()).convertDate(format: "MMM d Y"))
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                        }
                        .padding()
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            Text("Ends")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Text((index.starts ?? Date()).convertDate(format: "MMM d Y"))
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                        }
                        .padding()
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .padding(.bottom)
                        
                        HStack {
                            
                            Text(index.text ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
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
            }
        }
    }
}

//#Preview {
//    HomeDetail()
//}
