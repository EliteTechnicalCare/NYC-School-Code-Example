//
//  SchoolDetailView.swift
//  20220719-[DavidHakki]-NYCSchools
//
//  Created by David Hakki on 7/19/22.
//

import SwiftUI

struct SchoolDetailView: View {
    @StateObject var satVM = SATScoresViewModel()
    @State var selectedSchool: School?
    @State var showAlert = false
    
    
    var body: some View {
        VStack {
            
            
            List {
                
                if satVM.satScores?.satMath != nil && satVM.satScores?.satReading != nil && satVM.satScores?.satWriting != nil {
                    Section("SAT:") {
                        
                        if satVM.satScores?.satReading != nil {
                            SATScoreView(subjectName: "Reading", systemImageName: "book", score: satVM.satScores?.satReading ?? "")
                        }
                        
                        if satVM.satScores?.satWriting != nil {
                            SATScoreView(subjectName: "Writing", systemImageName: "pencil", score: satVM.satScores?.satWriting ?? "")
                        }
                        
                        if satVM.satScores?.satMath != nil {
                            SATScoreView(subjectName: "Math", systemImageName: "divide", score: satVM.satScores?.satMath ?? "")
                        }
                        
                    }
                }
                
                Section("School Mailing Information:") {
                    Text(selectedSchool?.school_name ?? "Missing Name")
                        .bold()
                    
                    //TODO: Attempts to extract this as a function are causing the compiler to freak out and given my limited time I will have to leave this for now.
                    if selectedSchool?.primary_address_line_1 != nil {
                        if let urlString = "maps://?address=\(selectedSchool!.primary_address_line_1)" {
                            
                            if let finalURL = URL(string: urlString.replacingOccurrences(of: " ", with: "+")) {
                                Link(destination: finalURL) {
                                    VStack {
                                        Text(selectedSchool?.primary_address_line_1 ?? "Missing Address")
                                        Text("\(selectedSchool?.city ?? "") \(selectedSchool?.state_code ?? ""), \(selectedSchool?.zip ?? "")")
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    
                    Button {
                        showAlert.toggle()
                    } label: {
                        
                    }.alert(isPresented: $showAlert) {
                        Alert(title: Text("Maps"),
                              message: Text("Lets open this up in maps!"),
                              dismissButton: .default(Text("LETS GO!"), action: {
                            //TODO
                        }))
                    }
                    
                }
            }
            
            Spacer()
            
        }
        .navigationTitle(selectedSchool?.school_name ?? "Test Academy")
        .task {
            if let dbn = selectedSchool?.dbn {
                await satVM.fetchScores(dbn: dbn)
            } else {
                //TODO: Proper error handling/alert
            }
        }
    }
}

struct SchoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SchoolDetailView(selectedSchool: nil)
        }.navigationViewStyle(.stack)
    }
}
