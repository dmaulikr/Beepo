#import "Fim.h"
#import <AVFoundation/AVFoundation.h>

@interface Fim (){
    
    NSString* path200;
    AVAudioPlayer* _audioPlayer100;
}


@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UIImageView *cityNameLabel;
@property (nonatomic) IBOutlet UIImageView* fundo;

@end

@implementation Fim
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    _audioPlayer100 = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    path200 = [NSString stringWithFormat:@"%@/14_fim_jogo.mp3", [[NSBundle mainBundle] resourcePath]];
    // Do any additional setup after loading the view.
     dispatch_async(dispatch_get_main_queue(), ^{
    //    if ([self.player.nomeEscolhido isEqualToString:@"Felizópolis"]) {
            self.flagImageView.image = [UIImage imageNamed:@"prefeitura-11"];
            self.cityNameLabel.image = [UIImage imageNamed:@"prefeitura-16"];
    //    }else if([self.player.nomeEscolhido isEqualToString:@"Maravilandia"]){
            self.flagImageView.image = [UIImage imageNamed:@"prefeitura-12"];
            self.cityNameLabel.image = [UIImage imageNamed:@"prefeitura-19"];
      //  }else{
            self.flagImageView.image = [UIImage imageNamed:@"prefeitura-10"];
            self.cityNameLabel.image = [UIImage imageNamed:@"prefeitura-17"];
      //  }
     });
}
-(void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path200];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer100 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_audioPlayer100 play];
}

@end
