Vue.component('my-header', {
    props: ['login'],
    template: `
    <div class="my-header">
        <div class="topbar-wrapper py-4">
            <div class="topbar-content w-75 mx-auto d-flex justify-content-between align-items-center">
                <div class="topbar-logo">
                    <h4 class="text-white mb-0">Phú Quốc Travel</h4>
                </div>
                <div class="topbar-menu d-flex flex-row justify-content-end text-white align-items-center">
                    <a href="#" class="menu-item">HOME</a>
                    <a href="#" class="menu-item">TRIPS</a>
                    <a href="#" class="menu-item">FOODS</a>
                    <a href="#" class="menu-item">HOTEL</a>
                    <a href="#" class="menu-item">CAR RENTALS</a>
                    <a href="#" class="menu-item">PROFILE</a>
                </div>
            </div>
        </div>
    </div>
    `
});

Vue.component('my-footer', {
    template: `
    <div class="my-footer">
        <div class="footer-wrapper py-4">
            <div class="footer-content w-75 mx-auto d-flex justify-content-between align-items-center">
                <div class="footer-info">
                    <h4 class="text-white mb-0">Let's travel together!</h4>
                </div>
                <div class="footer-icon">
                    <a href="#"><i class="fa fa-facebook-square m-3"></i></a>
                    <a href="#"><i class="fa fa-instagram m-3"></i></a>
                    <a href="#"><i class="fa fa-twitter-square m-3"></i></a>
                    <a href="#"><i class="fa fa-google-plus-square m-3"></i></a>
                    <a href="#"><i class="fa fa-dribbble m-3 mr-0"></i></a>
                </div>
            </div>
        </div>
        <div class="copyright text-center py-2 text-white">
            <span>Copyright © 2018 by <a href="homepage.html">PhuQuocTravel</a></span>
        </div>
    </div>
    `
});

Vue.component('top-destination', {
    props: ['item'],
    template: `
    <div class="top-item-image col-md-3">
        <img v-bind:src="item.image" alt="">
        <div class="intro-item-content d-flex flex-column align-items-center justify-content-center">
            <div class="intro-date">
                {{ item.datetime }}
            </div>
            <div class="intro-center text-center">
                <h3>{{ item.subname }}</h3>
                <h1>{{ item.name }}</h1>
                <div class="rating rating_4">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>
                <div class="intro-button mt-5">
                    <div class="button-bcg"></div>
                    <a href="#">Xem thêm ...</a>   
                </div>
            </div>
        </div>
    </div>
    `
});

Vue.component('list-hotel', {
    props: ['item'],
    template: `
    <div class="hotel-item col-md-6">
        <div class="d-flex">
            <div class="hotel-images-wapper">
                <div class="hotel-item-image position-relative">
                    <img v-bind:src="item.image" alt="">
                        <span class="hotel-name">{{item.name}}</span>
                </div>
            </div>
            <div class="hotel-information-wapper">
                <div class="hotel-item-content">
                    <div class="prices">
                        {{item.price}}
                        <span>per night</span>
                    </div>
                    <div class="rating rating_4">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <div class="describle">
                        <span>{{item.content}}</span>
                    </div>
                    <div class="standard-icon">
                        <div class="icon-note">
                            <img src="asset/icon/wifi-connection-signal-symbol.png">
                            <div class="note-hover">
                                Free wifi
                            </div>
                        </div>
                        <div class="icon-note">
                            <img src="asset/icon/sunbed.png">
                            <div  class="note-hover">
                                Gần biển
                            </div>
                        </div>
                        <div class="icon-note">
                            <img src="asset/icon/swimming-silhouette.png">
                            <div class="note-hover">
                                Hồ bơi
                            </div>
                        </div>
                        <div class="icon-note">
                            <img src="asset/icon/shuffer-bus.png">
                            <div class="note-hover">
                                Đưa đón tại sân bay
                            </div>
                        </div>                                                               
                    </div>
                    <div class="intro-button style-intro-button mt-4">
                        <div class="button-bcg "></div>
                        <a href="#">Xem thêm ...</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    `
});