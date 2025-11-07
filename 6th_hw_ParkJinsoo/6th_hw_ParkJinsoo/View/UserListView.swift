//
//  UserListView.swift
//  URLSession_Practice
//
//  Created by Kim Kyengdong on 11/1/25.
//

import SwiftUI

struct UserListView: View {
    
    // 서버에서 받아온 사용자 목록을 저장할 상태 변수
    @State private var userList: [getUserModel] = []
    
    // sheet(추가/수정 창) 표시 여부
    @State private var showSheet: Bool = false
    
    // 검색창에 입력된 텍스트를 저장
    @State private var searchTextField: String = ""
    
    // ViewModel 인스턴스 (데이터 로딩 및 네트워킹 담당)
    @StateObject var vm = UserViewModel()
    
    var body: some View {
        NavigationStack { // 네비게이션 구조 시작
            VStack(spacing: 0) { // 상단 검색창 + 리스트 세로 배치
                HStack { // 검색창과 검색 버튼 가로 정렬
                    TextField("파트 조회하기", text: $searchTextField)
                        .textFieldStyle(.roundedBorder) // 둥근 모양 텍스트필드
                        .padding(.horizontal)
                    
                    Button(action: {
                        // 검색 버튼 클릭 시
                        Task {
                            // 비동기로 서버 요청 수행
                            do {
                                if searchTextField == "" {
                                    // 입력값이 없으면 전체 조회
                                    userList = try await vm.getUserList()
                                } else {
                                    // 입력값이 있으면 파트별 조회
                                    userList = try await vm.getUserList(searchTextField)
                                }
                            } catch {
                                // 요청 실패 시 에러 출력
                                print("❌ Get Error: \(error)")
                            }
                        }
                    }) {
                        Text("검색")
                    }
                    .buttonStyle(.borderedProminent) // 파란색 강조 버튼 스타일
                    .padding()
                }
                
                // 사용자 리스트 표시 영역
                List {
                    // userList 배열을 순회하여 각 유저 표시
                    ForEach(userList, id: \.self) { user in
                        NavigationLink {
                            // 각 셀 클릭 시 이동할 상세 화면
                            UserSheetView(user: user, showSheet: $showSheet)
                        } label: {
                            // 셀의 시각적 내용 구성
                            HStack {
                                Text(user.name) // 이름
                                    .font(.title2).bold()
                                
                                Text(String(user.age)) // 나이
                                    .font(.body)
                                
                                Text(user.part) // 파트
                                    .font(.body)
                            }
                        }
                        // 오른쪽으로 스와이프 시 ‘삭제’ 버튼 표시
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                                // 삭제 버튼 클릭 시
                                Task {
                                    if let id = user.id {
                                        // 실제 삭제 API 호출 (현재 주석 처리됨)
                                         await vm.deleteUser(id: id)
                                    }
                                    // 삭제 후 최신 리스트 다시 불러오기
                                    userList = try await vm.getUserList()
                                }
                            } label: {
                                Text("삭제")
                            }
                            .tint(.red) // 삭제 버튼 빨간색
                        } // : swipeActions
                    }
                } // : List
            } // : VStack
            // 화면 처음 로드될 때 한 번만 호출됨
            .task {
                do {
                    // 전체 유저 리스트 불러오기
                    userList = try await vm.getUserList()
                } catch {
                    print("❌ Get Error: \(error)")
                }
            }
            // 네비게이션 상단 제목
            .navigationTitle("URLSession 실습")
            .navigationBarTitleDisplayMode(.inline)
            
            // 네비게이션 오른쪽 상단 “추가” 버튼
            .navigationBarItems(trailing:
                Button(action: {
                    // Sheet 열기
                    showSheet = true
                }) {
                    Text("추가")
                }
            )
            // showSheet가 true일 때 모달(sheet) 표시
            .sheet(isPresented: $showSheet) {
                // 유저 추가용 Sheet 뷰
                UserSheetView(showSheet: $showSheet)
            }
            // sheet 닫힐 때마다 리스트 갱신
            .onChange(of: showSheet) {
                Task {
                    // sheet 닫히면 최신 데이터 다시 가져오기
                    userList = try await vm.getUserList()
                }
            }
        }
    } // : NavigationStack
}

// 미리보기용 구조체
#Preview {
    UserListView()
}
