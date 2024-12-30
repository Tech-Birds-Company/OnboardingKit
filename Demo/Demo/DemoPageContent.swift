//
//  DemoPageContent.swift
//  Demo
//
//  Created by Daniel Saidi on 2024-05-28.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import OnboardingKit
import SwiftUI

struct DemoPageContent: View {

    @Binding
    var index: Int
    let info: OnboardingPageInfo<LocalizedOnboarding.Page>

    @Environment(\.dismiss)
    private var dismiss

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 50) {
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.yellow)
                    image
                }
                .padding(.horizontal, 16)

                .frame(height: geometry.size.height  * 2/3)
                VStack(alignment: .leading, spacing: 16) {
                    Text(info.page.title)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    Text(info.page.text)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)

            }
            .safeAreaInset(edge: .bottom, content: {
                ZStack {
                    Color.init(uiColor: UIColor(red: 162/255, green: 86/255, blue: 217/255, alpha: 1))
                        .cornerRadius(8)
                        .frame(height: 50)
                    Button(info.isLastPage ? "Done" : "Next") {
                        if info.isLastPage { return dismiss() }
                        withAnimation {
                            index += 1
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .tint(.white)
                    .shadow(radius: 1, y: 1)
                    .padding()
                }
                .frame(height: 50)
                .padding()
            })
            .background()
            .animation(.bouncy, value: index)
        }
    }
}

private extension DemoPageContent {

    var image: some View {
        Image(systemName: "\(info.pageIndex).circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {

    struct Preview: View {

        @State
        private var index = 0

        var body: some View {
            ZStack {
                Color.red.ignoresSafeArea()
                    .onTapGesture {
                        withAnimation { index += 1 }
                    }

                DemoPageContent(
                    index: $index,
                    info: .init(
                        page: .init(
                            title: "Добро пожаловать",
                            text: "Храните весь свой гардероб",
                            imageName: "onboarding.demo-flow.0.image"
                        ),
                        pageIndex: 1,
                        currentPageIndex: index,
                        totalPageCount: 2
                    )
                )
            }
        }
    }

    return Preview()
}
