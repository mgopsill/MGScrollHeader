# MGScrollHeader
iOS Fixed Height Scrollable Header with Fade. The header scrolls up to the navigation bar height. 

<img src="https://github.com/mgopsill/MGScrollHeader/blob/master/Gifs/MGScrollableHeaderDefault.gif" width="260">

## Usage
Creating a `TableViewControllerWithHeader` will create the default `tableView` with a `ScrollableHeaderView`.

In the `ScrollableHeaderView`, edit the `setupTitle()`, `setupSubtitle()` and `setupBackground` functions to configure.

To use an image and fade the image to a background color as shown:

<img src="https://github.com/mgopsill/MGScrollHeader/blob/master/Gifs/MGScrollableHeaderImage.gif" width="260">

Set the image and background color in `ScrollableHeaderView`:
```Swift
private func setupBackground() {
        backgroundImageView = UIImageView(image: UIImage(named: "minimal"))
        backgroundColor = UIColor(red: 0.72, green: 0.80, blue: 0.35, alpha: 1.0)
    }
```

Then set the `fadeImage` property to true:
`scrollableHeaderView.fadeImage = true`

To adjust the size of the header view heights, scroll and transparency affect edit the constraint ranges: 
```Swift
private let constraintRangeForHeaderView = (CGFloat(-254)..<CGFloat(0))
private let constraintRangeForHeaderTransparency = (CGFloat(-200)..<CGFloat(0))
```
<img src="https://github.com/mgopsill/MGScrollHeader/blob/master/Gifs/MGScrollableHeaderLarger.gif" width="260">

