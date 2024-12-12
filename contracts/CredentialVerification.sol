// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CredentialVerification {
    // Structure to store certificate details
    struct Certificate {
        string studentName;
        string institutionName;
        string courseName;
        uint256 issueDate;
        bool exists;
    }

    // Mapping of certificate hashes to Certificate details
    mapping(bytes32 => Certificate) private certificates;

    // Event to log new certificate issuance
    event CertificateIssued(
        bytes32 indexed certHash,
        string studentName,
        string institutionName,
        string courseName,
        uint256 issueDate
    );

    /**
     * @dev Issue a certificate.
     * @param studentName The name of the student.
     * @param institutionName The name of the issuing institution.
     * @param courseName The name of the course or program.
     * @param issueDate The date the certificate was issued (timestamp).
     */
    function issueCertificate(
        string memory studentName,
        string memory institutionName,
        string memory courseName,
        uint256 issueDate
    ) public {
        // Generate a unique hash for the certificate
        bytes32 certHash = keccak256(
            abi.encodePacked(studentName, institutionName, courseName, issueDate)
        );

        // Ensure the certificate doesn't already exist
        require(!certificates[certHash].exists, "Certificate already exists");

        // Store the certificate details
        certificates[certHash] = Certificate(
            studentName,
            institutionName,
            courseName,
            issueDate,
            true
        );

        // Emit event
        emit CertificateIssued(
            certHash,
            studentName,
            institutionName,
            courseName,
            issueDate
        );
    }

    /**
     * @dev Verify a certificate.
     * @param studentName The name of the student.
     * @param institutionName The name of the issuing institution.
     * @param courseName The name of the course or program.
     * @param issueDate The date the certificate was issued (timestamp).
     * @return isValid True if the certificate is valid.
     */
    function verifyCertificate(
        string memory studentName,
        string memory institutionName,
        string memory courseName,
        uint256 issueDate
    ) public view returns (bool isValid) {
        // Generate the hash for the certificate
        bytes32 certHash = keccak256(
            abi.encodePacked(studentName, institutionName, courseName, issueDate)
        );

        // Check if the certificate exists
        return certificates[certHash].exists;
    }
}
