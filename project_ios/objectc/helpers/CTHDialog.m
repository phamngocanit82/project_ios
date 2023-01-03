#import "DGActivityIndicatorView.h"
#import "CTHHelper.h"
#import "CTHPlatform.h"
#import "Constant.h"
#import "CTCButton.h"
#import "CTCView.h"
#import "CTCLabel.h"
#import "CTHDGActivityIndicator.h"
#import "CTHUserDefined.h"
#import "CTHDialog.h"
#import "CTHLanguage.h"
@implementation CTHDialog
+(instancetype)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
-(void)alert:(id)delegate Title:(NSString*)title Message:(NSString*)message ActionArray:(NSArray*)actionArray{
    self.delegate = delegate;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (NSInteger i=0; i<[actionArray count]; i++) {
        UIAlertAction* action = [UIAlertAction actionWithTitle:[actionArray objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(alertView:)]) {
                [self.delegate alertView:i];
            }
        }];
        [alertController addAction:action];
    }
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}
//Loading
-(void)waitShowLoading{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showLoading) object:nil];
    [self performSelector:@selector(showLoading) withObject:nil afterDelay:0.2];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(checkShowLoading) object:nil];
    [self performSelector:@selector(checkShowLoading) withObject:nil afterDelay:30];
}
-(void)checkShowLoading{
    [self hideLoading];
}
-(void)showLoading{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(checkShowLoading) object:nil];
    [self performSelector:@selector(checkShowLoading) withObject:nil afterDelay:30];
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_LOADING withView:navigationController.view kind:[UIView class]];
    if(view != nil)
        return;
    view = [CTHHelper controlFromNib:@"CTHDialog" RestorationIdentifier:@"loading"];
    if(view == nil)
        return;
    /*for(UIControl *control in view.subviews){
        if ([control isKindOfClass:[CTCCircleChart class]]) {
            CTCCircleChart *circleChart= (CTCCircleChart*)control;
            circleChart.backgroundColor = [UIColor clearColor];
            circleChart.percent = 100;
            circleChart.duration = 0.01;
            [circleChart drawAnimation];
            break;
        }
    }*/
    view.frame = CGRectMake(0, 0, CTHPlatform.getWidth, CTHPlatform.getHeight);
    view.tag = TAG_VIEW_LOADING;
    
    CGFloat ratio = 100/50;
    DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallPulse tintColor:[CTHHelper colorFromHexString:[UIColor clearColor] HexString:@"#00bb00"]];
    activityIndicatorView.tag = 1000;
    activityIndicatorView.size = 25*ratio;
    CGFloat width = CTHPlatform.getWidth / 5.0f;
    CGFloat height = CTHPlatform.getHeight / 7.0f;
    
    activityIndicatorView.frame = CGRectMake((view.frame.size.width-width)/2, (view.frame.size.height-height)/2, width, height);
    [view addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    [navigationController.view addSubview:view];
    [navigationController.view bringSubviewToFront:view];
}
-(void)showReconnecting{
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_LOADING withView:navigationController.view kind:[UIView class]];
    if(view != nil){
        CTCLabel *label = (CTCLabel*)[CTHHelper controlFromTag:1 withView:view kind:[CTCLabel class]];
        if(label != nil){
            label.hidden = NO;
            [label changeText:[CTHLanguage language:@"reconnecting to milo band" Text:@"Reconnecting to  Champ Band..."]];
        }
    }
}
-(void)showSynchronizing{
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_LOADING withView:navigationController.view kind:[UIView class]];
    if(view != nil){
        CTCLabel *label = (CTCLabel*)[CTHHelper controlFromTag:1 withView:view kind:[CTCLabel class]];
        if(label != nil){
            label.hidden = NO;
            [label changeText:[CTHLanguage language:@"synchronizing data from milo band" Text:@"Synchronizing data from Champ Band..."]];
        }
    }
}
-(void)showLoadingAlways{
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_LOADING withView:navigationController.view kind:[UIView class]];
    if(view != nil)
        return;
    view = [CTHHelper controlFromNib:@"CTHDialog" RestorationIdentifier:@"loading"];
    if(view == nil)
        return;
    /*for(UIControl *control in view.subviews){
        if ([control isKindOfClass:[CTCCircleChart class]]) {
            CTCCircleChart *circleChart= (CTCCircleChart*)control;
            circleChart.backgroundColor = [UIColor clearColor];
            circleChart.percent = 100;
            circleChart.duration = 0.01;
            [circleChart drawAnimation];
            break;
        }
    }*/
    view.frame = CGRectMake(0, 0, CTHPlatform.getWidth, CTHPlatform.getHeight);
    view.tag = TAG_VIEW_LOADING;
    
    CGFloat ratio = 100/50;
    DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallPulse tintColor:[CTHHelper colorFromHexString:[UIColor clearColor] HexString:@"#00bb00"]];
    activityIndicatorView.tag = 1000;
    activityIndicatorView.size = 25*ratio;
    CGFloat width = CTHPlatform.getWidth / 5.0f;
    CGFloat height = CTHPlatform.getHeight / 7.0f;
    
    activityIndicatorView.frame = CGRectMake((view.frame.size.width-width)/2, (view.frame.size.height-height)/2, width, height);
    [view addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    [navigationController.view addSubview:view];
}
-(void)hideLoading{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showLoading) object:nil];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(checkShowLoading) object:nil];
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_LOADING withView:navigationController.view kind:[UIView class]];
    if(view == nil)
        return;
    CTCLabel *label = (CTCLabel*)[CTHHelper controlFromTag:1 withView:view kind:[CTCLabel class]];
    if(label != nil){
        label.hidden = YES;
    }
    [view removeFromSuperview];
}
//Photo camera
-(void)actionCamera:(id)delegate{
    self.delegate = delegate;
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_CAMERA withView:navigationController.view kind:[UIView class]];
    if(view != nil)
        return;
    view = [CTHHelper controlFromNib:@"CTHDialog" RestorationIdentifier:@"camera"];
    if(view == nil)
        return;
    if (!self.imgArray)
        self.imgArray = [[NSMutableArray alloc] initWithCapacity:0];
    [self.imgArray removeAllObjects];
    
    CTCButton *button = (CTCButton*)[CTHHelper controlFromTag:2 withView:view kind:[CTCButton class]];
    if(button != nil && [button isKindOfClass:[CTCButton class]]){
        [button addTarget:self action:@selector(closeCamera) forControlEvents:UIControlEventTouchUpInside];
    }
    CTCView *controlsView = (CTCView*)[CTHHelper controlFromTag:1 withView:view kind:[CTCView class]];
    if(controlsView == nil || ![controlsView isKindOfClass:[CTCView class]])
        return;
    
    button = (CTCButton*)[CTHHelper controlFromTag:1 withView:controlsView kind:[CTCButton class]];
    if(button != nil && [button isKindOfClass:[CTCButton class]]){
        if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            button.enabled = NO;
            [button setTitleColor:[CTHHelper colorFromHexString:[UIColor clearColor] HexString:CTHUserDefined.GRAY_COLOR] forState:UIControlStateNormal];
        }
        [button addTarget:self action:@selector(actionTakePhoto) forControlEvents:UIControlEventTouchUpInside];
    }
    button = (CTCButton*)[CTHHelper controlFromTag:2 withView:controlsView kind:[CTCButton class]];
    if(button != nil && [button isKindOfClass:[CTCButton class]]){
        [button addTarget:self action:@selector(actionCameraRoll) forControlEvents:UIControlEventTouchUpInside];
    }
    
    view.frame = CGRectMake(0, 0, CTHPlatform.getWidth, CTHPlatform.getHeight);
    view.tag = TAG_VIEW_CAMERA;
    view.alpha = 0;
    view.userInteractionEnabled = NO;
    [navigationController.view addSubview:view];
    [CTHHelper animation:^{
        view.alpha = 1;
    }];
    [controlsView setTransform:CGAffineTransformMakeScale(0.0, 0.0)];
    [CTHHelper animationWithVelocity:^{
        [controlsView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
    } completion:^{
        view.userInteractionEnabled = YES;
    }];
}
-(void)actionTakePhoto{
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePickerController.delegate = self;
    self.imagePickerController.allowsEditing = YES;
    [navigationController presentViewController:self.imagePickerController animated:YES completion:nil];
    [self closeCamera];
}
-(void)actionCameraRoll{
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePickerController.delegate = self;
    self.imagePickerController.allowsEditing = YES;
    [navigationController presentViewController:self.imagePickerController animated:YES completion:nil];
    [self closeCamera];
}
-(void)closeCamera{
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_CAMERA withView:navigationController.view kind:[UIView class]];
    if(view == nil)
        return;
    view.userInteractionEnabled = NO;
    CTCView *controlsView = (CTCView*)[CTHHelper controlFromTag:1 withView:view kind:[CTCView class]];
    if(controlsView == nil || ![controlsView isKindOfClass:[CTCView class]])
        return;
    [controlsView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
    [CTHHelper animation:^{
        [controlsView setTransform:CGAffineTransformMakeScale(0.0001, 0.0001)];
    } completion:^{
        [CTHHelper animation:^{
            view.alpha = 0;
        } completion:^{
            [view removeFromSuperview];
        }];
    }];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
    img = [CTHHelper fixrotation:img];
    if (!self.imgArray)
        self.imgArray = [[NSMutableArray alloc]initWithCapacity:0];
    NSData *someImageData = UIImageJPEGRepresentation(img, 0.8);
    [self.imgArray addObject:someImageData];
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    [navigationController dismissViewControllerAnimated:YES completion:^{ }];
    self.imagePickerController = nil;
    if (self.delegate && [self.delegate respondsToSelector:@selector(photoCompleted:)]) {
        [self.delegate photoCompleted:self];
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    if (self.imagePickerController) {
        UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
        [navigationController dismissViewControllerAnimated:YES completion:^{ }];
        self.imagePickerController = nil;
    }
}
-(void)clearImages{
    [self.imgArray removeAllObjects];
}
-(void)actionAvatar:(UIButton*)sender{
    [self closeBuildAvatar];
    if (self.delegate && [self.delegate respondsToSelector:@selector(actionAvatar:)]) {
        [self.delegate actionAvatar:self];
    }
}
-(void)closeBuildAvatar{
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *contentView = navigationController.view;
    NSArray *subviews = [contentView subviews];
    for (UIView *subview in subviews) {
        if(subview.tag == TAG_VIEW_BUILD_AVATAR){
            [subview removeFromSuperview];
            return;
        }
    }
    subviews = nil;
}
//Show Dialog
-(void)showDialogOk:(id)delegate Title:(NSString*)title Message:(NSString*)message TextOk:(NSString*)textOk{
    self.delegate = delegate;
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_DIALOG withView:navigationController.view kind:[UIView class]];
    if(view != nil)
        [view removeFromSuperview];
    view = [CTHHelper controlFromNib:@"CTHDialog" RestorationIdentifier:@"build_dialog"];
    if(view == nil)
        return;
    [view endEditing:YES];
    
    CTCView *controlsView = (CTCView*)[CTHHelper controlFromTag:1 withView:view kind:[CTCView class]];
    if(controlsView == nil || ![controlsView isKindOfClass:[CTCView class]])
        return;
    CTCLabel *label = (CTCLabel*)[CTHHelper controlFromTag:1 withView:controlsView kind:[CTCLabel class]];
    if(label == nil || ![label isKindOfClass:[CTCLabel class]])
        return;
    label.text = title;
    
    label = (CTCLabel*)[CTHHelper controlFromTag:2 withView:controlsView kind:[CTCLabel class]];
    if(label == nil || ![label isKindOfClass:[CTCLabel class]])
        return;
    label.text = message;
    
    CTCButton *button = (CTCButton*)[CTHHelper controlFromTag:3 withView:controlsView kind:[CTCButton class]];
    if(button == nil || ![button isKindOfClass:[CTCButton class]])
        return;
    [button setTitle:textOk forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeDialogOk) forControlEvents:UIControlEventTouchUpInside];
    button.hidden = NO;
    
    [view setNeedsLayout];
    [view layoutIfNeeded];
    
    CGFloat height = button.frame.origin.y + button.frame.size.height;
    NSLayoutConstraint *heightViewLayoutConstraint = [controlsView.constraints objectAtIndex:0];
    heightViewLayoutConstraint.constant = height + 10;
    
    [view setNeedsLayout];
    [view layoutIfNeeded];
    
    view.tag = TAG_VIEW_DIALOG;
    view.frame = CGRectMake(0, 0, CTHPlatform.getWidth, CTHPlatform.getHeight);
    view.alpha = 0;
    [navigationController.view addSubview:view];
    [CTHHelper animation:^{
        view.alpha = 1;
    }];
    [controlsView setTransform:CGAffineTransformMakeScale(0.0, 0.0)];
    [CTHHelper animationWithVelocity:^{
        [controlsView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
    } completion:^{
    }];
}
-(void)closeDialogOk{
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_DIALOG withView:navigationController.view kind:[UIView class]];
    if(view == nil)
        return;
    CTCView *controlsView = (CTCView*)[CTHHelper controlFromTag:1 withView:view kind:[CTCView class]];
    if(controlsView == nil || ![controlsView isKindOfClass:[CTCView class]])
        return;
    [controlsView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
    [CTHHelper animation:^{
        [controlsView setTransform:CGAffineTransformMakeScale(0.0001, 0.0001)];
    } completion:^{
        [CTHHelper animation:^{
            view.alpha = 0;
        } completion:^{
            [view removeFromSuperview];
        }];
    }];
    if (self.delegate && [self.delegate respondsToSelector:@selector(dialogOkCompleted:)]) {
        [self.delegate dialogOkCompleted:self];
    }
}
-(void)showBlackDialogOk:(id)delegate Message:(NSString*)message TextOk:(NSString*)textOk{
    self.delegate = delegate;
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_DIALOG withView:navigationController.view kind:[UIView class]];
    if(view != nil)
        [view removeFromSuperview];
    view = [CTHHelper controlFromNib:@"CTHDialog" RestorationIdentifier:@"build_black_dialog"];
    if(view == nil)
        return;
    [view endEditing:YES];
    
    CTCView *controlsView = (CTCView*)[CTHHelper controlFromTag:1 withView:view kind:[CTCView class]];
    if(controlsView == nil || ![controlsView isKindOfClass:[CTCView class]])
        return;
    
    CTCLabel *label = (CTCLabel*)[CTHHelper controlFromTag:2 withView:controlsView kind:[CTCLabel class]];
    if(label == nil || ![label isKindOfClass:[CTCLabel class]])
        return;
    label.text = message;
    
    CTCButton *button = (CTCButton*)[CTHHelper controlFromTag:3 withView:controlsView kind:[CTCButton class]];
    if(button == nil || ![button isKindOfClass:[CTCButton class]])
        return;
    [button setTitle:textOk forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeDialogOk) forControlEvents:UIControlEventTouchUpInside];
    button.hidden = NO;
    
    [view setNeedsLayout];
    [view layoutIfNeeded];
    
    CGFloat height = button.frame.origin.y + button.frame.size.height;
    NSLayoutConstraint *heightViewLayoutConstraint = [controlsView.constraints objectAtIndex:0];
    heightViewLayoutConstraint.constant = height + 20;
    
    [view setNeedsLayout];
    [view layoutIfNeeded];
    
    view.tag = TAG_VIEW_DIALOG;
    view.frame = CGRectMake(0, 0, CTHPlatform.getWidth, CTHPlatform.getHeight);
    view.alpha = 0;
    [navigationController.view addSubview:view];
    [CTHHelper animation:^{
        view.alpha = 1;
    }];
    [controlsView setTransform:CGAffineTransformMakeScale(0.0, 0.0)];
    [CTHHelper animationWithVelocity:^{
        [controlsView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
    } completion:^{
    }];
}
-(void)showDialogYesNo:(id)delegate Title:(NSString*)title Message:(NSString*)message TextYes:(NSString*)textYes TextNo:(NSString*)textNo{
    self.delegate = delegate;
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_DIALOG withView:navigationController.view kind:[UIView class]];
    if(view != nil)
        [view removeFromSuperview];
    view = [CTHHelper controlFromNib:@"CTHDialog" RestorationIdentifier:@"build_dialog"];
    if(view == nil)
        return;
    [view endEditing:YES];
    CTCView *controlsView = (CTCView*)[CTHHelper controlFromTag:1 withView:view kind:[CTCView class]];
    if(controlsView == nil || ![controlsView isKindOfClass:[CTCView class]])
        return;
    
    CTCLabel *label = (CTCLabel*)[CTHHelper controlFromTag:1 withView:controlsView kind:[CTCLabel class]];
    if(label == nil || ![label isKindOfClass:[CTCLabel class]])
        return;
    label.text = title;
    
    label = (CTCLabel*)[CTHHelper controlFromTag:2 withView:controlsView kind:[CTCLabel class]];
    if(label == nil || ![label isKindOfClass:[CTCLabel class]])
        return;
    label.text = message;
    
    CTCView *controlsView2 = (CTCView*)[CTHHelper controlFromTag:4 withView:controlsView kind:[CTCView class]];
    if(controlsView2 == nil || ![controlsView2 isKindOfClass:[CTCView class]])
        return;
    
    
    CTCButton *button = (CTCButton*)[CTHHelper controlFromTag:1 withView:controlsView2 kind:[CTCButton class]];
    if(button == nil || ![button isKindOfClass:[CTCButton class]])
        return;
    [button setTitle:textYes forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeDialogYes) forControlEvents:UIControlEventTouchUpInside];
    
    button = (CTCButton*)[CTHHelper controlFromTag:2 withView:controlsView2 kind:[CTCButton class]];
    if(button == nil || ![button isKindOfClass:[CTCButton class]])
        return;
    [button setTitle:textNo forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeDialogNo) forControlEvents:UIControlEventTouchUpInside];
    
    [view setNeedsLayout];
    [view layoutIfNeeded];
    
    CGFloat height = controlsView2.frame.origin.y + controlsView2.frame.size.height;
    NSLayoutConstraint *heightViewLayoutConstraint = [controlsView.constraints objectAtIndex:0];
    heightViewLayoutConstraint.constant = height + 15;
    
    [view setNeedsLayout];
    [view layoutIfNeeded];
    
    view.tag = TAG_VIEW_DIALOG;
    view.frame = CGRectMake(0, 0, CTHPlatform.getWidth, CTHPlatform.getHeight);
    [navigationController.view addSubview:view];
    controlsView2.hidden = NO;
}
-(void)closeDialogYes{
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_DIALOG withView:navigationController.view kind:[UIView class]];
    if(view != nil)
        [view removeFromSuperview];
    if (self.delegate && [self.delegate respondsToSelector:@selector(dialogYesCompleted:)]) {
        [self.delegate dialogYesCompleted:self];
    }
}
-(void)closeDialogNo{
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_DIALOG withView:navigationController.view kind:[UIView class]];
    if(view != nil)
        [view removeFromSuperview];
    if (self.delegate && [self.delegate respondsToSelector:@selector(dialogNoCompleted:)]) {
        [self.delegate dialogNoCompleted:self];
    }
}
-(void)hideDialog{
    UINavigationController *navigationController = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UIView *view = [CTHHelper controlFromTag:TAG_VIEW_DIALOG withView:navigationController.view kind:[UIView class]];
    if(view != nil)
        [view removeFromSuperview];
}
-(void)showIndicatorView:(UIControl*)control Color:(UIColor*)color{
    [CTHDGActivityIndicator showIndicatorView:control Color:color];
}
-(void)hideIndicatorView:(UIControl*)control{
    [CTHDGActivityIndicator hideIndicatorView:control];
}
@end
