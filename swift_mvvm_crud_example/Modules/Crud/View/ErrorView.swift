import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Error")
                .font(.title)
                .foregroundColor(.red)
            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Button(action: retryAction) {
                Text("Retry")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }
}
