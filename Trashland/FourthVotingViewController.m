#import "FourthVotingViewController.h"
#import "FourthEndViewController.h"
#import "PopUpViewController.h"
#import "MiscellaneousAudio.h"
#import "Player.h"

@interface FourthVotingViewController () <PopUpViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UIView* viewFundo;
@property (nonatomic, weak) IBOutlet UILabel *txtLabel;
@property (nonatomic, weak) IBOutlet UIImageView* fundo;
@property (nonatomic, weak) IBOutlet UIButton* opcao1;
@property (nonatomic, weak) IBOutlet UIButton* opcao2;
@property (nonatomic, weak) IBOutlet UIButton* opcao3;
@property (nonatomic, weak) IBOutlet UIButton* confirma;
@property (nonatomic, weak) IBOutlet UIButton* cancela;
@property (nonatomic, weak) IBOutlet UIImageView* badgeDoacao;
@property (nonatomic, weak) IBOutlet UIImageView* badgeVoto;
@property (nonatomic, weak) IBOutlet UIButton* botaoVoltar;
@property (nonatomic, weak) IBOutlet UIButton* botaoSom;
@property (nonatomic, weak) IBOutlet UIImageView *btn1SelectedBorder;
@property (nonatomic, weak) IBOutlet UIImageView *btn2SelectedBorder;
@property (nonatomic, weak) IBOutlet UIImageView *btn3SelectedBorder;
@property (nonatomic, strong) UIViewController *popUpView;
@property (nonatomic, strong) NSString *path;

@end

@implementation FourthVotingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    Player *player = [Player sharedManager];
    
    if (player.seventhMedal) self.badgeDoacao.image = [UIImage imageNamed:@"badge-doacao-color"];
    if (player.eigthMedal) self.badgeVoto.image = [UIImage imageNamed:@"badge-eleicao-color"];
    
    _path = [NSString stringWithFormat:@"%@/12_prefeitura-puzzlecaixa.mp3", [[NSBundle mainBundle] resourcePath]];
}

-(IBAction)opcao1:(id)sender{
    self.opcao1.selected = YES;
    self.opcao2.selected = NO;
    self.opcao3.selected = NO;
    self.btn1SelectedBorder.hidden = YES;
    self.btn2SelectedBorder.hidden = YES;
    self.btn3SelectedBorder.hidden = NO;
}

-(IBAction)opcao2:(id)sender{
    self.opcao1.selected = NO;
    self.opcao2.selected = YES;
    self.opcao3.selected = NO;
    self.btn1SelectedBorder.hidden = YES;
    self.btn2SelectedBorder.hidden = NO;
    self.btn3SelectedBorder.hidden = YES;
}

-(IBAction)opcao3:(id)sender{
    self.opcao1.selected = NO;
    self.opcao2.selected = NO;
    self.opcao3.selected = YES;
    self.btn1SelectedBorder.hidden = NO;
    self.btn2SelectedBorder.hidden = YES;
    self.btn3SelectedBorder.hidden = YES;
}


-(IBAction)didTappedConfirmButton:(id)sender{
    Player *player = [Player sharedManager];
    if ([self.opcao1 isSelected]) {
        player.nomeEscolhido = @"Felizópolis";
    }
    else if ([self.opcao2 isSelected]){
        player.nomeEscolhido = @"Maravilandia";
    }
    else{
        player.nomeEscolhido = @"Alegrolandia";
    }
    player.eigthMedal = YES;
    self.badgeVoto.image = [UIImage imageNamed:@"badge-eleicao-color"];
    PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
    popUp.delegate = self;
    [popUp setImageNamed: @"pop-up-cidadania"];
    self.popUpView = popUp;
    [popUp showInView:self.view animated:YES];
}

-(IBAction)didTappedBackButton:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)didTappedVoiceStory:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:_path];
}

- (void)askedToDismissPopUp{
    if ([_delegate respondsToSelector:@selector(askedVotingDismiss)]) {
        [_delegate askedVotingDismiss];
    }
}


@end
