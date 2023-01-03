#import <UIKit/UIKit.h>
@interface CTCCircleChart : UIView
@property (assign) NSInteger startAnimation;
@property (assign) NSInteger indexAnimation;
@property (assign) CGFloat duration;
@property (assign) NSInteger percent;
-(void)drawAnimation;
@end
