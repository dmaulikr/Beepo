#import "PhasesViewController.h"
#import "Player.h"

@interface PhasesViewController ()

@property (nonatomic, weak) IBOutlet UIButton* fase1;
@property (nonatomic, weak) IBOutlet UIImageView* medalha1fase1;
@property (nonatomic, weak) IBOutlet UIImageView* medalha2fase1;
@property (nonatomic, weak) IBOutlet UIButton* fase2;
@property (nonatomic, weak) IBOutlet UIImageView* medalha1fase2;
@property (nonatomic, weak) IBOutlet UIImageView* medalha2fase2;
@property (nonatomic, weak) IBOutlet UIButton* fase3;
@property (nonatomic, weak) IBOutlet UIImageView* medalha1fase3;
@property (nonatomic, weak) IBOutlet UIImageView* medalha2fase3;
@property (nonatomic, weak) IBOutlet UIButton* fase4;
@property (nonatomic, weak) IBOutlet UIImageView* medalha1fase4;
@property (nonatomic, weak) IBOutlet UIImageView* medalha2fase4;

@end

@implementation PhasesViewController

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    Player *player = [Player sharedManager];
    
    [self.fase1 setBackgroundImage:[UIImage imageNamed:@"atividades-casa-color"] forState:UIControlStateNormal];
    if (player.firstMedal) self.medalha1fase1.image = [UIImage imageNamed:@"badge-luz-color"];
    if (player.secondMedal) self.medalha2fase1.image = [UIImage imageNamed:@"badge-agua-color"];
    if (player.firstMedal && player.secondMedal) [self.fase2 setBackgroundImage:[UIImage imageNamed:@"atividades-praca-color"] forState:UIControlStateNormal];
    if (player.thirdMedal) self.medalha1fase2.image = [UIImage imageNamed:@"badge-lixo-color"];
    if (player.fourthMedal) self.medalha2fase2.image = [UIImage imageNamed:@"badge-natureza-color"];
    if (player.thirdMedal && player.fourthMedal) [self.fase3 setBackgroundImage:[UIImage imageNamed:@"atividades-rua-color"] forState:UIControlStateNormal];
    if (player.fifthMedal) self.medalha1fase3.image = [UIImage imageNamed:@"badge-idoso-color"];
    if (player.sixthMedal) self.medalha2fase3.image = [UIImage imageNamed:@"badge-transito-color"];
    if (player.fifthMedal && player.sixthMedal) [self.fase4 setBackgroundImage:[UIImage imageNamed:@"atividades-prefeitura-color"] forState:UIControlStateNormal];
    if (player.seventhMedal) self.medalha1fase4.image = [UIImage imageNamed:@"badge-doacao-color"];
    if (player.eigthMedal) self.medalha2fase4.image = [UIImage imageNamed:@"badge-eleicao-color"];
}

-(IBAction)didTappedBackButton:(id)sender{
    if ([_delegate respondsToSelector:@selector(askedToDismissPhases)]) {
        [_delegate askedToDismissPhases];
    }
}

- (IBAction)didTappedFirstPhase:(id)sender{
    [self performSegueWithIdentifier:@"houseSegue" sender:self];
}

- (IBAction)didTappedSecondPhase:(id)sender{
    Player *player = [Player sharedManager];
    if (player.firstMedal && player.secondMedal) {
        [self performSegueWithIdentifier:@"parkSegue" sender:self];
    }
}

- (IBAction)didTappedThirdPhase:(id)sender{
    Player *player = [Player sharedManager];
    if (player.thirdMedal && player.fourthMedal) {
        [self performSegueWithIdentifier:@"streetSegue" sender:self];
    }
}

- (IBAction)didTappedFourthPhase:(id)sender{
    Player *player = [Player sharedManager];
    if (player.fifthMedal && player.sixthMedal) {
        [self performSegueWithIdentifier:@"cityHallSegue" sender:self];
    }
}

@end
