#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <TwitterKit/TWTRKit.h>
#import "Social/Social.h"
@implementation CTHSocial

+(void)loginFaceBook:(UIViewController*)viewController{
    FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
    if(FBSDKAccessToken.currentAccessToken!=nil)
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
    [[Twitter sharedInstance] logInWithCompletion:^(TWTRSession *session, NSError *error) {
        if (session) {
          NSLog(@"signed in as %@", [session userName]);
        } else {
          NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
}
+(void)shareAppToFacebook:(UIViewController*)viewController{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        SLComposeViewController *facebookViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookViewController setInitialText:@"facebook"];
        [facebookViewController addURL:[NSURL URLWithString:@"https://facebook.com"]];
        [facebookViewController addImage:[UIImage imageNamed:@"image"]];
        [viewController presentViewController:facebookViewController animated:YES completion:nil];
    }
    else{
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"SocialShare" message:@"You are not signed in to facebook."preferredStyle:UIAlertControllerStyleAlert];
        [viewController presentViewController:alertController animated:YES completion:nil];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alertAction];
    }
}
+(void)shareAppToTwitter:(UIViewController*)viewController{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        SLComposeViewController *twitterViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [twitterViewController setInitialText:@"twitter"];
        [twitterViewController addURL:[NSURL URLWithString:@"https://twitter.com"]];
        [twitterViewController addImage:[UIImage imageNamed:@"image"]];
        [viewController presentViewController:twitterViewController animated:YES completion:nil];
    }
    else{
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"SocialShare" message:@"You are not signed in to twitter."preferredStyle:UIAlertControllerStyleAlert];
         [viewController presentViewController:alertController animated:YES completion:nil];
         UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
         [alertController addAction:alertAction];
    }
}
@end
