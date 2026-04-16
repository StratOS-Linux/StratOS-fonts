# Maintainer: ZeStig <zestig@duck.com>
pkgname=stratos-fonts
pkgver=1.0
pkgrel=5
pkgdesc="Collection of free and nonfree fonts for StratOS"
arch=('any')
license=('GPL3')
source=()
noextract=()
depends=('fontconfig' 'ttf-jetbrains-mono' 'ttf-jetbrains-mono-nerd')
optdepends=(
    'noto-fonts-emoji: adds emoji support'
    'noto-fonts: provides wide Unicode coverage for multiple languages'
    'ttf-font-awesome: adds icon fonts for UI and development use'
    'ttf-liberation: provides metric-compatible alternatives to common proprietary fonts'
    'ttf-dejavu: offers extended Latin, Greek and Cyrillic character support'
)
provides=('fonts' 'stratos-fonts')
conflicts=()
install=stratos-fonts.install
backup=()
options=()

prepare() {
    cp -r $startdir/usr $srcdir/usr/
}

package() {
    install -d $pkgdir/usr/share/
    cp -r $srcdir/usr/share/fonts/ $pkgdir/usr/share/fonts/
}

