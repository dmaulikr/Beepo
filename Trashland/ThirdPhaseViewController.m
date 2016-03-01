#import "ThirdPhaseViewController.h"
#import "ThirdPhasePlusViewController.h"
#import "PopUpViewController.h"
#import "DraggableView.h"


@interface ThirdPhaseViewController()  <UICollisionBehaviorDelegate>{
    
    NSTimer *phase3Timer;
    NSString* path6;
}

@property (nonatomic) IBOutlet UIImageView* fundo;
@property (nonatomic) IBOutlet UIView* viewBeepo;
@property (nonatomic) IBOutlet UIImageView* imageBeepo;
@property (nonatomic) IBOutlet UIImageView* imageSombraBeepo;
@property (nonatomic) IBOutlet DraggableView* viewVelha;
@property (nonatomic) IBOutlet UIImageView* imageVelha;
@property (nonatomic) IBOutlet UIImageView* imageSombraVelha;
@property (nonatomic) IBOutlet UIView* carro1;
@property (nonatomic) IBOutlet UIView* carro2;
@property (nonatomic) UIView* barrier;
@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;
@property (nonatomic) IBOutlet UIImageView* badgeIdoso;
@property (nonatomic) IBOutlet UIImageView* badgeTransito;
@property (strong, nonatomic) UIViewController *popUpView;
@property (nonatomic) IBOutlet UIImageView* sinalVerde;

@end

@implementation ThirdPhaseViewController
UIDynamicAnimator* _animator2;
UICollisionBehavior* _collision2;
-(void)dealloc{
    NSLog(@"desalocou phase3");
}

-(void) viewDidLoad{
    [super viewDidLoad];
    [self checkBadges];
    
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(setGreen) userInfo:nil repeats:NO];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view.layer removeAllAnimations]; 
    [phase3Timer invalidate];
}

-(void)setGreen{
    self.sinalVerde.hidden = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    path6 = [NSString stringWithFormat:@"%@/hospital.mp3", [[NSBundle mainBundle] resourcePath]];
    
    
    [super viewDidAppear:animated];
 //   self.imageBeepo.image = self.player.gasperEscolhido;
    
    self.viewVelha.userInteractionEnabled = YES;
    self.viewVelha.delegate = self;
    self.viewVelha.charImgView = self.imageVelha;
    _viewVelha.allowVerticalAxisMovement = YES;
    [self moveBeepo:self.viewBeepo];
    [self moveCar1:self.carro1];
    [self moveCar2:self.carro2];
    [self watchThisBitch];
    
    CGRect charFrame = self.imageBeepo.frame;
    charFrame.origin.y = charFrame.origin.y - 25.0;
    charFrame.size.height = charFrame.size.height + 15.0;
    
    CGRect shadowFrame = self.imageSombraBeepo.frame;
    shadowFrame.size.width = shadowFrame.size.width/2.0;
    shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:NSUIntegerMax];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.imageBeepo.frame = charFrame;
    self.imageSombraBeepo.frame = shadowFrame;
    
    CGRect charFrame2 = self.imageVelha.frame;
    charFrame2.origin.y = charFrame2.origin.y - 25.0;
    charFrame2.size.height = charFrame2.size.height + 15.0;
    
    CGRect shadowFrame2 = self.imageSombraVelha.frame;
    shadowFrame2.size.width = shadowFrame2.size.width/2.0;
    shadowFrame2.origin.x = shadowFrame2.origin.x + shadowFrame2.size.width/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.8];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:NSUIntegerMax];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.imageVelha.frame = charFrame2;
    self.imageSombraVelha.frame = shadowFrame2;

    [UIView commitAnimations];
    
    [self.fundo addSubview:self.botaoSom];
    [self.fundo addSubview:self.botaoVoltar];
    [self.fundo addSubview:self.badgeIdoso];
    [self.fundo addSubview:self.badgeTransito];
    [self.fundo addSubview:self.sinalVerde];
    self.sinalVerde.hidden = YES;
}

-(void)checkBadges{
  //  if (self.player.medalha2fase3) {
        self.badgeTransito.image = [UIImage imageNamed:@"badge-transito-color"];
        self.badgeIdoso.image = [UIImage imageNamed:@"badge-idoso-color"];
 //   }
  //  else if (self.player.medalha1fase3){
        self.badgeIdoso.image = [UIImage imageNamed:@"badge-idoso-color"];
 //   }
 //   else{
        if (phase3Timer) {
            [phase3Timer invalidate];
        }
        phase3Timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(checkBadges) userInfo:nil repeats:NO];
 //   }
}

- (void)moveBeepo:(UIImageView *)imageView{
    [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.frame = CGRectMake(150.f, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

- (void)moveCar1:(UIImageView *)imageView{
    [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.frame = CGRectMake(543.f, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

- (void)moveCar2:(UIImageView *)imageView{
    [UIView animateWithDuration:2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.frame = CGRectMake(592.f, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

-(void)watchThisBitch{
    if (self.viewVelha.center.y < 480) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-idoso"];
        self.popUpView = popUp;
        [popUp showInView:self.view animated:YES];
        self.badgeIdoso.image = [UIImage imageNamed:@"badge-idoso-color"];
        //self.badgeTransito.image = [UIImage imageNamed:@"badge-transito-color"];
        if (phase3Timer) {
            [phase3Timer invalidate];
        }
        phase3Timer = [NSTimer scheduledTimerWithTimeInterval:2.5f target:self selector:@selector(startSecondPart) userInfo:nil repeats:NO];
    }
    else{
        if (phase3Timer) {
            [phase3Timer invalidate];
        }
        phase3Timer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(watchThisBitch) userInfo:nil repeats:NO];
    }
}

- (void)startSecondPart{
    
    ThirdPhasePlusViewController *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase3Parte2VC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
//    self.player.medalha1fase3 = true;
 //   self.player.fase4 = true;
 //   game.player = self.player;
    [self presentViewController:game animated:NO completion:nil];
}
- (IBAction)didClickVoltarButton:(id)sender {
 //   [self.player dismissToPhaseSelect];
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path6];
    
    // Create audio player object and initialize with URL to sound
  //  _audioPlayer7 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
  //  [_audioPlayer7 play];
}
@end
