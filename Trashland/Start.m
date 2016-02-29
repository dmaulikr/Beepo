#import "Start.h"
#import <AudioToolbox/AudioToolbox.h>
#import "UIView+Animation2.h"
#import <AVFoundation/AVFoundation.h>

@interface Start ()

@property (nonatomic, weak) IBOutlet UIImageView* predios;
@property (nonatomic, weak) IBOutlet UIButton* play;

@end

@implementation Start
SystemSoundID sound2;
AVAudioPlayer *_audioPlayer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:1.8f target:self selector:@selector(balancarLogo) userInfo:nil repeats:YES];
    [self.play tada:NULL];
    
    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:@"%@/carefree.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
    // Create audio player object and initialize with URL to sound
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
    [_audioPlayer play];
    [_audioPlayer setVolume:0.2];
    _audioPlayer.numberOfLoops = -1;
    
    [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(trocarPredio) userInfo:nil repeats:YES];
}

- (IBAction)didTappedPlayButton:(id)sender{
    [self performSegueWithIdentifier:@"" sender:self];
}

- (IBAction)didTappedInfoButton:(id)sender{
    [self performSegueWithIdentifier:@"" sender:self];
}

-(void)trocarPredio{
    self.predios.image = [self.predios.image isEqual:[UIImage imageNamed:@"predio2"]] ? [UIImage imageNamed:@"predio"] : [UIImage imageNamed:@"predio2"];
}

-(void)balancarLogo{
    [self.play pulse:NULL];
}

@end
