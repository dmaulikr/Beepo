#import "MiscellaneousAudio.h"
#import <AVFoundation/AVFoundation.h>

@implementation MiscellaneousAudio
AVAudioPlayer *_audioPlayer;

+ (id)sharedManager {
    static MiscellaneousAudio *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void) playSongFromPath:(NSString *)path{
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [_audioPlayer play];
    [_audioPlayer setVolume:0.2];
}

@end
