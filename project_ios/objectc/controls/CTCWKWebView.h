#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@class CTCWKWebView;
@protocol CTCWKWebViewDelegate <NSObject>
@optional
-(void)didFinishNavigation:(CTCWKWebView*)webView;
-(void)didFailNavigation:(CTCWKWebView*)webView;
@end
@interface CTCWKWebView : WKWebView<WKNavigationDelegate>
@property (weak) IBOutlet id delegate;
-(void)loadRequestFromLink:(NSString*)strURL;
-(void)setHTML:(NSString*)str CSSName:(NSString*)name ScrollEnabled:(BOOL)scrollEnabled;
-(void)clear;
@end
