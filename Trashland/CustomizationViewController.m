#import "CustomizationViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PhasesViewController.h"
#import "Player.h"

@interface CustomizationViewController () <PhasesViewControllerDelegate>

@property (nonatomic, weak) PhasesViewController *phasesViewContoller;

@end

@implementation CustomizationViewController{
    BOOL primeira;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    primeira = true;
    Player *player = [Player sharedManager];
    player.gasperEscolhido = [UIImage imageNamed:@"fantasminha"];
    [[self.item1 layer] setBorderWidth:2.0f];
    [[self.item2 layer] setBorderWidth:2.0f];
    [[self.item3 layer] setBorderWidth:2.0f];
    [[self.item1 layer] setBorderColor:[UIColor colorWithRed:236.f green:65.f blue:72.f alpha:1.f].CGColor];
    [[self.item2 layer] setBorderColor:[UIColor colorWithRed:236.f green:65.f blue:72.f alpha:1.f].CGColor];
    [[self.item3 layer] setBorderColor:[UIColor colorWithRed:236.f green:65 blue:72 alpha:1].CGColor];
    [[self.item1 layer] setCornerRadius:5.0f];
    [[self.item2 layer] setCornerRadius:5.0f];
    [[self.item3 layer] setCornerRadius:5.0f];
    
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipped:)];
    [self.view addGestureRecognizer:swipeRecognizer];
}

-(IBAction)didTappedChangeArrow:(id)sender{
    [self requestedCustomChange];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.6 delay:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^(void){
    
        [UIView setAnimationRepeatCount:9999.0];
        [UIView setAnimationRepeatAutoreverses:YES];
       
        CGRect charFrame = self.gasper.frame;
        charFrame.origin.y = charFrame.origin.y - 45.0;
        charFrame.size.height = charFrame.size.height + 15.0;
        
        CGRect shadowFrame = self.sombra.frame;
        shadowFrame.size.width = shadowFrame.size.width/2.0;
        shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
        
        self.gasper.frame = charFrame;
        self.sombra.frame = shadowFrame;
        
    } completion:^(BOOL finished){}];
}

-(IBAction)didTappedFirstOption:(id)sender{
    Player *player = [Player sharedManager];
    if (primeira == true) {
        player.gasperEscolhido = [UIImage imageNamed:@"custom15"];
        self.gasper.image = [UIImage imageNamed:@"custom15"];
        
    } else{
        player.gasperEscolhido = [UIImage imageNamed:@"custom18"];
        self.gasper.image = [UIImage imageNamed:@"custom18"];
    }
}

-(IBAction)didTappedSecondOption:(id)sender{
    Player *player = [Player sharedManager];
    if (primeira == true) {
        player.gasperEscolhido = [UIImage imageNamed:@"custom16"];
        self.gasper.image = [UIImage imageNamed:@"custom16"];
        
    } else{
        player.gasperEscolhido = [UIImage imageNamed:@"custom19"];
        self.gasper.image = [UIImage imageNamed:@"custom19"];
    }
}

-(IBAction)didTappedThirdOption:(id)sender{
    Player *player = [Player sharedManager];
    if (primeira == true) {
        self.gasper.image = [UIImage imageNamed:@"custom17"];
        player.gasperEscolhido = [UIImage imageNamed:@"custom17"];
    } else{
        player.gasperEscolhido = [UIImage imageNamed:@"custom20"];
        self.gasper.image = [UIImage imageNamed:@"custom20"];
    }
}

-(void)didSwipped:(UISwipeGestureRecognizer *)swipeRecogniser{
    [self requestedCustomChange];
}

-(IBAction)didTappedStartButton:(id)sender{
    [self performSegueWithIdentifier:@"playSegue" sender:self];
}

-(IBAction)didTappedBackButton:(id)sender{
    if ([_delegate respondsToSelector:@selector(askedToDismissCustomization)]) {
        [_delegate askedToDismissCustomization];
    }
}

- (void) requestedCustomChange{
    if (primeira == true) {
        primeira = false;
        self.item1.image = [UIImage imageNamed:@"custom05"];
        self.item2.image = [UIImage imageNamed:@"custom06"];
        self.item3.image = [UIImage imageNamed:@"custom04"];
    } else{
        primeira = true;
        self.item1.image = [UIImage imageNamed:@"custom01"];
        self.item2.image = [UIImage imageNamed:@"custom02"];
        self.item3.image = [UIImage imageNamed:@"custom03"];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"playSegue"]) {
        _phasesViewContoller = segue.destinationViewController;
        _phasesViewContoller.delegate = self;
    }
}

- (void) askedToDismissPhases{
    [_phasesViewContoller dismissViewControllerAnimated:YES completion:nil];
}

@end
