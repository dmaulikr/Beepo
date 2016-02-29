#import <Foundation/Foundation.h>

@interface MiscellaneousAudio : NSObject

+ (id)sharedManager;

- (void) playSongFromPath:(NSString *)path;

@end
