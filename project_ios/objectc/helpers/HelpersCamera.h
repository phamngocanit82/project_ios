#import <UIKit/UIKit.h>
#include <AssetsLibrary/AssetsLibrary.h>
@class HelpersCamera;
@protocol CTHCameraDelegate <NSObject>
-(void)photoCompleted:(HelpersCamera *)object;
@end
@interface HelpersCamera : NSObject<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property (weak) id  delegate;
@property (strong, nonatomic) UIImagePickerController *imagePickerController;
@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) NSMutableArray *imgArray;
+(instancetype)sharedInstance;
-(void)actionPhoto:(UIViewController*)viewController Delegate:(id)delegate;
-(void)clear;
@end

