#import <FBSDKLoginKit/FBSDKLoginKit.h>
@implementation CTHSocial

+(void)loginFaceBook:(UIViewController*)viewController{
    FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
    [loginManager logOut];
    FBSDKLoginConfiguration *configuration = [[FBSDKLoginConfiguration alloc] initWithPermissions:@[@"email", @"public_profile", @"user_birthday", @"user_age_range", @"user_hometown", @"user_location", @"user_gender", @"user_link"] tracking:FBSDKLoginTrackingLimited nonce:@"123"];
    [loginManager logInFromViewController:viewController configuration:configuration
                  completion:^(FBSDKLoginManagerLoginResult * result, NSError *error) {
        if (!error && !result.isCancelled) {
            NSString *userID =
            FBSDKProfile.currentProfile.userID;

            NSString *idTokenString =
            FBSDKAuthenticationToken.currentAuthenticationToken.tokenString;

            NSString *email = FBSDKProfile.currentProfile.email;
        
            NSArray *friendIDs = FBSDKProfile.currentProfile.friendIDs;

            NSDate *birthday = FBSDKProfile.currentProfile.birthday;

            FBSDKUserAgeRange *ageRange = FBSDKProfile.currentProfile.ageRange;
        
            FBSDKLocation *hometown = FBSDKProfile.currentProfile.hometown;
        
            FBSDKLocation *location = FBSDKProfile.currentProfile.location;
        
            NSString *gender = FBSDKProfile.currentProfile.gender;
        
            NSURL *userLink = FBSDKProfile.currentProfile.linkURL;
        }
    }];
}
+(void)loginTwitter:(UIViewController*)viewController{
    
}
@end
