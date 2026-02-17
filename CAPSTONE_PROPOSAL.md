INFT 425 CAPSTONE PROJECT PROPOSAL
Student Information
Name: EMMANUEL VIRTUOUS MENSAH

Student ID: 224IT02001281

Date: February 17, 2026

Proposal ID: IT_[MENSAH]_007

1. Project Concept
Project Title: SafePass – Smart Password Generator & Vault

Problem Statement:
Many students reuse weak passwords across multiple accounts because creating and remembering strong, unique passwords is difficult, especially on mobile devices. This exposes them to account hijacking, data theft, and privacy breaches, since a single leaked password can compromise several services.

Target Users:

University students and staff who manage many online accounts

Young professionals who want a simple way to generate and store secure passwords

Unique Aspect:
SafePass combines a customizable password generator (length, character types) with a secure local/cloud vault tied to Firebase authentication, so users can both generate and conveniently retrieve strong passwords on any device. It focuses on a minimal, mobile-friendly interface, showing password strength and letting users quickly copy or share credentials into login forms.

2. Technical Requirements
Core Features (MVP – Must Have):

✅ User authentication: Firebase Authentication with Email/Password login and registration.
​

✅ Database operations: Firebase Firestore to store encrypted password entries (account name, username, password, notes, timestamp, userID).

✅ Device API integration:

Clipboard API to copy generated passwords.
​

Optional biometric unlock (fingerprint/face) using device biometrics for faster access to the vault.
​

✅ CRUD operations:

Create: Generate and save new passwords.

Read: View list of saved passwords and details.

Update: Edit stored entries (e.g., change password or username).

Delete: Remove passwords from the vault.
​

✅ At least 5 connected screens: Login, Register, Home/Vault, Password Generator, Password Details, Profile/Settings.

Advanced Features (Nice to Have):

Built‑in password strength meter and entropy indicator for generated passwords.

Simple analytics view (e.g., number of weak vs strong passwords, last updated dates) to encourage users to improve security.

3. Screen Layout
Login/Register Screen – Email/password sign in and sign up with Firebase Auth.
​

Home/Vault Screen – Lists saved password entries (service name, masked password), search bar, and navigation to generator and profile.

Password Generator Screen – Options to set length, include uppercase, lowercase, numbers, and symbols, show strength feedback, and a button to save or copy the generated password.

Password Details/Edit Screen – Shows full details for a single entry (service, username, password with reveal/hide toggle, notes) and allows editing or deleting.

Add New Password Screen – Form to manually add a password or generate one, then save to Firestore.

Profile/Settings Screen – User info, change master password (app login), enable/disable biometrics, sign out.
​

4. Data Structure
The app will store:

User Profiles

Fields: userID, name, email, createdAt, biometricEnabled (true/false), avatarUrl (optional).
​

Password Entries

Fields:

entryID

userID (owner reference)

serviceName (e.g., “Gmail”, “VVU Portal”)

usernameOrEmail

encryptedPassword

notes

strengthScore (numeric or label like Weak/Medium/Strong)

createdAt

updatedAt

Security/Settings (optional collection or embedded)

passwordLengthDefault

includeUppercaseDefault

includeLowercaseDefault

includeNumbersDefault

includeSymbolsDefault

These structures will be stored in Firestore collections such as users, passwordEntries, and settings.

5. Questions/Concerns
How to implement strong client‑side encryption so that stored passwords remain secure even though they are synced with Firestore (key management, encryption libraries).

Designing safe clipboard usage (auto‑clearing after a short time) so copied passwords are not easily exposed.
​

Handling biometric authentication correctly across different Android devices and versions.
​

Implementing a reliable password strength meter that balances usability and true security (entropy calculation, character diversity).