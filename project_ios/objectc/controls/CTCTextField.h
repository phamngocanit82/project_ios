#import <UIKit/UIKit.h>
@class CTCTextField;
@protocol CTCTextFieldDelegate <NSObject>
-(void)textFieldDidChange:(CTCTextField*)textField;
@end
IB_DESIGNABLE
@interface CTCTextField : UITextField
@property (weak) IBOutlet id<CTCTextFieldDelegate> delegateCTCTextField;
@property(copy)IBInspectable NSString *langPlaceHolder;
@property(copy)IBInspectable NSString *defaultColor;
@property(copy)IBInspectable NSString *key;
@property(assign)IBInspectable NSInteger fontStyleTextField;
@property(assign)IBInspectable NSUInteger maxLength;
@property IBInspectable BOOL isMaxLength;
@property(assign) NSInteger fontSizeTextField;
-(NSString*)trimming;
-(NSInteger)getFontSize;
@end
