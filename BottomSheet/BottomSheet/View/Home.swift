//
//  Home.swift
//  BottomSheet
//
//  Created by recherst on 2021/10/5.
//

import SwiftUI
import MapKit

struct Home: View {
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2789),
        latitudinalMeters: 10000,
        longitudinalMeters: 10000
    )
    @State var offset: CGFloat = 0

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            Map(coordinateRegion: $region)
                .ignoresSafeArea(.all, edges: .all)
            // To read frame height
            GeometryReader { reader in
                VStack {
                    BottomSheet(offset: $offset, value: (-reader.frame(in: .global).height + 150))
                        .offset(y: reader.frame(in: .global).height - 140)
                    // Adding gesture
                        .offset(y: offset)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    withAnimation {
                                        // Check the dirction of scroll
                                        // Scroll upwards
                                        // Use startLocation bcz translation will change when we drag up and down
                                        if value.startLocation.y > reader.frame(in: .global).midX {
                                            if value.translation.height < 0 && offset > (-reader.frame(in: .global).height + 150) {
                                                offset = value.translation.height
                                            }
                                        }

                                        if value.startLocation.y < reader.frame(in: .global).midX {
                                            if value.translation.height > 0 && offset < 0 {
                                                offset = (-reader.frame(in: .global).height + 150) + value.translation.height
                                            }
                                        }
                                    }
                                })
                                .onEnded({ value in
                                    withAnimation {
                                        // Check and pull up the screen
                                        if value.startLocation.y > reader.frame(in: .global).midX {
                                            if -value.translation.height > reader.frame(in: .global).midX {
                                                offset = (-reader.frame(in: .global).height + 150)
                                                return
                                            }

                                            offset = 0
                                        }

                                        if value.startLocation.y < reader.frame(in: .global).midX {
                                            if value.translation.height < reader.frame(in: .global).midX {
                                                offset = (-reader.frame(in: .global).height + 150)
                                                return
                                            }

                                            offset = 0
                                        }
                                    }
                                })
                        )

                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
