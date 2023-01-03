#import "CTCView.h"
#import "CTHHelper.h"
#import "CTCSlider.h"
@implementation CTCSlider
-(void)layoutSubviews{
    [super layoutSubviews];
 // [self drawBackground];
}
-(void)drawBackground{
    [CTHHelper removeAllSubviews:self];
    CTCView *view = [[CTCView alloc] initWithFrame:CGRectMake(0, (self.frame.size.height -(self.frame.size.height-2)/4)/2, self.frame.size.width, (self.frame.size.height-2)/4)];
    view.backgroundColor = self.disableColor;
    [self addSubview:view];
    
    NSInteger distance = self.frame.size.width/(self.numDisableOval+1);
    for (NSInteger i=0 ; i<self.numDisableOval; i++) {
        view = [[CTCView alloc] initWithFrame:CGRectMake((i+1)*distance - (self.frame.size.height/1.4f)/2, (self.frame.size.height-self.frame.size.height/1.4f)/2, self.frame.size.height/1.4f, self.frame.size.height/1.4f)];
        view.backgroundColor = self.disableColor;
        view.cornerRadius = (self.frame.size.height/1.4f)/2;
        view.drawBorder = YES;
        [self addSubview:view];
    }
}
-(void)prevAnimation{
    [self drawBackground];
    NSInteger distance = self.frame.size.width/(self.numDisableOval+1);
    if(self.numEnableOval>0){
        CTCView *lineView = [[CTCView alloc] initWithFrame:CGRectMake(0, (self.frame.size.height -self.frame.size.height/3)/2, (self.numEnableOval+1)*distance, self.frame.size.height/3)];
        lineView.backgroundColor = self.enableColor;
        [self addSubview:lineView];
        
        CTCView *dotView;
        for (NSInteger i=0 ; i<self.numEnableOval+1; i++) {
            CTCView *view = [[CTCView alloc] initWithFrame:CGRectMake((i+1)*distance - self.frame.size.height/2, 0, self.frame.size.height, self.frame.size.height)];
            view.backgroundColor = self.enableColor;
            view.layer.cornerRadius = self.frame.size.height/2;
            if(i==self.numEnableOval){
                dotView = view;
            }
            [self addSubview:view];
        }
        [CTHHelper animation:^{
            dotView.frame = CGRectMake((self.numEnableOval+1)*distance - (self.frame.size.height/1.4f)/2, (self.frame.size.height-self.frame.size.height/1.4f)/2, self.frame.size.height/1.4f, self.frame.size.height/1.4f);
            dotView.backgroundColor = self.disableColor;
            dotView.layer.cornerRadius = dotView.frame.size.height/2;
        } completion:^{
            [CTHHelper animation:^{
                [dotView removeFromSuperview];
                lineView.frame = CGRectMake(0, (self.frame.size.height -self.frame.size.height/3)/2, self.numEnableOval*distance, self.frame.size.height/3);
            }];
        }];
    }
}
-(void)nextAnimation{
    [self drawBackground];
    
    NSInteger distance = self.frame.size.width/(self.numDisableOval+1);
    if(self.numEnableOval>0){
        CTCView *lineView = [[CTCView alloc] initWithFrame:CGRectMake(0, (self.frame.size.height -self.frame.size.height/3)/2, (self.numEnableOval-1)*distance, self.frame.size.height/3)];
        lineView.backgroundColor = self.enableColor;
        [self addSubview:lineView];
        
        CTCView *dotView;
        for (NSInteger i=0 ; i<self.numEnableOval; i++) {
            CTCView *view = [[CTCView alloc] initWithFrame:CGRectMake((i+1)*distance - self.frame.size.height/2, 0, self.frame.size.height, self.frame.size.height)];
            view.backgroundColor = self.enableColor;
            view.layer.cornerRadius = self.frame.size.height/2;
            if(i==self.numEnableOval-1){
                view.frame = CGRectMake((i+1)*distance - (self.frame.size.height/1.4f)/2, (self.frame.size.height-self.frame.size.height/1.4f)/2, self.frame.size.height/1.4f, self.frame.size.height/1.4f);
                view.layer.cornerRadius = (self.frame.size.height/1.4f)/2;
                view.alpha = 0;
                dotView = view;
            }
            if(i<3)
                [self addSubview:view];
        }
        [CTHHelper animation:^{
            lineView.frame = CGRectMake(0, (self.frame.size.height -self.frame.size.height/3)/2, self.numEnableOval*distance+self.frame.size.height/3, self.frame.size.height/3);
        } completion:^{
            [CTHHelper animation:^{
                dotView.frame = CGRectMake((self.numEnableOval)*distance - self.frame.size.height/2, 0, self.frame.size.height, self.frame.size.height);
                dotView.layer.cornerRadius = dotView.frame.size.height/2;
                dotView.alpha = 1;
            }];
        }];
    }
}
@end
