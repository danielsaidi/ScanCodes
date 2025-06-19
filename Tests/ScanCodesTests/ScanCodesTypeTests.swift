import Testing
@testable import ScanCodes

@Test func scanCodeTypeDefinesFilterName() async throws {
    func result(for type: ScanCodeType) -> String {
        type.ciFilterName
    }
    #expect(result(for: .aztek) == "CIAztecCodeGenerator")
    #expect(result(for: .code128) == "CICode128BarcodeGenerator")
    #expect(result(for: .pdf417) == "CIPDF417BarcodeGenerator")
    #expect(result(for: .qr) == "CIQRCodeGenerator")
}

@Test func scanCodeTypeHasBarcodeAlias() async throws {
    #expect(ScanCodeType.barcode == ScanCodeType.code128)
}
