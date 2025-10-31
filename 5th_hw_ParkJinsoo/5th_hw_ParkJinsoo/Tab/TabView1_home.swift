//
//  TabViewHome.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/27/25.
//
import SwiftUI
import Observation

struct TabView1_home: View {
    @State private var path = NavigationPath()
    @State private var moneyContainer = MoneyContainer()
    @State private var infoContainer = InfoContainer()
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                Color.gray.opacity(0.1).ignoresSafeArea()
                    
                VStack{
                    Row1_todo()
                    List{
                        Section { Row2_teeth()
                                .listRowInsets(EdgeInsets()) }
                        Section { Row3_tossbank()
                                .listRowInsets(EdgeInsets()) }
                        Section { Row4_banklist(path: $path, moneyContainer: moneyContainer) }
                        Section { Row5_march()
                                .listRowInsets(EdgeInsets()) }
                        Section { Row6_mycreditscore()
                                .listRowInsets(EdgeInsets()) }
                        Section { Row7_70thousand()
                                .listRowInsets(EdgeInsets()) }
                        Section(header:Text("박진수님을 위해 준비했어요")
                            .font(.system(size:17.3)))
                            { Row8_forJinsoo()
                                .listRowInsets(EdgeInsets()) }
                        Section { Row9_myreceipt()
                                .listRowInsets(EdgeInsets()) }
                        Section { Row10_hidemyasset()
                                .listRowInsets(EdgeInsets()) }
                                .listRowBackground(Color.clear)
                        
                    } //List
                    .listSectionSpacing(10)
                    
                } //VStackAll
            } //ZStackAll
            
            .navigationDestination(for: String.self){ value in
                if value == "TabView1_2_Main"{
                    TabView1_2_Main(path: $path)
                        .environment(moneyContainer) //environment에 등록
                        .environment(infoContainer)
                        .toolbar(.hidden, for: .tabBar)
                }else if value == "TabView1_3_Main"{
                    TabView1_3_Main(path: $path)
                        .environment(infoContainer)
                }else if value == "TabView1_4_Main"{
                    TabView1_4_Main(path: $path)
                        .environment(infoContainer)
                }else if value == "TabView1_5_Main"{
                    TabView1_5_Main(path: $path)
                        .environment(infoContainer)
                }else{
                  EmptyView()
                }
            } //navigationDestination
        } //NavigationStack
    }
}

#Preview {
    TabView1_home()
}
