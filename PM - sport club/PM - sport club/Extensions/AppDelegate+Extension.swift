import IQKeyboardManagerSwift
 
extension AppDelegate {
 
    private func IQKeyboardManagerSetup() {
            IQKeyboardManager.shared.enable = true
            
            IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Готово"
            IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        }
    
}
