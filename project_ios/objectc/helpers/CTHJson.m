#import "NSDictionary_JSONExtensions.h"
#import "CTHJson.h"
@implementation CTHJson
+(NSString*)stringFromObject:(id)object{
    NSError * err;
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:object options:0 error:&err];
    NSString * json_data = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return json_data;
}
+(id)dictionaryWithJSONString:(NSString *)strJson{
    return [NSDictionary dictionaryWithJSONString:strJson error:nil];
}
@end
