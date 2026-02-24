import SwiftUI

struct QuickAddButton: View {
    let icon: String
    let label: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            Imaage(systemName: icon)
                .font(.system(size: 16, weight: .bold))
            Text(label)
                    .foregroundColor(Color)
                    .frame(width: 70, height: 50)
                    .background(color.opacity(0.2))
                    .cornerRadius(12)
        }
        
    }
    
    
    #Preview{
        QuickAddButton(icon: "plus", label: "Quick Add", color: .blue)
    
}

