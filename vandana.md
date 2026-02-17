# Privacy Policy for Dragon MAθ

**Last Updated:** February 17, 2026

## Introduction

This Privacy Policy describes how Dragon MAθ ("we", "our", or "the App") collects, uses, stores, and protects your personal information when you use our student event management and attendance tracking application. By using Dragon MAθ, you agree to the collection and use of information in accordance with this policy.

## Information We Collect

### 1. Personal Information
When you register and use the App, we collect:
- **Account Information**: Full name, email address, password (encrypted)
- **Profile Information**: Student ID, department, year of study, phone number
- **Profile Photo**: Optional profile picture uploaded by users
- **Role Information**: User role (Student or Administrator)

### 2. Event and Attendance Data
- **Event Registration**: Events you join or create
- **Attendance Records**: QR code scan data, check-in timestamps, event participation history
- **Points Data**: Points earned, claimed, and approved for event participation
- **Outside Events**: Custom events created by students, including proof of participation

### 3. Device Information
- **Device Identifiers**: Device ID for push notification delivery
- **Firebase Cloud Messaging (FCM) Token**: For sending push notifications
- **Operating System**: iOS or Android version information
- **App Version**: Currently installed version of the application

### 4. Location Information
We collect approximate location data with your explicit consent to:
- Verify attendance at event venues
- Provide location-based event recommendations
- Prevent fraudulent check-ins

**Note:** Location services are optional and can be disabled in your device settings. Disabling location may limit some attendance verification features.

### 5. Camera and Media Access
- **QR Code Scanning**: Camera access for scanning attendance QR codes
- **Photo Uploads**: Gallery/camera access for uploading profile pictures and event proof
- **Generated QR Codes**: Personal QR codes for attendance tracking

### 6. Usage Data
- **App Activity**: Features used, screens viewed, interaction patterns
- **Event Interactions**: Events browsed, joined, or attended
- **Error Logs**: Crash reports and technical diagnostics for app improvement

### 7. Communications
- **Push Notifications**: Event reminders, new event notifications, approval updates
- **In-App Messages**: System notifications and announcements
- **Support Requests**: Communications with our support team

## How We Use Your Information

### Primary Purposes
1. **Account Management**
   - Create and maintain user accounts
   - Authenticate users securely
   - Manage user profiles and preferences

2. **Event Management**
   - Display upcoming and available events
   - Process event registrations and enrollments
   - Track and verify event attendance
   - Generate personal attendance QR codes

3. **Points and Rewards System**
   - Calculate and track points for event participation
   - Process point claims and approvals
   - Display leaderboards and rankings

4. **Administrative Functions**
   - Review and approve student registrations
   - Create and manage institutional events
   - Monitor attendance records
   - Approve outside events created by students
   - Generate reports and analytics

5. **Communication**
   - Send push notifications about new events
   - Deliver event reminders and updates
   - Notify users of account status changes
   - Inform about point approvals

6. **App Improvement**
   - Analyze usage patterns to improve features
   - Debug technical issues and crashes
   - Enhance user experience
   - Develop new features based on usage data

## How We Store and Protect Your Information

