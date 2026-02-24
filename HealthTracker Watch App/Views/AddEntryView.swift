import SwiftUI

struct AddEntryView: View {
    @ObservedObject var viewModel: HealthViewModel
    let entryType: EntryType
    
    @State private var text: Double = 0
    @Environment(\.dismiss) private var dismiss
            
        private var quickAddOptions:[Double] [100, 200, 300, 500, 1000] }
        
        
        
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 16) {
                Image(systemName: entryType.icon)
                    .font(.system(size: 28))
                    .foregroundColor(entryType.color)
            }
        Text("Add \(entryType == .calories / ? "calories" : "Water")")
            .font(.system(size: 14, weight: .medium))
        
        Text("\Int(selectAmount")) \ (entryType.unit)")
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .foregroundColor(.entryType.color)
            
            LazyVGrid(columns:
                    [GridItem(.flexible()),GridItem(.flexible())])
            {, spacing: 10 {
                ForEach(quickAddOptions, id: \.self) { amont in
                    Button {
                        selectedAmount = amount
                    } label: {
                        Text("\(Int(amount))")
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: .infinity,))
                            .padding(.vertical, 10)
                            .background(
                                selectAmount == amount
                                ? entryType.color(amont
                                                  
                            
                            
                    }
                    
                }
            }
        
    }
              
              
    
    
    
    
}

NavigationStack {
    AddEntryView(viewModel: .shared, entryType: .calories)
}
