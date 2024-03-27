import SwiftUI
import PartialSheet

struct CustomSearchBarView: View {
    @State private var searchText: String = ""
    @State private var isSheetPresented = false
    
    var body: some View {
        VStack(spacing: 0) {
            TextField("Search course", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color.clear)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 2)
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                self.searchText = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                        
                        PSButton(
                            isPresenting: $isSheetPresented,
                            label: {
                                Image(systemName: "slider.horizontal.3")
                                    .resizable()
                                    .frame(width: 17, height: 17)
                                    .foregroundColor(.gray)
                            })
                        .padding(.trailing, 15)
                        .partialSheet(
                            isPresented: $isSheetPresented,
                            content: FilterView.init
                        )
                    }
                )
                .padding(.horizontal, 10)
            
            Rectangle()
                .foregroundStyle(Color("Block"))
                .frame(width: 350, height: 2)
        }
    }
}

struct Test5: View {
    var body: some View {
        CustomSearchBarView()
    }
}

struct Test5_Previews: PreviewProvider {
    static var previews: some View {
        Test5()
    }
}
