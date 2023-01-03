#import "CTCView.h"
#import "CTCLabel.h"
@interface CTCSlideIndicate : UIControl
@property(strong, nonatomic) CTCView *trackView;
@property(strong, nonatomic) UIImageView *trackImageView;
@property(strong, nonatomic) CTCLabel *valueLabel;
@property(assign) IBInspectable NSInteger maximum;
@property(assign) NSInteger distance;
@property(assign) CGPoint startTouchPosition;
@property(assign) BOOL startEnable;
@end
