//
//  ProfileDetailView.swift
//  WhatsAppHeroAnimation
//
//  Created by recherst on 2021/8/12.
//

import SwiftUI

struct ProfileDetailView: View {
    var  animation: Namespace.ID
    @EnvironmentObject var profileData: ProfileDetailModel
    var body: some View {
        // Since we clearing the data
        if profileData.selectedProfile != nil {
            if profileData.showEnlargedImage {
                Image(profileData.selectedProfile.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: profileData.selectedProfile.id, in: animation)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("bg").ignoresSafeArea())

                // Top action area
                HStack(spacing: 20) {
                    Button(action: {
                        // Close view
                        withAnimation {
                            profileData.showEnlargedImage.toggle()
                            profileData.showProfile.toggle()
                            profileData.selectedProfile = nil
                        }
                    }, label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    })

                    Text(profileData.selectedProfile.userName)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        // Matched geomtry effect
                        .matchedGeometryEffect(
                            id: "TEXT_\(profileData.selectedProfile.id)",
                            in: animation
                        )

                    Spacer()
                }
                .padding()
                
            } else {
                // Make it as button to enlarge big image
                Button(action: {
                    // Triggering enlarge image
                    withAnimation(.easeInOut) {
                        profileData.showEnlargedImage.toggle()
                    }
                }, label: {
                    Image(profileData.selectedProfile.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay(
                            TitleView(
                                recent: profileData.selectedProfile,
                                animation: animation
                            )
                            , alignment: .top
                        )
                })
                .overlay(BottomAction().offset(y: 50), alignment: .bottom)
                .matchedGeometryEffect(id: profileData.selectedProfile.id, in: animation)
                .frame(width: 300, height: 300)
                // Background color
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color("bg")
                        .opacity(0.2)
                        .ignoresSafeArea()
                        // Closing when tapping on background
                        .onTapGesture {
                            withAnimation {
                                profileData.showProfile.toggle()
                                profileData.selectedProfile = nil
                            }
                        }
                )
            }
        }
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleView: View {

    var recent: Profile
    var animation: Namespace.ID

    var body: some View {
        Text(recent.userName)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(1)
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("bg").opacity(0.35))
            .matchedGeometryEffect(
                id: "TEXT_\(recent.id)",
                in: animation
            )
    }
}

struct BottomAction: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "message.fill")
                    .font(.title2)
                    .foregroundColor(Color("green"))
            })

            Spacer(minLength: 30)

            Button(action: {}, label: {
                Image(systemName: "info.circle.fill")
                    .font(.title2)
                    .foregroundColor(Color("green"))
            })
        }
        .padding(.horizontal, 60)
        // default frame
        .frame(height: 50)
        .background(Color.white)
    }
}
