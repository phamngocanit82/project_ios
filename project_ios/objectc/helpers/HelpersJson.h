#import <UIKit/UIKit.h>
@interface HelpersJson : NSObject
+(NSString*)stringFromObject:(id)object;
+(id)dictionaryWithJSONString:(NSString *)strJson;
@end
