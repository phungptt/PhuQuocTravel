Vue.component('my-header', {
    props: ['login'],
    template: `
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                        Dropdown
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li>
                <li class="nav-item" v-if="login == false">
                    Đăng nhập
                </li> 
                <li class="nav-item" v-else>
                    Xin chào
                </li> 
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    `
});

Vue.component('my-footer', {
    template: `
    <div class="container">
        <span class="text-muted">Copyright 2018 | Du lịch Phú Quốc</span>
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
                            <img src="asset/wifi-connection-signal-symbol.png">
                            <div class="note-hover">
                                Free wifi
                            </div>
                        </div>
                        <div class="icon-note">
                            <img src="asset/sunbed.png">
                            <div  class="note-hover">
                                Gần biển
                            </div>
                        </div>
                        <div class="icon-note">
                            <img src="asset/swimming-silhouette.png">
                            <div class="note-hover">
                                Hồ bơi
                            </div>
                        </div>
                        <div class="icon-note">
                            <img src="asset/shuffer-bus.png">
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