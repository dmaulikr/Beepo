#import "ThirdPhasePlusViewController.h"
#import "DraggableView.h"
#import "PhasesViewController.h"
#import "DraggableView.h"
#import "Player.h"
#import "MiscellaneousAudio.h"
#import "PopUpViewController.h"

@interface ThirdPhasePlusViewController () <DraggableViewDelegate, PopUpViewControllerDelegate>
@property (nonatomic, weak) IBOutlet UIImageView* fundo;
@property (nonatomic, weak) IBOutlet UIImageView* imageViewPuzzle;
@property (nonatomic, weak) IBOutlet DraggableView* viewCarro1;
@property (nonatomic, weak) IBOutlet DraggableView* viewCarro2;
@property (nonatomic, weak) IBOutlet UIImageView* ambulancia;
@property (nonatomic, weak) IBOutlet UIImageView* badgeTransito;
@property (nonatomic, weak) IBOutlet UIImageView* badgeIdoso;
@property (nonatomic, weak) IBOutlet UIButton* botaoVoltar;
@property (nonatomic, weak) IBOutlet UIButton* botaoSom;
@property (nonatomic, strong) UIViewController *popUpView;
@property (nonatomic, strong) NSString *path;

@end

@implementation ThirdPhasePlusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Player *player = [Player sharedManager];
    _path = [NSString stringWithFormat:@"%@/8_rua.mp3", [[NSBundle mainBundle] resourcePath]];
    _viewCarro1.allowVerticalAxisMovement = YES;
    _viewCarro2.allowVerticalAxisMovement = YES;
    
    _viewCarro1.delegate = self;
    _viewCarro2.delegate = self;

    if (player.fifthMedal) {
        self.badgeIdoso.image = [UIImage imageNamed:@"badge-idoso-color"];
    }
    if (player.sixthMedal) {
        self.badgeTransito.image = [UIImage imageNamed:@"badge-transito-color"];
    }
    
    [self.fundo addSubview:self.botaoSom];
    [self.fundo addSubview:self.botaoVoltar];
    [self.fundo addSubview:self.badgeIdoso];
    [self.fundo addSubview:self.badgeTransito];
    
    self.ambulancia.image = [UIImage animatedImageNamed:@"ambulancia-" duration:.5f];
}

- (void)showBadgePopUp{
    PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
    [popUp setImageNamed: @"pop-up-transito"];
    popUp.delegate = self;
    popUp.badgeImageView.image = [UIImage imageNamed:@"pop-up-transito"];
    self.popUpView = popUp;
    Player *player = [Player sharedManager];
    player.sixthMedal = true;
    [popUp showInView:self.view animated:YES];
}
- (IBAction)didClickVoltarButton:(id)sender {
    if ([_delegate respondsToSelector:@selector(askedToDismissThirdPhasePlus)]) {
        [_delegate askedToDismissThirdPhasePlus];
    }
}

-(IBAction)didTappedVoiceStory:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:_path];
}

- (void) checkPositions{
    if (self.viewCarro1.center.y < 240) {
        self.viewCarro1.allowVerticalAxisMovement = false;
    }
    if (self.viewCarro2.center.y > 540) {
        self.viewCarro2.allowVerticalAxisMovement = false;
    }
    if (self.viewCarro1.center.y < 260 && self.viewCarro2.center.y > 540) {
        [UIView animateWithDuration:2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.ambulancia.frame = CGRectMake(1200, self.ambulancia.frame.origin.y, self.ambulancia.frame.size.width, self.ambulancia.frame.size.height);
        } completion:^(BOOL finished){
            [self showBadgePopUp];
        }];
        self.badgeTransito.image = [UIImage imageNamed:@"badge-transito-color"];
    }
}

- (void) askedToDismissPopUp{
    if ([_delegate respondsToSelector:@selector(askedToDismissThirdPhasePlus)]) {
        [_delegate askedToDismissThirdPhasePlus];
    }
}

@end
