import SwiftUI
import EasyGameView

struct ContentView: View {

    let cols: Int = 6
    let rows: Int = 6
    let spacing: CGFloat = 0

    var body: some View {

        VStack {

            Text("EasyGameView Example")

            EasyGameView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
