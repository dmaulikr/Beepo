#import "FourthPhaseViewController.h"
#import "FourthVotingViewController.h"
#import "FourthPuzzleViewController.h"
#import "FourthEndViewController.h"
#import "MiscellaneousAudio.h"
#import "Player.h"

@interface FourthPhaseViewController () <FourthVotingViewControllerDelegate, FourthPuzzleViewControllerDelegate, FourthEndViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UIButton* botaoDoacao;
@property (nonatomic, weak) IBOutlet UIButton* botaoEleicao;
@property (weak, nonatomic) IBOutlet UIImageView *badgeDoacaoImgView;
@property (weak, nonatomic) IBOutlet UIImageView *badgeEleicaoImgView;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, weak) FourthPuzzleViewController *fourthPuzzleViewController;
@property (nonatomic, weak) FourthVotingViewController *fourthVotingViewController;
@property (nonatomic, weak) FourthEndViewController *fourthEndViewController;

@end

@implementation FourthPhaseViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    Player *player = [Player sharedManager];
    
    _path = [NSString stringWithFormat:@"%@/11_prefeitura.mp3", [[NSBundle mainBundle] resourcePath]];
    
    if (player.seventhMedal) {
        self.badgeDoacaoImgView.image = [UIImage imageNamed:@"badge-doacao-color"];
    }
    if (player.eigthMedal) {
            self.badgeEleicaoImgView.image = [UIImage imageNamed:@"badge-eleicao-color"];
    }
}

- (IBAction)didClickUrna:(id)sender {
    [self performSegueWithIdentifier:@"votingSegue" sender:self];
}

- (IBAction)didClickBox:(id)sender {
    [self performSegueWithIdentifier:@"puzzleSegue" sender:self];
}

- (IBAction)didTappedBackButton:(id)sender {

}

-(IBAction)didTappedVoiceStory:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:_path];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"endSegue"]) {
        _fourthEndViewController = segue.destinationViewController;
        _fourthEndViewController.delegate = self;
    }
    if ([segue.identifier isEqualToString:@"votingSegue"]) {
        _fourthVotingViewController = segue.destinationViewController;
        _fourthVotingViewController.delegate = self;
    }
    if ([segue.identifier isEqualToString:@"puzzleSegue"]) {
        _fourthPuzzleViewController = segue.destinationViewController;
        _fourthPuzzleViewController.delegate = self;
    }
}

- (void) askedToDismissPuzzle{
    Player *player = [Player sharedManager];
    [_fourthPuzzleViewController dismissViewControllerAnimated:YES completion:^(void){
        if (player.seventhMedal && player.eigthMedal) {
            [self performSegueWithIdentifier:@"endSegue" sender:self];
        }
    }];
}

- (void) askedVotingDismiss{
    Player *player = [Player sharedManager];
    [_fourthVotingViewController dismissViewControllerAnimated:YES completion:^(void){
        if (player.seventhMedal && player.eigthMedal) {
            [self performSegueWithIdentifier:@"endSegue" sender:self];
        }
    }];
}
@end