### Data Storage
- **Backend Server**: User data is stored on our secure backend server (http://15.134.253.132:3000)
- **Local Storage**: Limited data cached on device using encrypted storage (`flutter_secure_storage`, `shared_preferences`)
- **Firebase Services**: Push notification tokens stored with Firebase Cloud Messaging
- **Session Data**: Authentication tokens stored securely on device

### Security Measures
1. **Encryption**
   - Passwords are encrypted before transmission and storage
   - Sensitive data stored using `flutter_secure_storage` with encryption
   - API communications use secure protocols

2. **Authentication**
   - JWT (JSON Web Token) based authentication
   - Automatic token refresh for secure sessions
   - Session expiration for inactive accounts

3. **Access Control**
   - Role-based access (Student vs Administrator)
   - Admin-only features protected by authorization checks
   - User data accessible only to authorized personnel

4. **Server Security**
   - Regular security updates and patches
   - Firewall protection
   - Intrusion detection systems
   - Regular backup of data

### Data Retention
- **Active Accounts**: Data retained while account is active
- **Inactive Accounts**: Data retained for 2 years after last login, then deleted
- **Attendance Records**: Retained for academic record purposes (minimum 5 years)
- **Deleted Accounts**: Personal data deleted within 30 days of account deletion request
- **Legal Requirements**: Some data may be retained longer if required by law

## Third-Party Services

### Firebase (Google)
We use Firebase services provided by Google LLC:
- **Firebase Cloud Messaging**: For push notifications
- **Firebase Analytics** (if enabled): For app usage analytics

Firebase Privacy Policy: https://firebase.google.com/support/privacy

### What Data Firebase Collects:
- Device identifiers
- FCM registration tokens
- App instance data
- Crash and diagnostic data

### Your Control:
You can opt out of push notifications in the app Settings or device settings.

## Sharing Your Information

### We DO NOT:
- Sell your personal information to third parties
- Share your data with advertisers
- Use your data for marketing purposes outside the app
- Provide student data to external organizations without consent

### We MAY Share Data:
1. **Educational Institution**
   - Attendance records with authorized school administrators
   - Academic performance data for institutional purposes
   - Event participation reports

2. **Legal Compliance**
   - When required by law, court order, or legal process
   - To protect rights, property, or safety of users
   - To investigate fraud or security issues

3. **Service Providers**
   - Backend hosting provider (with strict data protection agreements)
   - Firebase (Google) for push notifications
   - Technical service providers for maintenance

4. **With Your Consent**
   - Any other sharing will require your explicit consent

## Your Privacy Rights

### Access and Control
You have the right to:
1. **Access Your Data**: View all personal information we have about you
2. **Update Information**: Edit your profile, contact information, and preferences
3. **Delete Account**: Request complete deletion of your account and data
4. **Export Data**: Request a copy of your data in portable format
5. **Opt-out of Notifications**: Disable push notifications at any time
6. **Revoke Permissions**: Disable location, camera, or storage access

### How to Exercise Your Rights
- **In-App**: Use Settings > Profile > Account Settings
- **Email**: Contact us at manit.kalra1112@gmail.com
- **Response Time**: We will respond to requests within 30 days

## Children's Privacy

Dragon MAθ is intended for students in educational institutions. While we may process data of users under 18:
- We do not knowingly collect information from children under 13 without parental consent
- Schools and parents should review this policy before allowing minors to use the app
- If you believe we have collected data from a child under 13 inappropriately, please contact us immediately

## Permissions Required

### Android Permissions
- **Camera**: For QR code scanning and profile photo capture
- **Storage**: For saving and accessing images
- **Internet**: For API communication and data synchronization
- **Notifications**: For push notifications
- **Location**: Optional, for attendance verification
- **Vibration**: For QR scan feedback

### iOS Permissions
- **Camera**: QR scanning and photo capture
- **Photo Library**: Accessing and saving images
- **Notifications**: Push notifications
- **Location When In Use**: Optional attendance verification

**Note:** You can revoke permissions at any time through device settings, though this may limit app functionality.

## Data Security Incidents

In the event of a data breach:
1. We will notify affected users within 72 hours
2. We will describe the nature of the breach
3. We will explain steps taken to mitigate harm
4. We will provide guidance on protecting your account
5. We will report to relevant authorities as required by law

## International Data Transfers

- Our servers are located in [INSERT LOCATION]
- Data may be transferred across borders for processing
- We ensure adequate protection for international transfers
- By using the app, you consent to such transfers

## Cookies and Tracking

- **No Advertising Cookies**: We do not use advertising or tracking cookies
- **Session Management**: Local storage for maintaining login sessions
- **Analytics**: Basic usage analytics for app improvement (non-personally identifiable)

## Changes to This Privacy Policy

We may update this Privacy Policy periodically to reflect:
- Changes in legal requirements
- New features or services
- Improved security practices
- User feedback and concerns

### Notification of Changes
- **Material Changes**: We will notify you via push notification or email
- **Minor Changes**: Posted with updated "Last Updated" date
- **Your Continued Use**: Constitutes acceptance of updated policy
- **Review Period**: 30 days to review changes before they take effect

### Version History
- **v1.0** - February 17, 2026: Initial privacy policy

## Legal Basis for Processing (GDPR)

For users in the European Union, we process your data under:
1. **Contract Performance**: To provide app services you've requested
2. **Legitimate Interest**: To improve app functionality and security
3. **Legal Obligation**: To comply with applicable laws
4. **Consent**: Where explicitly obtained for optional features

## Your California Privacy Rights (CCPA)

California residents have the right to:
- Know what personal information is collected
- Know whether personal information is sold (we do not sell data)
- Request deletion of personal information
- Opt-out of sale of personal information (not applicable)
- Non-discrimination for exercising privacy rights

## Contact Information

### Privacy Questions or Concerns
For any questions about this Privacy Policy or our data practices:

**Email:** manit.kalra1112@gmail.com  
**Support:** manit.kalra1112@gmail.com  
**Address:** 3225 Goldenoak Cir, Round Rock, TX 78681-2291, United States  
**Response Time:** Within 7 business days

### Data Protection Officer
**Name:** Mait kalra
**Email:** manit.kalra1112@gmail.com

## Supervisory Authority

If you believe we have not addressed your privacy concerns adequately, you have the right to lodge a complaint with your local data protection authority.

## Consent

By using Dragon MAθ, you acknowledge that:
1. You have read and understood this Privacy Policy
2. You consent to the collection, use, and storage of your information as described
3. You understand your rights regarding your personal data
4. You agree to our data practices for providing app services

---

## Summary of Key Points

- **What We Collect:** Account info, attendance data, device info, optional location  
- **Why We Collect:** Event management, attendance tracking, app improvement  
- **How We Protect:** Encryption, secure storage, access controls  
- **Your Rights:** Access, update, delete, export your data  
- **Third Parties:** Firebase (Google) for notifications only  
- **Data Sharing:** Only with your institution for academic purposes  
- **No Selling:** We never sell your personal information  
- **Contact Us:** manit.kalra1112@gmail.com for privacy questions  

---

**This privacy policy is designed to comply with:**
- General Data Protection Regulation (GDPR)
- California Consumer Privacy Act (CCPA)
- Children's Online Privacy Protection Act (COPPA)
- Google Play Store Requirements
- Apple App Store Requirements

**Last Reviewed:** February 17, 2026  
**Next Review:** February 17, 2027
