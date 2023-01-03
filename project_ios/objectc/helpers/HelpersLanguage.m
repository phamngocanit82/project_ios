#import "NSDictionary_JSONExtensions.h"
#import "HelpersLanguage.h"
@implementation HelpersLanguage
+(NSString *)language:(NSString*)key{
    return [HelpersLanguage language:key Text:@""];
}
+(NSString *)language:(NSString*)key Text:(NSString*)text{
    NSString *strLibraryDirectory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [strLibraryDirectory stringByAppendingString:@"/language.json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSString * json_data = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSDictionary dictionaryWithJSONString:json_data error:nil];
    key = key.lowercaseString;
    if([dic valueForKey:key]){
        text = [dic valueForKey:key];
    }
    dic = nil;
    json_data = nil;
    data = nil;
    return text;
}
@end
