
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
    PullLoadMorePulling = 0,
    PullLoadMoreNormal,
    PullLoadMoreLoading,
} PullLoadMoreState;

@protocol LoadMoreTableFooterDelegate;

@interface LoadMoreTableFooterView : UIView {
    PullLoadMoreState _state;
    
    UILabel *_statusLabel;
    CALayer *_arrowImage;
    UIActivityIndicatorView *_activityView;
    NSString *strRefresh;
    NSString *strPullDown;
    NSString *strLoading;
}

@property(nonatomic,assign) id <LoadMoreTableFooterDelegate> delegate;
-(void)setRefreshLang:(NSString*)refreshLang;
-(void)setPullDownLang:(NSString*)pullDownLang;
-(void)setLoadingLang:(NSString*)loadingLang;
- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor;

- (void)loadMoreScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)loadMoreScrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)loadMoreScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

@end

@protocol LoadMoreTableFooterDelegate <NSObject>

- (void)loadMoreTableFooterDidTriggerLoadMore:(LoadMoreTableFooterView*)view;
- (BOOL)loadMoreTableFooterDataSourceIsLoading:(LoadMoreTableFooterView*)view;


@end
