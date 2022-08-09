//
//  ContentView.swift
//  20220719-[DavidHakki]-NYCSchools
//
//  Created by David Hakki on 7/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSheet = false
    @StateObject var schoolVM = SchoolViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(schoolVM.schools, id: \.dbn) { school in
                    VStack(alignment: .leading) {
                        Text(school.school_name)
                            .bold()
                        
                        Text(school.primary_address_line_1)
                            .font(.footnote)
                            .bold()
                        
                        Button {
                            showSheet.toggle()
                        } label: {
                            Text("Show Details")
                                .italic()
                        }
                        .buttonStyle(.borderedProminent)
                        .sheet(isPresented: $showSheet) {
                            SchoolDetailView(selectedSchool: school)
                        }
                    }
                }
            }
            .navigationTitle("NYC Schools")
            .task {
                await schoolVM.fetchSchools()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
