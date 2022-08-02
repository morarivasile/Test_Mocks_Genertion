// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT







final class CombineMock: CombineProtocol {
    // MARK: - configurationPublisher

    private(set) var getConfigurationPublisherWasCalled: Int = 0
    private(set) var setConfigurationPublisherWasCalled: Int = 0
    var configurationPublisherStub: AnyPublisher<String, Never>!

    var configurationPublisher: AnyPublisher<String, Never> {
        get {
            getConfigurationPublisherWasCalled += 1
            return configurationPublisherStub
        }
    }



}
