/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The edit button of the app.
*/

import SwiftUI

struct EditButton: View {
    @Binding var editMode: EditMode
    var action: () -> Void = {}
    var body: some View {
        Button {
            withAnimation {
                if editMode == .active {
                    action()
                    editMode = .inactive
                } else {
                    editMode = .active
                }
            }
        } label: {
            if editMode == .active {
                Text("Cancel").bold()
            } else {
                Text("Edit")
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    EditButton(editMode: .constant(.inactive))
    EditButton(editMode: .constant(.active))
    EditButton(editMode: .constant(.transient))
}
