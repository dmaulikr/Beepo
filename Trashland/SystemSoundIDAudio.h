#import <Foundation/Foundation.h>

@interface SystemSoundIDAudio : NSObject

+ (id)sharedManager;

- (void)requestedForSystemSound:(NSString *)urlForResource :(NSString *)withExtension;

- (void)requestedDisposal;

@end
