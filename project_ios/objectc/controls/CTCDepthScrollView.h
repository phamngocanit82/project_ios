#import <UIKit/UIKit.h>
@interface CTCDepthScrollView : UIScrollView<UIScrollViewDelegate>{
    CGFloat angleRatio;
    CGFloat rotationX;
    CGFloat rotationY;
    CGFloat rotationZ;
    CGFloat translateX;
    CGFloat translateY;
}
-(NSInteger)currentPage;
@end
