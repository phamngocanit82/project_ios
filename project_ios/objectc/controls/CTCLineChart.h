#import <UIKit/UIKit.h>
@interface CTCLineChart : UIView
@property(assign)IBInspectable NSInteger fontStyle;
@property(assign)IBInspectable NSInteger chartStyle;
@property(strong, nonatomic)NSMutableArray *labelArray;
@property(strong, nonatomic)NSMutableArray *valueArray;
@property(assign) NSInteger cornerRadius;
-(void)reset;
-(void)drawDaily;
-(void)drawWeekly;
-(void)changeStyle:(NSInteger)style;
@end
