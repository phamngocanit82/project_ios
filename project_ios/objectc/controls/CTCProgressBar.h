#import <UIKit/UIKit.h>
@interface CTCProgressBar : UIView
@property(assign)IBInspectable NSInteger maxProgressValue;
@property(assign)IBInspectable NSInteger progressValue;
-(void)drawProgress;
@end
