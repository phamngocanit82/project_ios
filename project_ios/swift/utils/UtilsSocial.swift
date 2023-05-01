import Foundation
import FacebookLogin
struct UtilsSocial {
    static public func loginFacebook(_ viewController: UIViewController) {
        let loginManager = LoginManager()
        guard let configuration = LoginConfiguration(
            permissions:["email", "user_friends", "user_birthday", "user_age_range", "user_gender", "user_location", "user_hometown", "user_link"],
            tracking: .limited,
            nonce: "123"
        )
        else {
            return
        }
        loginManager.logIn(configuration: configuration) { result in
            switch result {
            case .cancelled, .failed:
                break
            case .success:
                let userID = Profile.current?.userID
                let email = Profile.current?.email
                let friendIDs = Profile.current?.friendIDs
                let birthday = Profile.current?.birthday
                let ageRange = Profile.current?.ageRange
                let gender = Profile.current?.gender
                let location = Profile.current?.location
                let hometown = Profile.current?.hometown
                let profileURL = Profile.current?.linkURL
                let tokenString = AuthenticationToken.current?.tokenString
            }
        }
    }
    
}
