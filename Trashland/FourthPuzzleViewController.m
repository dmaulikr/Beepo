#import "FourthPuzzleViewController.h"
#import "PopUpViewController.h"
#import "DraggableImageView.h"
#import "Player.h"
#import "MiscellaneousAudio.h"

@interface FourthPuzzleViewController () <PopUpViewControllerDelegate, DraggableImageViewDelegate>

@property (nonatomic, weak) IBOutlet UIImageView* fundo;
@property (nonatomic, weak) IBOutlet UILabel *txtLabel;
@property (nonatomic, weak) IBOutlet DraggableImageView* brinquedo1;
@property (nonatomic, weak) IBOutlet DraggableImageView* brinquedo2;
@property (nonatomic, weak) IBOutlet DraggableImageView* brinquedo3;
@property (nonatomic, weak) IBOutlet DraggableImageView* brinquedo4;
@property (nonatomic, weak) IBOutlet UIButton* botaoVoltar;
@property (nonatomic, weak) IBOutlet UIButton* botaoSom;
@property (nonatomic, weak) IBOutlet UIImageView* badgeBrinquedo;
@property (nonatomic, weak) IBOutlet UIImageView* badgeVoto;
@property (nonatomic, strong) UIViewController *popUpView;
@property (nonatomic, strong) NSString *path;

@end

@implementation FourthPuzzleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Player *player = [Player sharedManager];
    
    _brinquedo1.delegate = self;
    _brinquedo2.delegate = self;
    _brinquedo3.delegate = self;
    _brinquedo4.delegate = self;
    
    _path = [NSString stringWithFormat:@"%@/13_prefeitura-puzzleeleicao.mp3", [[NSBundle mainBundle] resourcePath]];
    
    if (player.seventhMedal) self.badgeBrinquedo.image = [UIImage imageNamed:@"badge-doacao-color"];
    if (player.eigthMedal) self.badgeVoto.image = [UIImage imageNamed:@"badge-eleicao-color"];
}

- (IBAction)didTappedBackButton:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(askedToDismissPuzzle)]) {
        [_delegate askedToDismissPuzzle];
    }
}

-(IBAction)didTappedVoiceStory:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:_path];
}

- (void)askedToDismissPopUp{
    if ([_delegate respondsToSelector:@selector(askedToDismissPuzzle)]) {
        [_delegate askedToDismissPuzzle];
    }
}

- (void) checkPostions{
    Player *player = [Player sharedManager];
    if (self.brinquedo1.center.x < 580 && self.brinquedo1.center.x > 75) {
        if (self.brinquedo1.center.y < 630 && self.brinquedo1.center.y > 130) {
            if (self.brinquedo2.center.x < 580 && self.brinquedo2.center.x > 75) {
                if (self.brinquedo2.center.y < 630 && self.brinquedo2.center.y > 130) {
                    if (self.brinquedo3.center.x < 580 && self.brinquedo3.center.x > 75) {
                        if (self.brinquedo3.center.y < 630 && self.brinquedo3.center.y > 130) {
                            if (self.brinquedo4.center.x < 580 && self.brinquedo4.center.x > 75) {
                                if (self.brinquedo4.center.y < 630 && self.brinquedo4.center.y > 130 &&!player.seventhMedal) {
                                    player.seventhMedal = true;
                                    self.badgeBrinquedo.image = [UIImage imageNamed:@"badge-doacao-color"];
                                    PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
                                    popUp.delegate = self;
                                    [popUp setImageNamed: @"pop-up-doacao"];
                                    self.popUpView = popUp;
                                    [popUp showInView:self.view animated:YES];
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

@end
