#import <AdSupport/ASIdentifierManager.h>
#import "NSDictionary_JSONExtensions.h"
#import "AESCrypt.h"
#import "PDKeychainBindings.h"
#import "HelpersUserDefined.h"
#import "HelpersJson.h"
#import "HelpersCache.h"
@implementation HelpersCache
//NSUserDefault
+(void)clearWithKeyNSUserDefault:(NSString*)strKey{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:strKey];
}
+(void)setKeyWithBoolNSUserDefault:(NSString*)strKey Value:(BOOL)boolValue{
    strKey = [NSString stringWithFormat:@"Bool%@", strKey];
    NSString * str = [AESCrypt encrypt:[[NSNumber numberWithBool:boolValue] stringValue] password:HelpersUserDefined.AES_CRYPT];
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:strKey];
}
+(void)setKeyWithIntNSUserDefault:(NSString*)strKey Value:(NSInteger)intValue{
    strKey = [NSString stringWithFormat:@"Int%@", strKey];
    NSString * str = [AESCrypt encrypt:[[NSNumber numberWithInteger:intValue] stringValue] password:HelpersUserDefined.AES_CRYPT];
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:strKey];
}
+(void)setKeyWithFloatNSUserDefault:(NSString*)strKey Value:(CGFloat)floatValue{
    strKey = [NSString stringWithFormat:@"Float%@", strKey];
    NSString * str = [AESCrypt encrypt:[[NSNumber numberWithFloat:floatValue] stringValue] password:HelpersUserDefined.AES_CRYPT];
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:strKey];
}
+(void)setKeyWithDoubleNSUserDefault:(NSString*)strKey Value:(double)doubleValue{
    strKey = [NSString stringWithFormat:@"Double%@", strKey];
    NSString * str = [AESCrypt encrypt:[[NSNumber numberWithDouble:doubleValue] stringValue] password:HelpersUserDefined.AES_CRYPT];
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:strKey];
}
+(void)setKeyWithStringNSUserDefault:(NSString*)strKey Value:(NSString*)strValue{
    strKey = [NSString stringWithFormat:@"String%@", strKey];
    NSString * str = [AESCrypt encrypt:strValue password:HelpersUserDefined.AES_CRYPT];
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:strKey];
}
+(void)setKeyWithDictionaryNSUserDefault:(NSString*)strKey Value:(NSMutableDictionary*)dicValue{
    strKey = [NSString stringWithFormat:@"Dictionary%@", strKey];
    NSString * str = [HelpersJson stringFromObject:dicValue];
    str = [AESCrypt encrypt:str password:HelpersUserDefined.AES_CRYPT];
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:strKey];
}
+(BOOL)getKeyWithBoolNSUserDefault:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"Bool%@", strKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:strKey]!=nil){
        NSString *str = [AESCrypt decrypt:[[NSUserDefaults standardUserDefaults] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
        return [str boolValue];
    }
    return FALSE;
}
+(NSInteger)getKeyWithIntNSUserDefault:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"Int%@", strKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:strKey]!=nil){
        NSString *str = [AESCrypt decrypt:[[NSUserDefaults standardUserDefaults] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
        return [str integerValue];
    }
    return -1;
}
+(CGFloat)getKeyWithFloatNSUserDefault:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"Float%@", strKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:strKey]!=nil){
        NSString *str = [AESCrypt decrypt:[[NSUserDefaults standardUserDefaults] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
        return [str floatValue];
    }
    return -1;
}
+(double)getKeyWithDoubleNSUserDefault:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"Double%@", strKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:strKey]!=nil){
        NSString *str = [AESCrypt decrypt:[[NSUserDefaults standardUserDefaults] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
        return [str doubleValue];
    }
    return -1;
}
+(NSString*)getKeyWithStringNSUserDefault:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"String%@", strKey];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:strKey]!=nil){
        return [AESCrypt decrypt:[[NSUserDefaults standardUserDefaults] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
    }
    return @"";
}
+(NSMutableDictionary*)getKeyWithDictionaryNSUserDefault:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"Dictionary%@", strKey];
    NSString *jsondata = [AESCrypt decrypt:[[NSUserDefaults standardUserDefaults] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
    NSMutableDictionary *dic = [NSDictionary dictionaryWithJSONString:jsondata error:nil];
    return dic;
}
//PDKeychainBindings
+(void)clearWithKeyPDKeychainBinding:(NSString*)strKey{
    PDKeychainBindings *bindings = [PDKeychainBindings sharedKeychainBindings];
    [bindings setObject:nil forKey:strKey];
}
+(void)setKeyWithBoolPDKeychainBinding:(NSString*)strKey Value:(BOOL)boolValue{
    strKey = [NSString stringWithFormat:@"Bool%@", strKey];
    NSString * str = [AESCrypt encrypt:[[NSNumber numberWithBool:boolValue] stringValue] password:HelpersUserDefined.AES_CRYPT];
    PDKeychainBindings *bindings = [PDKeychainBindings sharedKeychainBindings];
    [bindings setObject:str forKey:strKey];
}
+(void)setKeyWithIntPDKeychainBinding:(NSString*)strKey Value:(NSInteger)intValue{
    strKey = [NSString stringWithFormat:@"Int%@", strKey];
    NSString * str = [AESCrypt encrypt:[[NSNumber numberWithInteger:intValue] stringValue] password:HelpersUserDefined.AES_CRYPT];
    PDKeychainBindings *bindings = [PDKeychainBindings sharedKeychainBindings];
    [bindings setObject:str forKey:strKey];
}
+(void)setKeyWithFloatPDKeychainBinding:(NSString*)strKey Value:(CGFloat)floatValue{
    strKey = [NSString stringWithFormat:@"Float%@", strKey];
    NSString * str = [AESCrypt encrypt:[[NSNumber numberWithFloat:floatValue] stringValue] password:HelpersUserDefined.AES_CRYPT];
    PDKeychainBindings *bindings = [PDKeychainBindings sharedKeychainBindings];
    [bindings setObject:str forKey:strKey];
}
+(void)setKeyWithDoublePDKeychainBinding:(NSString*)strKey Value:(double)doubleValue{
    strKey = [NSString stringWithFormat:@"Double%@", strKey];
    NSString * str = [AESCrypt encrypt:[[NSNumber numberWithDouble:doubleValue] stringValue] password:HelpersUserDefined.AES_CRYPT];
    PDKeychainBindings *bindings = [PDKeychainBindings sharedKeychainBindings];
    [bindings setObject:str forKey:strKey];
}
+(void)setKeyWithStringPDKeychainBinding:(NSString*)strKey Value:(NSString*)strValue{
    strKey = [NSString stringWithFormat:@"String%@", strKey];
    NSString * str = [AESCrypt encrypt:strValue password:HelpersUserDefined.AES_CRYPT];
    PDKeychainBindings *bindings = [PDKeychainBindings sharedKeychainBindings];
    [bindings setObject:str forKey:strKey];
}
+(void)setKeyWithDictionaryPDKeychainBinding:(NSString*)strKey Value:(NSMutableDictionary*)dicValue{
    strKey = [NSString stringWithFormat:@"Dictionary%@", strKey];
    NSString * str = [HelpersJson stringFromObject:dicValue];
    str = [AESCrypt encrypt:str password:HelpersUserDefined.AES_CRYPT];
    PDKeychainBindings *bindings = [PDKeychainBindings sharedKeychainBindings];
    [bindings setObject:str forKey:strKey];
}
////////////////////////////////////////
+(BOOL)getKeyWithBoolPDKeychainBinding:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"Bool%@", strKey];
    if([[PDKeychainBindings sharedKeychainBindings] objectForKey:strKey]!=nil){
        NSString *str = [AESCrypt decrypt:[[PDKeychainBindings sharedKeychainBindings] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
        return [str boolValue];
    }
    return FALSE;
}
+(NSInteger)getKeyWithIntPDKeychainBinding:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"Int%@", strKey];
    if([[PDKeychainBindings sharedKeychainBindings] objectForKey:strKey]!=nil){
        NSString *str = [AESCrypt decrypt:[[PDKeychainBindings sharedKeychainBindings] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
        return [str integerValue];
    }
    return -1;
}
+(CGFloat)getKeyWithFloatPDKeychainBinding:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"Float%@", strKey];
    if([[PDKeychainBindings sharedKeychainBindings] objectForKey:strKey]!=nil){
        NSString *str = [AESCrypt decrypt:[[PDKeychainBindings sharedKeychainBindings] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
        return [str floatValue];
    }
    return -1;
}
+(double)getKeyWithDoublePDKeychainBinding:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"Double%@", strKey];
    if([[PDKeychainBindings sharedKeychainBindings] objectForKey:strKey]!=nil){
        NSString *str = [AESCrypt decrypt:[[PDKeychainBindings sharedKeychainBindings] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
        return [str doubleValue];
    }
    return -1;
}
+(NSString*)getKeyWithStringPDKeychainBinding:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"String%@", strKey];
    if ([[PDKeychainBindings sharedKeychainBindings] objectForKey:strKey]!=nil){
        return [AESCrypt decrypt:[[PDKeychainBindings sharedKeychainBindings] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
    }
    return @"";
}
+(NSMutableDictionary*)getKeyWithDictionaryPDKeychainBinding:(NSString*)strKey{
    strKey = [NSString stringWithFormat:@"Dictionary%@", strKey];
    NSString *jsondata = [AESCrypt decrypt:[[PDKeychainBindings sharedKeychainBindings] objectForKey:strKey] password:HelpersUserDefined.AES_CRYPT];
    NSMutableDictionary *dic = [NSDictionary dictionaryWithJSONString:jsondata error:nil];
    return dic;
}
+(void)destroyLackingDataProtection{
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, TRUE) objectAtIndex:0];
    NSString *appID = [[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"];
    NSString *path = [NSString stringWithFormat:@"%@/%@/Cache.db-wal", caches, appID];
    NSString *strLibraryDirectory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    path = [strLibraryDirectory stringByAppendingString:@"/Caches/com.apple.WebKit.WebContent/com.apple.metal/functions.data"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.FUNCTIONS_DATA]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.FUNCTIONS_DATA Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/Caches/com.apple.WebKit.WebContent/com.apple.metal/functions.data"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/Caches/com.apple.WebKit.WebContent/com.apple.metal/functions.data"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/Caches/com.apple.WebKit.WebContent/com.apple.metal/functions.data"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/SyncedPreferences/com.nestle.milo.champsquad.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.CHAMPSQUAD_PLIST]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.CHAMPSQUAD_PLIST Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/SyncedPreferences/com.nestle.milo.champsquad.plist"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/SyncedPreferences/com.nestle.milo.champsquad.plist"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/SyncedPreferences/com.nestle.milo.champsquad.plist"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/Sync Preferences/com.nestle.milo.champsquad.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.CHAMPSQUAD_PLIST2]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.CHAMPSQUAD_PLIST2 Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/Sync Preferences/com.nestle.milo.champsquad.plist"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/Sync Preferences/com.nestle.milo.champsquad.plist"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/Sync Preferences/com.nestle.milo.champsquad.plist"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    
    NSString *tmpDirectory = NSTemporaryDirectory();
    NSArray *contentOfDirectory=[[NSFileManager defaultManager] contentsOfDirectoryAtPath:[tmpDirectory stringByAppendingString:@"/com.apple.dyld"] error:NULL];
    NSInteger contentcount = [contentOfDirectory count];
    NSInteger i;
    for(i=0; i<contentcount; i++){
        NSString *fileName = [contentOfDirectory objectAtIndex:i];
        NSString *filePath = [tmpDirectory stringByAppendingString:@"com.apple.dyld/"];
        filePath = [filePath stringByAppendingString:fileName];
        NSError *error;
        NSData *data = [[NSFileManager defaultManager] contentsAtPath:filePath];
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        [data writeToFile:filePath options:NSDataWritingFileProtectionComplete error:&error];
    }
}
+(void)destroyNetworkCache{
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, TRUE) objectAtIndex:0];
    NSString *appID = [[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"];
    NSString *path = [NSString stringWithFormat:@"%@/%@/Cache.db-wal", caches, appID];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    
    path = [NSString stringWithFormat:@"%@/%@/Cache.db", caches, appID];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    
    path = [NSString stringWithFormat:@"%@/%@/Cache.db-shm", caches, appID];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    
    NSString *strLibraryDirectory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    path = [strLibraryDirectory stringByAppendingString:@"/Caches/"];
    path = [path stringByAppendingString:appID];
    path = [path stringByAppendingString:@"/com.apple.metal/functions.data"];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    
    
    path = [strLibraryDirectory stringByAppendingString:@"/Caches/"];
    path = [path stringByAppendingString:appID];
    path = [path stringByAppendingString:@"/com.apple.metal/libraries.data"];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    
    
    path = [strLibraryDirectory stringByAppendingString:@"/Caches/"];
    path = [path stringByAppendingString:appID];
    path = [path stringByAppendingString:@"/com.apple.metal/functions.maps"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.FUNCTIONS_MAPS]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.FUNCTIONS_MAPS Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:path];
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            [data writeToFile:path options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/Caches/"];
    path = [path stringByAppendingString:appID];
    path = [path stringByAppendingString:@"/com.apple.metal/libraries.maps"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.LIBRARIES_MAPS]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.LIBRARIES_MAPS Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:path];
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            [data writeToFile:path options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/Caches/https_m.facebook.com_0.localstorage-shm"];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    
    
    path = [strLibraryDirectory stringByAppendingString:@"/Preferences/"];
    path = [path stringByAppendingString:appID];
    path = [path stringByAppendingString:@".plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.FILE_PLIST]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.FILE_PLIST Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:path];
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            [data writeToFile:path options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    
    
    path = [strLibraryDirectory stringByAppendingString:@"/com-facebook-sdk-PersistedAnonymousID.json"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.PERSISTED_ANONYMOUS_ID]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.PERSISTED_ANONYMOUS_ID Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/com-facebook-sdk-PersistedAnonymousID.json"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/com-facebook-sdk-PersistedAnonymousID.json"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/com-facebook-sdk-PersistedAnonymousID.json"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/com-facebook-sdk-AppEventsTimeSpent.json"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.APP_EVENTS_TIME_SPENT]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.APP_EVENTS_TIME_SPENT Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/com-facebook-sdk-AppEventsTimeSpent.json"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/com-facebook-sdk-AppEventsTimeSpent.json"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/com-facebook-sdk-AppEventsTimeSpent.json"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    path = [strLibraryDirectory stringByAppendingString:@"/google_tagmanager.db"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.GAI_FILE]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.GAI_FILE Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/google_tagmanager.db"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/google_tagmanager.db"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/google_tagmanager.db"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    path = [strLibraryDirectory stringByAppendingString:@"/Application Support/Google/TagManager/resource_GTM-MWHN289"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.GTM_FILE]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.GTM_FILE Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/Application Support/Google/TagManager/resource_GTM-MWHN289"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/Application Support/Google/TagManager/resource_GTM-MWHN289"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/Application Support/Google/TagManager/resource_GTM-MWHN289"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    
    path = [strLibraryDirectory stringByAppendingString:@"/googleanalytics-aux-v4.sql"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_AUX_V4]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_AUX_V4 Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-aux-v4.sql"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-aux-v4.sql"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-aux-v4.sql"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V2]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V2 Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql-shm"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V2_SHM]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V2_SHM Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql-shm"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql-shm"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql-shm"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql-wal"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V2_WAL]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V2_WAL Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql-wal"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql-wal"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v2.sql-wal"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V3]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V3 Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql-shm"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V3_SHM]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V3_SHM Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql-shm"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql-shm"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql-shm"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql-wal"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V3_WAL]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.ANALYTICS_V3_WAL Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql-wal"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql-wal"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/googleanalytics-v3.sql-wal"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/GTM.sql"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.GTM_SQL]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.GTM_SQL Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/GTM.sql"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/GTM.sql"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/GTM.sql"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/GTM.sql-shm"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.GTM_SQL_SHM]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.GTM_SQL_SHM Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/GTM.sql-shm"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/GTM.sql-shm"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/GTM.sql-shm"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    path = [strLibraryDirectory stringByAppendingString:@"/GTM.sql-wal"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        if(![HelpersCache getKeyWithBoolNSUserDefault:HelpersUserDefined.GTM_SQL_WAL]){
            [HelpersCache setKeyWithBoolNSUserDefault:HelpersUserDefined.GTM_SQL_WAL Value:TRUE];
            NSError *error;
            NSData *data = [[NSFileManager defaultManager] contentsAtPath:[strLibraryDirectory stringByAppendingString:@"/GTM.sql-wal"]];
            [[NSFileManager defaultManager] removeItemAtPath:[strLibraryDirectory stringByAppendingString:@"/GTM.sql-wal"] error:&error];
            [data writeToFile:[strLibraryDirectory stringByAppendingString:@"/GTM.sql-wal"] options:NSDataWritingFileProtectionComplete error:&error];
        }
    }
    
    NSString *strDocumentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    NSArray *fileArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:strDocumentDirectory error:nil];
    for(NSString *file in fileArray){
        path = [[strDocumentDirectory stringByAppendingString:@"/"] stringByAppendingString:file];
        BOOL isDir;
        if ([[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir]){
            if(!isDir){
                NSError *error;
                NSData *data = [[NSFileManager defaultManager] contentsAtPath:path];
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                [data writeToFile:path options:NSDataWritingFileProtectionComplete error:&error];
            }
        }
    }
}
@end
