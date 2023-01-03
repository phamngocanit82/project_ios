#import <UIKit/UIKit.h>
@interface HelpersPlatform : NSObject
+(BOOL)is_iPad;
+(BOOL)is_Pad;
+(BOOL)is_Phone;
+(BOOL)is_iPad1;
+(BOOL)is_iPad2;
+(BOOL)is_iPad3;
+(BOOL)is_iPhone4;
+(BOOL)is_iPhone4S;
+(BOOL)isUseApp;
+(NSString*)platform;
+(NSString*)platformString;
+(CGFloat)getWidth;
+(CGFloat)getHeight;
+(CGFloat)getRatio;
+(NSString*)storyBoardNameOfDevice:(NSString*)storyBoardName;
@end
