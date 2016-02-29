#import "Phase4.h"
#import "Votacao.h"
#import "Puzzle4.h"
#import "Fim.h"

@interface Phase4 (){
    NSString* path11;
}


@property (nonatomic) IBOutlet UIButton* botaoDoacao;
@property (nonatomic) IBOutlet UIButton* botaoEleicao;
@property (weak, nonatomic) IBOutlet UIImageView *badgeDoacaoImgView;
@property (weak, nonatomic) IBOutlet UIImageView *badgeEleicaoImgView;

@end

@implementation Phase4

- (void)viewDidLoad {
    [super viewDidLoad];
    path11 = [NSString stringWithFormat:@"%@/11_prefeitura.mp3", [[NSBundle mainBundle] resourcePath]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    dispatch_async(dispatch_get_main_queue(), ^{
     //   if (self.player.medalha1fase4) {
            self.badgeDoacaoImgView.image = [UIImage imageNamed:@"badge-doacao-color"];
     //   }
     //   if (self.player.medalha2fase4) {
            self.badgeEleicaoImgView    .image = [UIImage imageNamed:@"badge-eleicao-color"];
     //   }
    });
    
   // if (self.player.medalha1fase4 && self.player.medalha2fase4) {
        Fim *game = [self.storyboard instantiateViewControllerWithIdentifier:@"FimVC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
     //   game.player = self.player;
        [self presentViewController:game animated:NO completion:nil];
   // }
}



- (IBAction)didClickUrna:(id)sender {
    Votacao *game = [self.storyboard instantiateViewControllerWithIdentifier:@"VotacaoVC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
  //  game.player = self.player;
    [self presentViewController:game animated:NO completion:nil];
}

- (IBAction)didClickBox:(id)sender {
    Puzzle4 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Puzzle4VC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
  //  game.player = self.player;
    [self presentViewController:game animated:NO completion:nil];
}
- (IBAction)voltarBtnClicked:(id)sender {
  //  [self.player dismissToPhaseSelect];
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path11];
    
    // Create audio player object and initialize with URL to sound
//    _audioPlayer12 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
  //  [_audioPlayer12 play];
}
@end
