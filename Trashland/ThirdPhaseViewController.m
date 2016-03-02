#import "ThirdPhaseViewController.h"
#import "ThirdPhasePlusViewController.h"
#import "PopUpViewController.h"
#import "DraggableView.h"
#import "MiscellaneousAudio.h"
#import "Player.h"

@interface ThirdPhaseViewController()  <UICollisionBehaviorDelegate>

@property (nonatomic, weak) NSString *path;
@property (nonatomic, weak) IBOutlet UIImageView* fundo;
@property (nonatomic, weak) IBOutlet UIView* viewBeepo;
@property (nonatomic, weak) IBOutlet UIImageView* imageBeepo;
@property (nonatomic, weak) IBOutlet UIImageView* imageSombraBeepo;
@property (nonatomic, weak) IBOutlet DraggableView* viewVelha;
@property (nonatomic, weak) IBOutlet UIImageView* imageVelha;
@property (nonatomic, weak) IBOutlet UIImageView* imageSombraVelha;
@property (nonatomic, weak) IBOutlet UIView* carro1;
@property (nonatomic, weak) IBOutlet UIView* carro2;
@property (nonatomic, weak) IBOutlet UIButton* botaoVoltar;
@property (nonatomic, weak) IBOutlet UIButton* botaoSom;
@property (nonatomic, weak) IBOutlet UIImageView* badgeIdoso;
@property (nonatomic, weak) IBOutlet UIImageView* badgeTransito;
@property (nonatomic, weak) IBOutlet UIImageView* sinalVerde;
@property (nonatomic, weak) UIView* barrier;
@property (nonatomic, strong) UIViewController *popUpView;

@end

@implementation ThirdPhaseViewController
UIDynamicAnimator* _animator2;
UICollisionBehavior* _collision2;


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    Player *player = [Player sharedManager];
    _path = [NSString stringWithFormat:@"%@/hospital.mp3", [[NSBundle mainBundle] resourcePath]];
    _imageBeepo.image = player.gasperEscolhido;
    
    _viewVelha.userInteractionEnabled = YES;
    _viewVelha.delegate = self;
    _viewVelha.charImgView = self.imageVelha;
    _viewVelha.allowVerticalAxisMovement = YES;
    [self watchThisBitch];
    
    
    [UIView setAnimationsEnabled:YES];
    [UIView animateWithDuration:0.6 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        [UIView setAnimationRepeatCount:NSUIntegerMax];
        [UIView setAnimationRepeatAutoreverses:YES];
        __block CGRect charFrame = self.imageBeepo.frame;
        __block CGRect shadowFrame = self.imageSombraBeepo.frame;
        charFrame.origin.y = charFrame.origin.y - 25.0;
        charFrame.size.height = charFrame.size.height + 15.0;
        shadowFrame.size.width = shadowFrame.size.width/2.0;
        shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
        self.imageBeepo.frame = charFrame;
        self.imageSombraBeepo.frame = shadowFrame;
    } completion:nil];
    
    [UIView animateWithDuration:0.8 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        [UIView setAnimationRepeatCount:NSUIntegerMax];
        [UIView setAnimationRepeatAutoreverses:YES];
        __block CGRect charFrame2 = self.imageVelha.frame;
        charFrame2.origin.y = charFrame2.origin.y - 25.0;
        charFrame2.size.height = charFrame2.size.height + 15.0;
        __block CGRect shadowFrame2 = self.imageSombraVelha.frame;
        shadowFrame2.size.width = shadowFrame2.size.width/2.0;
        shadowFrame2.origin.x = shadowFrame2.origin.x + shadowFrame2.size.width/2;
        self.imageVelha.frame = charFrame2;
        self.imageSombraVelha.frame = shadowFrame2;
    } completion:nil];
    
    [self.fundo addSubview:self.botaoSom];
    [self.fundo addSubview:self.botaoVoltar];
    [self.fundo addSubview:self.badgeIdoso];
    [self.fundo addSubview:self.badgeTransito];
    [self.fundo addSubview:self.sinalVerde];
  //  self.sinalVerde.hidden = YES;
    
    _viewBeepo.translatesAutoresizingMaskIntoConstraints = NO;
    _carro1.translatesAutoresizingMaskIntoConstraints = NO;
    _carro2.translatesAutoresizingMaskIntoConstraints = NO;
    [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.viewBeepo.frame = CGRectMake(150.f, self.viewBeepo.frame.origin.y, self.viewBeepo.frame.size.width, self.viewBeepo.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _carro1.frame = CGRectMake(543.f, _carro1.frame.origin.y, _carro1.frame.size.width, _carro1.frame.size.height);
    
    } completion:nil];
    
    [UIView animateWithDuration:2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _carro2.frame = CGRectMake(592.f, _carro2.frame.origin.y, _carro2.frame.size.width, _carro2.frame.size.height);
    
    } completion:nil];
    
    [self checkBadges];
}

-(void)checkBadges{
    Player *player = [Player sharedManager];
    if (player.sixthMedal) {
        self.badgeTransito.image = [UIImage imageNamed:@"badge-transito-color"];
        self.badgeIdoso.image = [UIImage imageNamed:@"badge-idoso-color"];
    } else if (player.fifthMedal){
        self.badgeIdoso.image = [UIImage imageNamed:@"badge-idoso-color"];
    }
}

-(void)watchThisBitch{
    if (self.viewVelha.center.y < 480) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-idoso"];
        self.popUpView = popUp;
        [popUp showInView:self.view animated:YES];
        self.badgeIdoso.image = [UIImage imageNamed:@"badge-idoso-color"];
        self.badgeTransito.image = [UIImage imageNamed:@"badge-transito-color"];
    }
}

- (IBAction)didClickVoltarButton:(id)sender {
    if ([_delegate respondsToSelector:@selector(askedToDismissThirdPhase)]) {
        [_delegate askedToDismissThirdPhase];
    }
}

-(IBAction)didTappedVoiceStory:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:_path];
}
@end
