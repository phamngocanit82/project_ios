#import <UIKit/UIKit.h>
@class CTCVideo;
@protocol CTCVideoDelegate <NSObject>
-(void)webViewDidFinishLoad:(CTCVideo *)video;
-(void)youTubePlayed:(CTCVideo *)video;
@end
@interface CTCVideo : UIView<WKNavigationDelegate, WKUIDelegate>
@property (weak) IBOutlet id<CTCVideoDelegate> delegate;
@property (assign) BOOL closeVideo;
-(void)initVideo;
-(void)play:(NSString*)youtubeId;
-(void)clear;
@end
