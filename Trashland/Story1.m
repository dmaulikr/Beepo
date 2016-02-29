#import "Story1.h"
#import "UIView+Animation2.h"
#import "Phase1.h"
#import "MiscellaneousAudio.h"

@interface Story1() <Phase1Delegate>

@property (weak, nonatomic) IBOutlet UIPageControl* controle;
@property (weak, nonatomic) IBOutlet UIImageView *gifDedo;
@property (weak, nonatomic) IBOutlet UIImageView *telaUm;
@property (weak, nonatomic) IBOutlet UIImageView *telaDois;
@property (weak, nonatomic) IBOutlet UIImageView *telaTres;
@property (weak, nonatomic) IBOutlet UIButton *buttonNarrar;
@property (strong, nonatomic) NSString *path;

@end

@implementation Story1

-(void) viewDidLoad{
    [super viewDidLoad];
    
    _path = [NSString stringWithFormat:@"%@/1_pre-sala01.mp3", [[NSBundle mainBundle] resourcePath]];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.telaUm.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"historinha-01@2x" ofType:@"png"]];
        self.telaDois.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"historinha-02@2x" ofType:@"png"]];
        self.telaTres.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"historinha-03@2x" ofType:@"png"]];
    });
    
    self.gifDedo.image = [UIImage animatedImageNamed:@"maoesq-" duration:1.f];
    self.gifDedo.alpha = 0.7;
    [self.view bringSubviewToFront:self.gifDedo];
}

-(void)swipe:(UISwipeGestureRecognizer *)swipeRecogniser{
    if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionLeft){
        switch (self.controle.currentPage) {
            case 0:
                _path = [NSString stringWithFormat:@"%@/2_pre-sala02.mp3", [[NSBundle mainBundle] resourcePath]];
                [self.buttonNarrar tada:NULL];
                [self moveLeft];
                self.controle.currentPage +=1;
                self.gifDedo.hidden = YES;
                break;
            case 1:
                 _path = [NSString stringWithFormat:@"%@/3_pre-sala03.mp3", [[NSBundle mainBundle] resourcePath]];
                [self.buttonNarrar tada:NULL];
                [self moveLeft];
                self.controle.currentPage +=1;
                break;
            case 2:
                [self start];
                break;
            default:
                break;
        }
    }
    else if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionRight){
        switch (self.controle.currentPage) {
            case 2:
                 _path = [NSString stringWithFormat:@"%@/2_pre-sala02.mp3", [[NSBundle mainBundle] resourcePath]];
                [self.buttonNarrar tada:NULL];
                [self moveRight];
                self.controle.currentPage -=1;
                break;
            case 1:
                  _path = [NSString stringWithFormat:@"%@/1_pre-sala01.mp3", [[NSBundle mainBundle] resourcePath]];
                [self.buttonNarrar tada:NULL];
                [self moveRight];
                self.controle.currentPage -=1;
                break;
            default:
                break;
        }
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationRepeatCount:9999.0];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView commitAnimations];
}

-(void)start{
    [self performSegueWithIdentifier:@"phase1Segue" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"phase1Segue"]) {
        Phase1 *vc = segue.destinationViewController;
        vc.delegate = self;
    }
}

- (void)moveLeft{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.02];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationRepeatAutoreverses:NO];
    self.telaUm.frame = CGRectMake(self.telaUm.frame.origin.x -  self.telaUm.frame.size.width
                                   , 0.0, self.telaUm.frame.size.width, self.telaUm.frame.size.height);
    self.telaDois.frame = CGRectMake(self.telaDois.frame.origin.x -  self.telaUm.frame.size.width
                                     , 0.0, self.telaDois.frame.size.width, self.telaDois.frame.size.height);
    self.telaTres.frame = CGRectMake(self.telaTres.frame.origin.x -  self.telaUm.frame.size.width
                                     , 0.0, self.telaTres.frame.size.width, self.telaTres.frame.size.height);
    
    
    [UIView commitAnimations];
}

- (void)moveRight{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.02];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationRepeatAutoreverses:NO];
    self.telaUm.frame = CGRectMake(self.telaUm.frame.origin.x +  self.telaUm.frame.size.width
                                   , 0.0, self.telaUm.frame.size.width, self.telaUm.frame.size.height);
    self.telaDois.frame = CGRectMake(self.telaDois.frame.origin.x +  self.telaUm.frame.size.width
                                     , 0.0, self.telaDois.frame.size.width, self.telaDois.frame.size.height);
    self.telaTres.frame = CGRectMake(self.telaTres.frame.origin.x +  self.telaUm.frame.size.width
                                     , 0.0, self.telaTres.frame.size.width, self.telaTres.frame.size.height);
    
    [UIView commitAnimations];
}

-(IBAction)didTappedBackButton:(id)sender{
    _path = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)didTappedForVoiceStory:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:_path];
}

- (void) askedToDismiss{
    _path = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
