//
//  SATScoreView.swift
//  20220719-[DavidHakki]-NYCSchools
//
//  Created by David Hakki on 7/19/22.
//

import SwiftUI

struct SATScoreView: View {
    @State var subjectName = ""
    @State var systemImageName = ""
    @State var score = ""
    
    var body: some View {
        HStack {
            Label(subjectName, systemImage: systemImageName)
                .bold()
            Spacer()
            Text(score)
        }
    }
}

struct SATScoreView_Previews: PreviewProvider {
    static var previews: some View {
        SATScoreView()
    }
}
