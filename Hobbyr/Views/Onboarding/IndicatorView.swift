//
//  IndicatorView.swift
//  Hobbyr
//
//  Created by DibsCodes  on 27/12/24.
//

import SwiftUI


struct IndicatorView: View {
    let numberOfItems: Int
    let selection: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfItems, id: \.self){ item in
                if selection == item {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.active)
                        .frame(width: 28, height: 6)
                } else {
                    Circle()
                        .fill(Color.inactive)
                        .frame(width: 6, height: 6)
                }
            }
        }
    }
}

#Preview {
    IndicatorView(numberOfItems: 4, selection: 0)
}
