// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT




















final class MainCoordinatorMock: MainCoordinatorProtocol {

    // MARK: - goToLogin

    private(set) var goToLoginWasCalled: Int = 0
    private(set) var goToLoginReceivedCompletion: ((Bool) -> Void)?

    func goToLogin(_ completion: (Bool) -> Void) {
        goToLoginWasCalled += 1
        goToLoginReceivedCompletion = completion
    }

    // MARK: - goToMainScreen

    private(set) var goToMainScreenWasCalled: Int = 0

    func goToMainScreen() {
        goToMainScreenWasCalled += 1
    }

    // MARK: - dismiss

    private(set) var dismissWasCalled: Int = 0

    func dismiss() {
        dismissWasCalled += 1
    }


}
