#import <Foundation/Foundation.h>

@interface BackgroundSong : NSObject

+ (id)sharedManager;

- (void) playSongFromPath:(NSString *)path;

@end
