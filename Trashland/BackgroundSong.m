#import "BackgroundSong.h"
#import <AVFoundation/AVFoundation.h>

@implementation BackgroundSong
AVAudioPlayer *_backgroundAudioPlayer;

+ (id)sharedManager {
    static BackgroundSong *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void) playSongFromPath:(NSString *)path{
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    _backgroundAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [_backgroundAudioPlayer play];
    [_backgroundAudioPlayer setVolume:0.2];
    _backgroundAudioPlayer.numberOfLoops = -1;
}

@end