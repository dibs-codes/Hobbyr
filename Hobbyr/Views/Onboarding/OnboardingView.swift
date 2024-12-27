//
//  OnboardingView.swift
//  Hobbyr
//
//  Created by DibsCodes  on 27/12/24.
//

import SwiftUI

struct OnBoarding {
    var id: Int
    var title: String
    var description: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    static let all = [
        OnBoarding(id: 1, title: "This is the title of the onboarding", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis", imageName: "onboarding_image_1"),
        OnBoarding(id: 2, title: "This is the title of the onboarding 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis", imageName: "onboarding_image_2"),
        OnBoarding(id: 3, title: "This is the title of the onboarding 3", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis", imageName: "onboarding_image_3"),
        OnBoarding(id: 4, title: "This is the title of the onboarding 4", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis", imageName: "onboarding_image_4"),
    ]
}
struct OnboardingView: View {
    let onboardingArray = OnBoarding.all
    @State var selection = 0
    @State var navigateToDashboard = false
    
    var body: some View {
        VStack(spacing: 60) {
            TabView(selection: $selection) {
                ForEach(onboardingArray, id: \.id) { item in
                    Tab(value: item.id - 1) {
                        VStack(spacing: 40){
                            VStack {
                                item.image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 277)
                            }
                            .frame(maxWidth: .infinity)
                            .background(
                                Image("background_shape")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 486)
                            )
                            IndicatorView(numberOfItems: onboardingArray.count, selection: selection)
                            VStack(spacing: 20){
                                Text(item.title)
                                    .foregroundStyle(Color.textPrimary)
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text(item.description)
                                    .foregroundStyle(Color.textSecondary)
                                    .fontWeight(.medium)
                            }
                            .padding(.horizontal, 38)
                            .multilineTextAlignment(.center)
                        }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            HStack(spacing: 30){
                Button {
                    navigateToDashboard.toggle()
                } label: {
                    Spacer()
                    Text("Skip")
                        .foregroundStyle(Color.active)
                    Spacer()
                }
                Button {
                    if selection < onboardingArray.count - 1 {
                        selection = selection + 1
                    } else {
                        navigateToDashboard.toggle()
                    }
                } label: {
                    Spacer()
                    Text(selection < onboardingArray.count - 1 ? "Next" : "Get Started")
                        .padding()
                        .foregroundStyle(Color.white)
                    Spacer()
                }
                .background(Color.active)
                .cornerRadius(10)
            }
            .fontWeight(.bold)
            .padding(.horizontal, 24)
            .padding(.bottom, 10)
        }
        .background(.white)
        .navigationDestination(isPresented: $navigateToDashboard) {
            DashboardView()
        }
    }
}

#Preview {
    OnboardingView()
}
