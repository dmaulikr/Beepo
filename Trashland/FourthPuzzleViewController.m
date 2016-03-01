#import "FourthPuzzleViewController.h"
#import "PopUpViewController.h"
#import "DraggableImageView.h"

@interface FourthPuzzleViewController (){
    BOOL ponto1;
    BOOL ponto2;
    BOOL ponto3;
    BOOL ponto4;
    NSTimer* badgeCheck;
}


@property (nonatomic) IBOutlet UIImageView* fundo;
@property (weak, nonatomic) IBOutlet UILabel *txtLabel;
@property (nonatomic) IBOutlet DraggableImageView* brinquedo1;
@property (nonatomic) IBOutlet DraggableImageView* brinquedo2;
@property (nonatomic) IBOutlet DraggableImageView* brinquedo3;
@property (nonatomic) IBOutlet DraggableImageView* brinquedo4;
@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;
@property (nonatomic) IBOutlet UIImageView* badgeBrinquedo;
@property (nonatomic) IBOutlet UIImageView* badgeVoto;
@property (strong, nonatomic) UIViewController *popUpView;

@end

@implementation FourthPuzzleViewController
NSString* path9;

-(void)dealloc{
    NSLog(@"desalocou puzzle4");
}

-(void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    path9 = [NSString stringWithFormat:@"%@/13_prefeitura-puzzleeleicao.mp3", [[NSBundle mainBundle] resourcePath]];
    
    ponto1 = false;
    ponto2 = false;
    ponto3 = false;
    ponto4 = false;
    
    [self.view addSubview:self.fundo];
    [self.fundo addSubview:self.brinquedo1];
    [self.fundo addSubview:self.brinquedo2];
    [self.fundo addSubview:self.brinquedo3];
    [self.fundo addSubview:self.brinquedo4];
    [self.fundo addSubview:self.botaoVoltar];
    [self.fundo addSubview:self.botaoSom];
    [self.fundo addSubview:self.badgeBrinquedo];
    [self.fundo addSubview:self.badgeVoto];
    [self.fundo addSubview:self.txtLabel];
    
    badgeCheck = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(checkToys) userInfo:nil repeats:YES];

}

-(void)viewWillAppear:(BOOL)animated{
    dispatch_async(dispatch_get_main_queue(), ^{
    //    if (self.player.medalha1fase4) {
            self.badgeBrinquedo.image = [UIImage imageNamed:@"badge-doacao-color"];
    //    }
    //    if (self.player.medalha2fase4) {
            self.badgeVoto.image = [UIImage imageNamed:@"badge-eleicao-color"];
     //   }
    });
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *myTouch = [[touches allObjects] objectAtIndex: 0];
    CGPoint currentPos = [myTouch locationInView: self.fundo];
    NSLog(@"Point in myView: (%f,%f)", currentPos.x, currentPos.y);
}

-(void)checkToys{
    if (self.brinquedo1.center.x < 580 && self.brinquedo1.center.x > 75) {
        if (self.brinquedo1.center.y < 630 && self.brinquedo1.center.y > 130) {
            ponto1 = true;
            if (self.brinquedo2.center.x < 580 && self.brinquedo2.center.x > 75) {
                if (self.brinquedo2.center.y < 630 && self.brinquedo2.center.y > 130) {
                    ponto2 = true;
                    if (self.brinquedo3.center.x < 580 && self.brinquedo3.center.x > 75) {
                        if (self.brinquedo3.center.y < 630 && self.brinquedo3.center.y > 130) {
                            ponto3 = true;
                            if (self.brinquedo4.center.x < 580 && self.brinquedo4.center.x > 75) {
            //                    if (self.brinquedo4.center.y < 630 && self.brinquedo4.center.y > 130 &&!self.player.medalha1fase4) {
                                    [badgeCheck invalidate];
                                    ponto4 = true;
              //                      self.player.medalha1fase4 = true;
                                    self.badgeBrinquedo.image = [UIImage imageNamed:@"badge-doacao-color"];
                                    PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
                                    [popUp setImageNamed: @"pop-up-doacao"];
                                    self.popUpView = popUp;
                                    [popUp showInView:self.view animated:YES];
                                    
                                    [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(voltaPrefeitura) userInfo:nil repeats:NO];
                                }
                            }
                        }
                    }
                }
            }
        }
   // }
}

-(void)voltaPrefeitura{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)botaoVoltarClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path9];
    
    // Create audio player object and initialize with URL to sound
 //   _audioPlayer10 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
   // [_audioPlayer10 play];
}

@end
