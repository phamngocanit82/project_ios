#import <UIKit/UIKit.h>
@class CTCSwitch;
@protocol CTCSwitchDelegate <NSObject>
-(void)switchStateChanged:(CTCSwitch*)object;
-(void)switchTapped:(CTCSwitch*)object;
@end
@interface CTCSwitch : UIView
@property (weak) IBOutlet id<CTCSwitchDelegate> delegateCTCSwitch;
@property (nonatomic) BOOL isOn;
@property (nonatomic, strong) UIImageView *offImageView;
@property (nonatomic, strong) UIImageView *onImageView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIButton *switchThumbButton;
@property (nonatomic, strong) UIButton *actionButton;
@property (copy) IBInspectable NSString *styleSwitch;
- (void)setOn:(BOOL)on animated:(BOOL)animated;
@end
