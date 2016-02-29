#import "SystemSoundIDAudio.h"
#import <AudioToolbox/AudioToolbox.h>

@interface SystemSoundIDAudio (){
    SystemSoundID sound1;
}

@end

@implementation SystemSoundIDAudio

+ (id)sharedManager {
    static SystemSoundIDAudio *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void)requestedForSystemSound:(NSString *)urlForResource :(NSString *)withExtension{
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:urlForResource withExtension:withExtension];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)requestedDisposal{
    AudioServicesDisposeSystemSoundID(sound1);
}

@end
