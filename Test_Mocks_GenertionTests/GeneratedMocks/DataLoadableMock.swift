// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT




















final class DataLoadableMock: DataLoadable {

    // MARK: - loadData

    private(set) var loadDataWasCalled: Int = 0
    private(set) var loadDataReceivedID: String?
    var loadDataStub: String!

    func loadData(_ id: String) -> String {
        loadDataWasCalled += 1
        loadDataReceivedID = id
        return loadDataStub
    }


}
