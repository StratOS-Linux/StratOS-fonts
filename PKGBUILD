# Maintainer: ZeStig <zestig@duck.com>
pkgname=stratos-fonts
pkgver=1.0
pkgrel=1
pkgdesc="Collection of free and nonfree fonts for StratOS"
arch=('any')
license=('GPL3')
source=()
noextract=()
depends=('fontconfig')
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

