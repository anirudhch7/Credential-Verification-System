const CredentialVerification = artifacts.require("CredentialVerification");

contract("CredentialVerification", (accounts) => {
    it("should issue and verify a certificate", async () => {
        const instance = await CredentialVerification.deployed();

        await instance.issueCertificate(
            "Alice",
            "University",
            "Blockchain 101",
            1691690400, // Timestamp
            { from: accounts[0] }
        );

        const isValid = await instance.verifyCertificate(
            "Alice",
            "University",
            "Blockchain 101",
            1691690400
        );

        assert.equal(isValid, true, "Certificate should be valid");
    });
});
