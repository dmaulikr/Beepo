#import "Votacao.h"
#import "Fim.h"
#import "PopUpViewController.h"

@interface Votacao (){
    BOOL opcao1;
    BOOL opcao2;
    BOOL opcao3;
    NSString* path10;
}


@property (nonatomic) IBOutlet UIView* viewFundo;
@property (weak, nonatomic) IBOutlet UILabel *txtLabel;
@property (nonatomic) IBOutlet UIImageView* fundo;
@property (nonatomic) IBOutlet UIButton* opcao1;
@property (nonatomic) IBOutlet UIButton* opcao2;
@property (nonatomic) IBOutlet UIButton* opcao3;
@property (nonatomic) IBOutlet UIButton* confirma;
@property (nonatomic) IBOutlet UIButton* cancela;
@property (nonatomic) IBOutlet UIImageView* badgeDoacao;
@property (nonatomic) IBOutlet UIImageView* badgeVoto;
@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;
@property (weak, nonatomic) IBOutlet UIImageView *btn1SelectedBorder;
@property (weak, nonatomic) IBOutlet UIImageView *btn2SelectedBorder;
@property (weak, nonatomic) IBOutlet UIImageView *btn3SelectedBorder;
@property (strong, nonatomic) UIViewController *popUpView;


@end

@implementation Votacao


- (void)viewDidLoad {
    [super viewDidLoad];
  //  if (!self.player) {
  //      self.player = [[Player alloc]init];
  //  }
    opcao1 = false;
    opcao2 = false;
    opcao3 = false;
    
    dispatch_async(dispatch_get_main_queue(), ^{
   //     if (self.player.medalha1fase4) {
            self.badgeDoacao.image = [UIImage imageNamed:@"badge-doacao-color"];
   //     }
   //     if (self.player.medalha2fase4) {
            self.badgeVoto.image = [UIImage imageNamed:@"badge-eleicao-color"];
   //     }
    });
    
    path10 = [NSString stringWithFormat:@"%@/12_prefeitura-puzzlecaixa.mp3", [[NSBundle mainBundle] resourcePath]];
}

-(IBAction)opcao1:(id)sender{
    opcao1 = true;
    opcao2 = false;
    opcao3 = false;
    self.opcao1.selected = YES;
    self.opcao2.selected = NO;
    self.opcao3.selected = NO;
    self.btn1SelectedBorder.hidden = YES;
    self.btn2SelectedBorder.hidden = YES;
    self.btn3SelectedBorder.hidden = NO;
}

-(IBAction)opcao2:(id)sender{
    opcao1 = false;
    opcao2 = true;
    opcao3 = false;
    self.opcao1.selected = NO;
    self.opcao2.selected = YES;
    self.opcao3.selected = NO;
    self.btn1SelectedBorder.hidden = YES;
    self.btn2SelectedBorder.hidden = NO;
    self.btn3SelectedBorder.hidden = YES;
}

-(IBAction)opcao3:(id)sender{
    opcao1 = false;
    opcao2 = false;
    opcao3 = true;
    self.opcao1.selected = NO;
    self.opcao2.selected = NO;
    self.opcao3.selected = YES;
    self.btn1SelectedBorder.hidden = NO;
    self.btn2SelectedBorder.hidden = YES;
    self.btn3SelectedBorder.hidden = YES;
}

-(void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(IBAction)confirmar:(id)sender{
    if (opcao1) {
   //     self.player.nomeEscolhido = @"Felizópolis";
    }
    else if (opcao2){
 //       self.player.nomeEscolhido = @"Maravilandia";
    }
    else{
 //       self.player.nomeEscolhido = @"Alegrolandia";
    }
  //  self.player.medalha2fase4 = YES;
    self.badgeVoto.image = [UIImage imageNamed:@"badge-eleicao-color"];
    PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
    [popUp setImageNamed: @"pop-up-cidadania"];
    self.popUpView = popUp;
    [popUp showInView:self.view animated:YES];
    [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(voltaPrefeitura) userInfo:nil repeats:NO];
//    Fim *game = [self.storyboard instantiateViewControllerWithIdentifier:@"FimVC"];
//    [game setModalPresentationStyle:UIModalPresentationFullScreen];
//    game.player = self.player;
//    [self presentViewController:game animated:NO completion:nil];
//
}

-(void)voltaPrefeitura{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)cancelar:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path10];
    
    // Create audio player object and initialize with URL to sound
  //  _audioPlayer11 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
  //  [_audioPlayer11 play];
}

@end
