#import "Phase3Parte2.h"
#import "DraggableView.h"
#import "PhasesChoose.h"
#import "DraggableView.h"
#import "PopUpViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface Phase3Parte2 (){
    
    NSTimer *phase3Part2Timer;
    AVAudioPlayer *_audioPlayer8;
    NSString* path7;
}
@property (nonatomic) IBOutlet UIImageView* fundo;
@property (nonatomic) IBOutlet UIImageView* imageViewPuzzle;
@property (nonatomic) IBOutlet DraggableView* viewCarro1;
@property (nonatomic) IBOutlet DraggableView* viewCarro2;
@property (nonatomic) IBOutlet UIImageView* ambulancia;
@property (nonatomic) IBOutlet UIImageView* badgeTransito;
@property (nonatomic) IBOutlet UIImageView* badgeIdoso;
@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;
@property (strong, nonatomic) UIViewController *popUpView;

@end

@implementation Phase3Parte2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    path7 = [NSString stringWithFormat:@"%@/8_rua.mp3", [[NSBundle mainBundle] resourcePath]];

    
    _viewCarro1.podeY = YES;
    _viewCarro2.podeY = YES;
    
    [self checkWayFree];
   // if (self.player.medalha1fase3) {
        self.badgeIdoso.image = [UIImage imageNamed:@"badge-idoso-color"];
   // }
   // if (self.player.medalha2fase3) {
        self.badgeTransito.image = [UIImage imageNamed:@"badge-transito-color"];
   // }
    
    [self.fundo addSubview:self.botaoSom];
    [self.fundo addSubview:self.botaoVoltar];
    [self.fundo addSubview:self.badgeIdoso];
    [self.fundo addSubview:self.badgeTransito];
    
    self.ambulancia.image = [UIImage animatedImageNamed:@"ambulancia-" duration:.5f];
//    [self.fundo addSubview:self.ambulancia];
}

-(void)checkWayFree{
    if (self.viewCarro1.center.y < 240) {
        self.viewCarro1.podeY = false;
    }
    if (self.viewCarro2.center.y > 540) {
        self.viewCarro2.podeY = false;
    }
    if (self.viewCarro1.center.y < 260 && self.viewCarro2.center.y > 540) {
        [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.ambulancia.frame = CGRectMake(1200, self.ambulancia.frame.origin.y, self.ambulancia.frame.size.width, self.ambulancia.frame.size.height); } completion:nil];
        if (phase3Part2Timer) {
            [phase3Part2Timer invalidate];
        }
        phase3Part2Timer = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(showBadgePopUp) userInfo:nil repeats:NO];
    //    self.player.medalha2fase3 = true;
        self.badgeTransito.image = [UIImage imageNamed:@"badge-transito-color"];
    }
    else{
        if (phase3Part2Timer) {
            [phase3Part2Timer invalidate];
        }
        phase3Part2Timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(checkWayFree) userInfo:nil repeats:NO];
    }
}

- (void)showBadgePopUp{
    PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
    [popUp setImageNamed: @"pop-up-transito"];
    popUp.badgeImageView.image = [UIImage imageNamed:@"pop-up-transito"];
    self.popUpView = popUp;
    [popUp showInView:self.view animated:YES];
    if (phase3Part2Timer) {
        [phase3Part2Timer invalidate];
    }
    phase3Part2Timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(escolhaDeFases) userInfo:nil repeats:NO];
}
- (IBAction)btnVoltarClicked:(id)sender {
 //   [self.player dismissToPhaseSelect];
}

-(void)escolhaDeFases{
 //   [self.player dismissToPhaseSelect];
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path7];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer8 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_audioPlayer8 play];
}


@end
