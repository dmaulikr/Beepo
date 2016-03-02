#import "FourthEndViewController.h"
#import "MiscellaneousAudio.h"
#import "Player.h"

@interface FourthEndViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *flagImageView;
@property (nonatomic, weak) IBOutlet UIImageView *cityNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView* fundo;
@property (nonatomic, strong) NSString *path;

@end

@implementation FourthEndViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(askedToDismissEnd)];
    [self.view addGestureRecognizer:swipe];
    
    Player *player = [Player sharedManager];
    _path = [NSString stringWithFormat:@"%@/14_fim_jogo.mp3", [[NSBundle mainBundle] resourcePath]];
    if ([player.nomeEscolhido isEqualToString:@"Felizópolis"]) {
        self.flagImageView.image = [UIImage imageNamed:@"prefeitura-11"];
        self.cityNameLabel.image = [UIImage imageNamed:@"prefeitura-16"];
    }else if([player.nomeEscolhido isEqualToString:@"Maravilandia"]){
        self.flagImageView.image = [UIImage imageNamed:@"prefeitura-12"];
        self.cityNameLabel.image = [UIImage imageNamed:@"prefeitura-19"];
    }else{
        self.flagImageView.image = [UIImage imageNamed:@"prefeitura-10"];
        self.cityNameLabel.image = [UIImage imageNamed:@"prefeitura-17"];
    }
}

-(IBAction)didTappedVoiceStory:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:_path];
}

- (void) askedToDismissEnd{
    if ([_delegate respondsToSelector:@selector(askedToDismissEnd)]) {
        [_delegate askedToDismissEnd];
    }
}

@end
