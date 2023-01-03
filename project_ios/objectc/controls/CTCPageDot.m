#import "CTCView.h"
#import "CTHHelper.h"
#import "CTCPageDot.h"
@implementation CTCPageDot
-(void)drawDot{
    [CTHHelper removeAllSubviews:self];
    NSInteger distance = self.frame.size.width/(self.numDisableOval+1);
    for (NSInteger i=0 ; i<self.numDisableOval; i++) {
        CTCView *view = [[CTCView alloc] initWithFrame:CGRectMake((i+1)*distance - (self.frame.size.height/1.4f)/2, (self.frame.size.height-self.frame.size.height/1.4f)/2, self.frame.size.height/1.4f, self.frame.size.height/1.4f)];
        if(i == self.numEnableOval){
            view.backgroundColor = self.disableColor;
            [CTHHelper animation:^{
                view.backgroundColor = self.enableColor;
            }];
        }else if(i < self.numEnableOval){
            view.backgroundColor = self.enableColor;
        }else{
            view.backgroundColor = self.disableColor;
        }
        view.cornerRadius = (self.frame.size.height/1.4f)/2;
        view.drawBorder = YES;
        [self addSubview:view];
    }
}
@end
